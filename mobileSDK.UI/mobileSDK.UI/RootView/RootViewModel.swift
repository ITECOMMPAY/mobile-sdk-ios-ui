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
    case success
    case decline
}

public typealias PaymentFlowDismisedCompletion = (_ reason: PaymentFlowFinishedReason) -> Void

class RootViewModel: RootViewModelProtocol {
    @Injected var payInteractor: PayInteractor?
    @Injected var payRequestFactory: PayRequestFactory?
    @Injected var cardRemoveInteractor: CardRemoveInteractor?

    let applePayService = ApplePayService()

    let futureData: AnyPublisher<InitEvent, CoreError>

    var cancellables: Set<AnyCancellable> = []
    var onFlowFinished: PaymentFlowDismisedCompletion

    init(paymentOptions: PaymentOptions,
         futureData: AnyPublisher<InitEvent, CoreError>,
         onFlowFinished: @escaping PaymentFlowDismisedCompletion) {
        self.futureData = futureData
        self.onFlowFinished = onFlowFinished
        self.state = RootState(paymentOptions: paymentOptions)
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
                case .onInitReceived(paymentMethods: let methods, savedAccounts: let accounts):
                    let methods = self.applePayService.isAvailable ? methods : methods.filter {
                        $0.methodType != .applePay // выкидываем applePay если он не поддерживается на устройстве
                    }
                    if methods.count == 0 {
                        self.state.alertModel = .FinalError(.methodsListEmpty, onClose: {
                            [weak self] in self?.onFlowFinished(.withError(.methodsListEmpty))
                        })
                    } else {
                        self.state = modifiedCopy(of: self.state) {
                            $0.availablePaymentMethods = methods
                            $0.savedAccounts = accounts
                        }
                        self.state.currentMethod = self.state.mergedList.first // по умолчанию выбираем первый метод из писка
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
    }

    func dispatch(intent: RootIntent) {
        switch intent {
        case .paymentMethodsScreenIntent(.close),
                .initialLoadingScreenIntent(.close),
                .customerFieldsScreenIntent(.close),
                .clarificationFieldsScreenIntent(.close),
                .threeDSecureScreenIntent(.close),
                .successScreenIntent(.close),
                .declineScreenIntent(.close),
                .apsScreenIntent(.close):
            cancellables.forEach {  $0.cancel() }
            onFlowFinished(.byUser)
        case .paymentMethodsScreenIntent(.paySavedAccountWith(id: let id, cvv: let cvv, customerFields: let fieldValues)):
            guard let payRequestFactory = payRequestFactory else {
                return
            }
            let request = payRequestFactory.createSavedCardSaleRequest(
                cvv: cvv,
                accountId: id,
                customerFields: self.state.customerFields?.merge(changedFields: fieldValues,
                                                                 with: self.state.paymentOptions.uiAdditionalFields)
            )
            state.isLoading = true
            execute(payRequest: request)
        case .paymentMethodsScreenIntent(.payNewCardWith(cvv: let cvv,
                                                         pan: let pan,
                                                         year: let year,
                                                         month: let month,
                                                         cardHolder: let cardHolder,
                                                         saveCard: let saveCard, customerFields: let fieldValues)):
            guard let payRequestFactory = payRequestFactory else {
                return
            }
            let request = payRequestFactory.createNewCardSaleRequest(
                cvv: cvv,
                pan: pan,
                year: year,
                month: month,
                cardHolder: cardHolder,
                saveCard: saveCard,
                customerFields: self.state.customerFields?.merge(changedFields: fieldValues,
                                                                 with: self.state.paymentOptions.uiAdditionalFields)
            )
            state.isLoading = true
            execute(payRequest: request)
        case .paymentMethodsScreenIntent(.delete(let card)):
            executeDelete(for: card)
        case .paymentMethodsScreenIntent(.select(let item)):
            state.currentMethod = item
        case .alertClosed:
            state.alertModel = nil
        case .customerFieldsScreenIntent(.sendCustomerFields(let fieldsValues)):
            state.isLoading = true
            payInteractor?.sendCustomerFields(fieldsValues: fieldsValues)
        case .clarificationFieldsScreenIntent(.sendFilledFields(let fieldsValues)):
            state.isLoading = true
            payInteractor?.sendClarificationFields(fieldsValues: fieldsValues)
        case .customerFieldsScreenIntent(.back), .clarificationFieldsScreenIntent(.back):
            state = modifiedCopy(of: state) {
                $0.customerFields = nil
                $0.clarificationFields = nil
            }
        case .threeDSecureScreenIntent(.threeDSecureHandled):
            state.isLoading = true
            payInteractor?.threeDSecureHandled()
        case .paymentMethodsScreenIntent(.payWithApplePay(customerFields: let fieldValues)):
            if applePayService.isAvailable {
                applePayService.onApplePayResult = { [weak self] result in
                    guard let self = self else { return }
                    switch result {
                    case .failToPresent:
                        self.state.alertModel = .InfoError(.failedToPresentApplePay, onClose: nil)
                    case .canceled:
                        break // TODO: process that case later
                    case .didAuthorizePayment(token: let token):
                        let customerFields = self.state.customerFields?.merge(changedFields: fieldValues,
                                                                              with: self.state.paymentOptions.uiAdditionalFields)
                        if let request = self.payRequestFactory?.createApplePaySaleRequest(token: token, customerFields: customerFields) {
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
            state.isLoading = true
            if let methodCode = state.payment?.method,
               let apsRequest = payRequestFactory?.createPaymentRestoreRequest(methodCode: methodCode) {
                execute(payRequest: apsRequest)
            } else if let methodCode = state.apsPaymentMethod?.code,
                      let apsRequest = payRequestFactory?.createApplePaySaleRequest(methodCode: methodCode) {
                execute(payRequest: apsRequest)
            }
        }
    }

    private func execute(payRequest request: PayRequest) {
        guard let payInteractor = payInteractor else {
            return
        }
        payInteractor.execute(request: request)
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self else { return }
                if case let .failure(error) = completion {
                    self.applePayService.paymentCompletion?(PKPaymentAuthorizationResult(status: PKPaymentAuthorizationStatus.failure, errors: nil))
                    self.state.alertModel = .InfoError(error, onClose: nil)
                }
            }, receiveValue: { [weak self] payEvent in
                guard let self = self else { return }
                switch payEvent {
                case .onCustomerFields(customerFields: let customerFields):
                    self.state = modifiedCopy(of: self.state) {
                        $0.isLoading = false
                        $0.customerFields = customerFields
                    }
                case .onClarificationFields(clarificationFields: let clarificationFields,
                                            payment: let payment):
                    self.state = modifiedCopy(of: self.state) {
                        $0.isLoading = false
                        $0.payment = payment
                        $0.clarificationFields = clarificationFields
                    }
                case .onThreeDSecure(acsPage: let acsPage, isCascading: let isCascading, payment: let payment):
                    self.state = modifiedCopy(of: self.state) {
                        $0.isLoading = false
                        $0.payment = payment
                        $0.acsPageState = AcsPageState(acsPage: acsPage, isCascading: isCascading)
                    }
                    if self.state.paymentOptions.isMockModeEnabled {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            payInteractor.threeDSecureHandled()
                        }
                    }
                case .onCompleteWithDecline(paymentMessage: let paymentMessage, payment: let payment):
                    self.state = modifiedCopy(of: self.state) {
                        $0.isLoading = false
                        $0.payment = payment
                        $0.finalPaymentState = .Decline(paymentMessage: paymentMessage, isTryAgain: false)
                    }
                case .onCompleteWithFail(isTryAgain: let isTryAgain, paymentMessage: let paymentMessage, payment: let payment):
                    self.state = modifiedCopy(of: self.state) {
                        $0.payment = payment
                        $0.isLoading = false
                        $0.finalPaymentState = .Decline(paymentMessage: paymentMessage, isTryAgain: isTryAgain)
                    }
                case .onCompleteWithSuccess(payment: let payment):
                    self.state = modifiedCopy(of: self.state) {
                        $0.payment = payment
                        $0.isLoading = false
                        $0.finalPaymentState = .Success
                    }
                case .onPaymentCreated:
                    self.applePayService.paymentCompletion?(PKPaymentAuthorizationResult(status: PKPaymentAuthorizationStatus.success, errors: nil))
                case .onStatusChanged(status: let status, payment: let payment):
                    debugPrint("\(type(of: self)) received onStatusChanged with status=\(status)")
                    self.state.payment = payment
                }
            })
            .store(in: &cancellables)
    }

    private func restore(payment: Payment, with paymentMethod: PaymentMethod) {
        guard let payRequestFactory = self.payRequestFactory else {
            assertionFailure("PayRequestFactory is not injected")
            return
        }

        if payment.uiPaymentMethodType == .aps && payment.paymentStatus?.isFinal == false {
            dispatch(intent: .paymentMethodsScreenIntent(.payAPS(paymentMethod)))
        } else {
            state.isLoading = true
            if let methodCode = payment.method {
                let request = payRequestFactory.createPaymentRestoreRequest(methodCode: methodCode)
                execute(payRequest: request)
            }
        }
    }

    func executeDelete(for card: SavedAccount) {
        cardRemoveInteractor?.remove(card: card)
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self else { return }
                if case let .failure(error) = completion {
                    self.state.alertModel = .InfoError(error, onClose: nil)
                }
            }, receiveValue: { [weak self] result in
                guard let self = self else { return }
                self.state.savedAccounts = self.state.savedAccounts?.filter({ savedAccount in
                    savedAccount.id != card.id
                })
            })
            .store(in: &cancellables)
    }
}

private func debugPrint(_ object: Any...) {
    #if DEBUG
    print(object)
    #endif
}
