//
//  RootViewModel.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 01.08.2022.
//

import Combine

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
            // .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                if case let .failure(error) = completion {
                    self?.state.error = error
                }
            }, receiveValue: { [weak self] event in
                guard let self = self else { return }
                self.state.isLoading = false
                switch event {
                case .onInitReceived(paymentMethods: let methods, savedAccounts: let accounts):
                    self.state.availablePaymentMethods = methods
                    self.state.savedAccounts = accounts
                    self.state.currentMethod = self.state.mergedList.first // по умолчанию выбираем первый метод из писка
                    break
                case .onPaymentRestored(let payment):
                    self.state.payment = payment
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
                .declineScreenIntent(.close):
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
        case .paymentMethodsScreenIntent(.delete):
            self.state.error = CoreError(code: .unknown,
                                         message: "Card delete is unimplemented")
        case .paymentMethodsScreenIntent(.select(let item)):
            state.currentMethod = item
        case .closeErrorAlert:
            // TODO: handle by error type
            self.state.error = nil
            // cancellables.forEach {  $0.cancel() }
            // onFlowFinished(.withError(state.error ?? .unknown))
        case .customerFieldsScreenIntent(.sendCustomerFields(let fieldsValues)):
            state.isLoading = true
            payInteractor?.sendCustomerFields(fieldsValues: fieldsValues)
        case .clarificationFieldsScreenIntent(.sendFilledFields(let fieldsValues)):
            state.isLoading = true
            payInteractor?.sendClarificationFields(fieldsValues: fieldsValues)
        case .customerFieldsScreenIntent(.back), .clarificationFieldsScreenIntent(.back):
            self.state = modifiedCopy(of: self.state) {
                $0.customerFields = nil
                $0.clarificationFields = nil
            }
        case .threeDSecureScreenIntent(.threeDSecureHandled):
            state.isLoading = true
            payInteractor?.threeDSecureHandled()
        }
    }

    private func execute(payRequest request: PayRequest) {
        guard let payInteractor = payInteractor else {
            return
        }
        payInteractor.execute(request: request)
            // .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self else { return }
                if case let .failure(error) = completion {
                    self.state.error = error
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
                    debugPrint("\(type(of: self)) received onPaymentCreated")
                case .onStatusChanged(status: let status, payment: let payment):
                    debugPrint("\(type(of: self)) received onStatusChanged with status=\(status)")
                    self.state.payment = payment
                }
            })
            .store(in: &cancellables)
    }

}

private func debugPrint(_ object: Any...) {
    #if DEBUG
    print(object)
    #endif
}
