//
//  RootViewModel.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 01.08.2022.
//

import Combine
import PassKit

protocol RootViewModelProtocol: ViewModel where ViewState == RootState, UserIntent == RootIntent {}

public enum PaymentFlowFinishedReason {
    case byUser
    case withError(CoreError)
    case success(Payment?)
    case decline(Payment?)
}

public typealias PaymentFlowCompletion = (_ reason: PaymentFlowFinishedReason) -> Void

class RootViewModel: RootViewModelProtocol {
    @Injected var payInteractor: PayInteractor?
    @Injected var payRequestFactory: PayRequestFactory?
    @Injected var cardRemoveInteractor: CardRemoveInteractor?
    @Injected var cardExpiryFabric: CardExpiryFabric?

    let applePayService = ApplePayService.shared

    let futureData: AnyPublisher<InitEvent, CoreError>

    var cancellables: Set<AnyCancellable> = []
    var onFlowFinished: PaymentFlowCompletion

    init(paymentOptions: PaymentOptions,
         futureData: AnyPublisher<InitEvent, CoreError>,
         onFlowFinished: @escaping PaymentFlowCompletion) {
        self.futureData = futureData
        self.onFlowFinished = onFlowFinished
        self.state = RootState(paymentOptions: paymentOptions, savedValues: [:])
        subscribeInit()
    }

    func subscribeInit() {
        state.isLoading = true
        self.futureData
            .sink(receiveCompletion: { [weak self] completion in
                if case let .failure(error) = completion {
                    self?.state.alertModel = .FinalError(error, onClose: { self?.onFlowFinished(.withError(error)) })
                }
            }, receiveValue: { [weak self] event in
                guard let self = self else { return }
                self.state.isLoading = false
                switch event {
                case .onInitReceived(paymentMethods: let paymentMethods, savedAccounts: let accounts):
                    let accounts = self.state.paymentOptions.action == .Tokenize ? [] : accounts
                    
                    let methods: [PaymentMethod]
                    if self.state.paymentOptions.action == .Tokenize || self.state.isTokenSale {
                        methods = paymentMethods.filter { $0.methodType == .card }
                    } else if self.applePayService.isAvailable {
                        methods = paymentMethods
                    } else {
                        // выкидываем applePay если он не поддерживается на устройстве
                        methods = paymentMethods.filter { $0.methodType != .applePay }
                    }
                    
                    if methods.isEmpty && accounts.isEmpty {
                        self.state.alertModel = .FinalError(.methodsListEmpty, onClose: {
                            [weak self] in self?.onFlowFinished(.withError(.methodsListEmpty))
                        })
                    } else {
                        self.state = modifiedCopy(of: self.state) {
                            $0.availablePaymentMethods = methods
                            $0.savedAccounts = $0.cardPaymentMethod != nil ? accounts : []
                        }
                        self.state.currentMethod = {
                            if let cardPaymentMethod = self.state.cardPaymentMethod {
                                if !accounts.isEmpty {
                                    return PaymentMethodsListEntity(entityType: .savedAccount(accounts.first!))
                                } else {
                                    return PaymentMethodsListEntity(entityType: .paymentMethod(cardPaymentMethod))
                                }
                            } else {
                                return self.state.mergedList.first
                            }
                        }()
                    }
                case .onPaymentRestored(let payment):
                    self.state.isLoading = false
                    self.state.payment = payment
                    if let paymentMethod = self.state.availablePaymentMethods?.first(where: { paymentMethod in
                        payment.method == paymentMethod.code
                    }) {
                        self.restore(payment: payment, with: paymentMethod)
                    } else {
                        self.state.alertModel = .FinalError(.unavailableMethod(for: payment), onClose: {
                            [weak self] in self?.onFlowFinished(.withError(.unavailableMethod(for: payment)))
                        })
                    }
                }
            })
            .store(in: &cancellables)
    }

    var state: RootState {
        willSet {
            objectWillChange.send()
        }
        didSet {
            statePublisherSubject.send(state)
        }
    }

    var statePublisherSubject = PassthroughSubject<RootState, Never>()

    var statePublisher: AnyPublisher<RootState, Never> {
        statePublisherSubject.eraseToAnyPublisher()
    }

