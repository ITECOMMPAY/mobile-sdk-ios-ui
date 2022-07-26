//
//  PaymentMethodsViewModel.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 05.07.2022.
//

import Foundation
import Combine

protocol PaymentMethodsViewModelProtocol: ViewModel
where ViewState == PaymentMethodsViewState, UserIntent == PaymentMethodsIntent {}

class PaymentMethodsViewModel: PaymentMethodsViewModelProtocol {
    @Injected var payInteractor: PayInteractor?
    @Injected var payRequestFactory: PayRequestFactory?

    let futureData: AnyPublisher<InitEvent, CoreError>
    let staticInfo: (summary: PaymentSummaryData, details: [PaymentDetailData])
    private var paymentMethodsCancelable: AnyCancellable?
    private var patInteractorCancelable: AnyCancellable?

    var dismissCompletion: (() -> Void)?

    init(staticInfo: (summary: PaymentSummaryData, details: [PaymentDetailData]),
         futureData: AnyPublisher<InitEvent, CoreError>,
         state: PaymentMethodsViewState = .initial,
         dismissCompletion: (() -> Void)? = nil) {
        self.staticInfo = staticInfo
        self.futureData = futureData
        self.state = state
        self.dismissCompletion = dismissCompletion
        subscribe()
    }

    func subscribe() {
        state = .loading
        paymentMethodsCancelable = self.futureData
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                if case let .failure(error) = completion {
                    self?.state = .closed(withError: error)
                }
            }, receiveValue: { [weak self] event in
                guard let self = self else { return }
                switch event {
                case .onInitReceived(paymentMethods: let methods, savedAccounts: let accounts):

                    let loadedState = PaymentMethodsLoadedState(
                        paymentDetails: self.staticInfo.details,
                        paymentSummary: self.staticInfo.summary,
                        savedAccounts: accounts,
                        availablePaymentMethods: methods
                    )

                    self.state = .loaded(loadedState)
                case .onPaymentRestored:
                    // TODO: Implement restore
                    break
                }
            })
    }

    var state: PaymentMethodsViewState = .initial {
        willSet {
            objectWillChange.send()
        }
    }

    func dispatch(intent: PaymentMethodsIntent) {
        switch intent {
        case .close:
            state = .closed(withError: nil)
            paymentMethodsCancelable = nil
            dismissCompletion?()
        case .paySavedAccountWith(id: let id, cvv: let cvv): break
            guard let payRequestFactory = payRequestFactory else {
                return
            }
            let request = payRequestFactory.createSavedCardSaleRequest(cvv: cvv, accountId: id)
            execute(payRequest: request)
        case .payNewCardWith(cvv: let cvv,
                             pan: let pan,
                             year: let year,
                             month: let month,
                             cardHolder: let cardHolder,
                             saveCard: let saveCard):
            guard let payRequestFactory = payRequestFactory else {
                return
            }
            let request = payRequestFactory.createNewCardSaleRequest(cvv: cvv,
                                                                     pan: pan,
                                                                     year: year,
                                                                     month: month,
                                                                     cardHolder: cardHolder,
                                                                     saveCard: saveCard)
            execute(payRequest: request)
        }
    }

    private func execute(payRequest request: PayRequest) {
        guard let payInteractor = payInteractor else {
            return
        }
        patInteractorCancelable = payInteractor.execute(request: request)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self else { return }
                if case let .failure(error) = completion {
                    self.state = .closed(withError: error)
                }
            }, receiveValue: { [weak self] payEvent in
                guard let self = self else { return }
                switch payEvent {
                case .onCustomerFields(customerFields: let customerFields):
                    // TODO: Implement later
                    self.state = .closed(withError: CoreError(code: .unknown, message: "onCustomerFields Unimplemented"))
                case .onClarificationFields(clarificationFields: let clarificationFields, payment: let payment):
                    // TODO: Implement later
                    self.state = .closed(withError: CoreError(code: .unknown, message: "onClarificationFields Unimplemented"))
                case .onCompleteWithDecline(payment: let payment):
                    // TODO: Implement later
                    self.state = .closed(withError: CoreError(code: .unknown, message: "onCompleteWithDecline Unimplemented"))
                case .onCompleteWithFail(status: let status, payment: let payment):
                    // TODO: Implement later
                    self.state = .closed(withError: CoreError(code: .unknown, message: "onCompleteWithFail Unimplemented"))
                case .onCompleteWithSuccess(payment: let payment):
                    // TODO: Implement later
                    self.state = .closed(withError: CoreError(code: .unknown, message: "onCompleteWithSuccess Unimplemented"))
                case .onPaymentCreated:
                    // TODO: Implement later
                    self.state = .closed(withError: CoreError(code: .unknown, message: "onPaymentCreated Unimplemented"))
                case .onStatusChanged(status: let status, payment: let payment):
                    // TODO: Implement later
                    self.state = .closed(withError: CoreError(code: .unknown, message: "onStatusChanged Unimplemented"))
                case .onThreeDSecure(acsPage: let acsPage, isCascading: let isCascading, payment: let payment):
                    // TODO: Implement later
                    self.state = .closed(withError: CoreError(code: .unknown, message: "onThreeDSecure Unimplemented"))
                }
            })
    }
}