    func dispatch(intent: RootIntent) {
        switch intent {
        case .paymentMethodsScreenIntent(.close),
                .initialLoadingScreenIntent(.close),
                .customerFieldsScreenIntent(.close),
                .clarificationFieldsScreenIntent(.close),
                .threeDSecureScreenIntent(.close),
                .apsScreenIntent(.close),
                .loadingScreenIntent(.close),
                .navigationIntent(.close),
                .declineScreenIntent(.closeTryAgain):
            state.alertModel = .CloseWarning(confirmClose: { [weak self] in
                guard let self = self else { return }
                
                self.cancellables.forEach {  $0.cancel() }
                
                switch self.state.finalPaymentState {
                case .Success: self.onFlowFinished(.success(self.state.payment))
                case .Decline: self.onFlowFinished(.decline(self.state.payment))
                case .none: self.onFlowFinished(.byUser)
                }
            })
        case .declineScreenIntent(.close):
            self.onFlowFinished(.decline(state.payment))
        case .declineScreenIntent(.tryAgain):
            let methods = state.availablePaymentMethods?.filter {
                $0.code == state.currentPaymentMethod?.code
            } ?? []

            state = modifiedCopy(of: state) {
                $0.isLoading = false
                $0.savedAccounts = $0.currentPaymentMethod?.methodType == .card ? $0.savedAccounts : []
                $0.availablePaymentMethods = methods
                $0.payment = nil
                $0.customerFields = nil
                $0.clarificationFields = nil
                $0.alertModel = nil
                $0.finalPaymentState = nil
                $0.threeDSecurePageState = nil
                $0.savedValues = [:]
            }

            state.currentMethod = {
                if let cardPaymentMethod = self.state.cardPaymentMethod {
                    if let account = state.savedAccounts?.first {
                        return PaymentMethodsListEntity(entityType: .savedAccount(account))
                    } else {
                        return PaymentMethodsListEntity(entityType: .paymentMethod(cardPaymentMethod))
                    }
                } else {
                    return state.mergedList.first
                }
            }()
        case .successScreenIntent(.close):
            self.onFlowFinished(.success(state.payment))
        case .paymentMethodsScreenIntent(.tokenizeSale(let cvv, let customerFields)):
            guard let payRequestFactory = payRequestFactory else {
                return
            }
            
            let request = payRequestFactory.createTokenizeSaleRequest(
                cvv: cvv,
                customerFields: composeFieldValuesForCardSale(from: customerFields),
                recipientInfo: state.paymentOptions.recipientInfo
            )
            
            state.isLoading = true
            execute(payRequest: request)
        case .paymentMethodsScreenIntent(.paySavedAccountWith(id: let id, cvv: let cvv, customerFields: let formVlues)):
            guard let payRequestFactory = payRequestFactory else {
                return
            }

            let request = payRequestFactory.createSavedCardSaleRequest(
                cvv: cvv,
                accountId: id,
                customerFields: composeFieldValuesForCardSale(from: formVlues),
                recipientInfo: state.paymentOptions.recipientInfo
            )
            state.isLoading = true
            execute(payRequest: request)
        case .paymentMethodsScreenIntent(.payNewCardWith(cvv: let cvv,
                                                         pan: let pan,
                                                         year: let year,
                                                         month: let month,
                                                         cardHolder: let cardHolder,
                                                         saveCard: let saveCard,
                                                         customerFields: let formVlues)):
            guard let payRequestFactory = payRequestFactory else {
                return
            }

            let request = payRequestFactory.createNewCardSaleRequest(
                cvv: cvv,
                pan: pan,
                year: year + 2000,
                month: month,
                cardHolder: cardHolder,
                saveCard: saveCard,
                customerFields: composeFieldValuesForCardSale(from: formVlues),
                recipientInfo: state.paymentOptions.recipientInfo
            )
            state.isLoading = true
            execute(payRequest: request)
        case .paymentMethodsScreenIntent(.delete(let card)):
            executeDelete(for: card)
        case .paymentMethodsScreenIntent(.select(let item)):
            if item == state.currentMethod {
                state.currentMethod = nil
            } else {
                state.currentMethod = item
            }
        case .alertClosed:
            state.alertModel = nil
        case .customerFieldsScreenIntent(.sendCustomerFields(let fieldsValues)):
            if state.paymentOptions.action == .Tokenize {
                tokenizeCard()
            } else {
                state.isLoading = true
                payInteractor?.sendCustomerFields(fieldsValues: fieldsValues)
            }
        case .clarificationFieldsScreenIntent(.sendFilledFields(let fieldsValues)):
            state.isLoading = true
            payInteractor?.sendClarificationFields(fieldsValues: fieldsValues)
        case .customerFieldsScreenIntent(.back), .clarificationFieldsScreenIntent(.back):
            state = modifiedCopy(of: state) {
                $0.customerFields = nil
                $0.clarificationFields = nil
            }
        case .threeDSecureScreenIntent(.threeDSecure(let url)):
            payInteractor?.threeDSecureRedirectHandle(url: url)
        case .paymentMethodsScreenIntent(.payWithApplePay(customerFields: let fieldValues)):
            if applePayService.isAvailable {
                applePayService.onApplePayResult = { [weak self] result in
                    guard let self = self else { return }
                    switch result {
                    case .failToPresent:
                        self.state.alertModel = .InfoError(.failedToPresentApplePay, onClose: nil)
                    case .canceled:
                        break
                    case .didAuthorizePayment(token: let token):
                        if let request = self.payRequestFactory?.createApplePaySaleRequest(
                            token: token,
                            customerFields: fieldValues,
                            recipientInfo: self.state.paymentOptions.recipientInfo
                        ) {
                            self.state.isLoading = true
                            self.execute(payRequest: request)
                        }
                    }
                }
                if let request = self.state.paymentOptions.pkPaymentRequest {
                    applePayService.presentPayment(with: request)
                } else if let request = applePayService.createRequest(with: self.state.paymentOptions) {
                    applePayService.presentPayment(with: request)
                } else {
                    self.state.alertModel = .InfoError(.failedApplePayRequestCreation, onClose: nil)
                }
            } else {
                state.alertModel = .InfoError(.applePayUnsupported, onClose: nil)
            }
        case .paymentMethodsScreenIntent(.payAPS(let method)):
            state.apsPaymentMethod = method
        case .apsScreenIntent(.executePayment):
            if let methodCode = state.apsPaymentMethod?.code,
                      let apsRequest = payRequestFactory?.createAPSSaleRequest(methodCode: methodCode) {
                execute(payRequest: apsRequest)
            }
        case .paymentMethodsScreenIntent(.store(let newValues)):
            if let currentMethod = state.currentMethod {
                state.savedValues[currentMethod] = newValues
            }
        case .customerFieldsScreenIntent(.store(let customerFieldValues)):
            if let currentMethod = state.currentMethod {
                if var savedValues = state.savedValues[currentMethod] {
                    savedValues.customerFieldValues = customerFieldValues
                    state.savedValues[currentMethod] = savedValues
                } else {
                    state.savedValues[currentMethod] = FormData(customerFieldValues: customerFieldValues.skipEmpty())
                }
            }
        case .paymentMethodsScreenIntent(.tokenize):
            let customerFields = state.currentPaymentMethod?.methodCustomerFields.filter {
                $0.isTokenize && !$0.isHidden
            } ?? []
            
            if customerFields.count > UIScheme.countOfVisibleCustomerFields {
                state = modifiedCopy(of: state) {
                    $0.customerFields = customerFields
                }
            } else {
                tokenizeCard()
            }
        }
    }
    
    private func tokenizeCard() {
        guard let payRequestFactory = payRequestFactory,
              let currentMethod = state.currentMethod,
              let formData = state.savedValues[currentMethod],
              let cardExpiry = cardExpiryFabric?.createCardExpiry(with: formData.cardExpiry),
              let month = cardExpiry.expiryMonth, let year = cardExpiry.expiryYear
        else { return }
        
        let tokenizeRequest = payRequestFactory.createTokenizeRequest(
            pan: formData.cardNumber,
            month: month,
            year: year + 2000,
            cardHolder: formData.cardHolder,
            customerFields: formData.customerFieldValues
        )
        
        state.isLoading = true
        execute(payRequest: tokenizeRequest)
    }

    private func execute(payRequest request: PayRequest) {
        guard let payInteractor = payInteractor else {
            return
        }
        payInteractor.execute(request: request)
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self else { return }
                debugPrint("\(type(of: self)) received error")
                if case let .failure(error) = completion {
                    self.applePayService.paymentCompletion?(PKPaymentAuthorizationResult(status: PKPaymentAuthorizationStatus.failure, errors: nil))
                    self.state.alertModel = .FinalError(error, onClose: {
                        self.onFlowFinished(.withError(error))
                    })
                }
            }, receiveValue: { [weak self] payEvent in
                guard let self = self else { return }
                switch payEvent {
                case .onCustomerFields(customerFields: let customerFields):
                    debugPrint("\(type(of: self)) received onCustomerFields")
                    self.state = modifiedCopy(of: self.state) {
                        $0.isLoading = false
                        $0.customerFields = customerFields
                    }
                case .onClarificationFields(clarificationFields: let clarificationFields, payment: let payment):
                    debugPrint("\(type(of: self)) received onClarificationFields")
                    self.state = modifiedCopy(of: self.state) {
                        $0.isLoading = false
                        $0.payment = payment
                        $0.clarificationFields = clarificationFields
                    }
                case .onThreeDSecure(page: let threeDSecurePage, isCascading: let isCascading, payment: let payment):
                    debugPrint("\(type(of: self)) received onThreeDSecure isCascading: \(isCascading)")
                    self.state = modifiedCopy(of: self.state) {
                        $0.isLoading = false
                        $0.payment = payment
                        $0.threeDSecurePageState = ThreeDSecurePageState(
                            threeDSecurePage: threeDSecurePage,
                            isCascading: isCascading
                        )
                    }
                case .onCompleteWithDecline(isTryAgain: let isTryAgain, paymentMessage: let paymentMessage, payment: let payment):
                    debugPrint("\(type(of: self)) received onCompleteWithDecline")
                    self.state = modifiedCopy(of: self.state) {
                        $0.isLoading = false
                        $0.payment = payment
                        $0.finalPaymentState = .Decline(paymentMessage: paymentMessage, isTryAgain: isTryAgain)
                    }
                    
                    if self.state.paymentOptions.action == .Tokenize {
                        self.state.alertModel = .TokenizeResult(
                            message: L.title_result_error_tokenize.string,
                            onClose: { [weak self] in
                                self?.onFlowFinished(.decline(payment))
                            }
                        )
                    }
                case .onCompleteWithSuccess(payment: let payment):
                    debugPrint("\(type(of: self)) received onCompleteWithSuccess")
                    self.state = modifiedCopy(of: self.state) {
                        $0.payment = payment
                        $0.isLoading = false
                        $0.finalPaymentState = .Success
                    }
                    
                    if self.state.paymentOptions.action == .Tokenize {
                        self.state.alertModel = .TokenizeResult(
                            message: L.title_result_succes_tokenize.string,
                            onClose: { [weak self] in
                                self?.onFlowFinished(.success(payment))
                            }
                        )
                    }
                case .onPaymentCreated:
                    self.applePayService.paymentCompletion?(PKPaymentAuthorizationResult(status: PKPaymentAuthorizationStatus.success, errors: nil))
                case .onStatusChanged(status: let status, payment: let payment):
                    debugPrint("\(type(of: self)) received onStatusChanged with status=\(status)")
                    self.state = modifiedCopy(of: self.state) {
                        $0.payment = payment
                        $0.customerFields = nil
                        $0.clarificationFields = nil
                    }
                }
            })
            .store(in: &cancellables)
    }

    private func composeFieldValuesForCardSale(from filledValues: [FieldValue]) -> [FieldValue] {
        if let visibleCustomerField = state.currentPaymentMethod?.visibleCustomerFields.count,
           visibleCustomerField > UIScheme.countOfVisibleCustomerFields {
            return []
        } else {
            return filledValues
        }
    }

    private func restore(payment: Payment, with paymentMethod: PaymentMethod) {
        guard let payRequestFactory = self.payRequestFactory else {
            assertionFailure("PayRequestFactory is not injected")
            return
        }
        
        state.currentMethod = PaymentMethodsListEntity(entityType: .paymentMethod(paymentMethod))

        if payment.uiPaymentMethodType == .aps && payment.paymentStatus?.isFinal == false {
            dispatch(intent: .paymentMethodsScreenIntent(.payAPS(paymentMethod)))
        } else {
            state.isLoading = true
        }
        if let methodCode = payment.method {
            let request = payRequestFactory.createPaymentRestoreRequest(methodCode: methodCode)
            execute(payRequest: request)
        }
    }

    private func executeDelete(for card: SavedAccount) {
        cardRemoveInteractor?.remove(card: card)
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self else { return }
                if case let .failure(error) = completion {
                    self.state.alertModel = .InfoError(error, onClose: nil)
                }
            }, receiveValue: { [weak self] _ in
                guard let self = self else { return }
                self.state.savedAccounts = self.state.savedAccounts?.filter({ savedAccount in
                    savedAccount.id != card.id
                })
            })
            .store(in: &cancellables)
    }
}

internal func debugPrint(_ object: Any...) {
    #if DEBUG
    print(object)
    #endif
}
