//
//  RootViewModel.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 01.08.2022.
//

import Combine

protocol RootViewModelProtocol: ViewModel where ViewState == RootState, UserIntent == RootIntent {}

enum PaymentFlowFinishedReason {
    case byUser
    case withError(CoreError)
    case success
    case decline
}

typealias PaymentFlowDismisedCompletion = (_ reason: PaymentFlowFinishedReason) -> Void

class RootViewModel: RootViewModelProtocol {
    @Injected var payInteractor: PayInteractor?
    @Injected var payRequestFactory: PayRequestFactory?

    let futureData: AnyPublisher<InitEvent, CoreError>
    let staticInfo: (summary: PaymentSummaryData, details: [PaymentDetailData])

    var cancellables: Set<AnyCancellable> = []
    var onFlowFinished: PaymentFlowDismisedCompletion

    init(staticInfo: (summary: PaymentSummaryData,
                      details: [PaymentDetailData]),
         futureData: AnyPublisher<InitEvent, CoreError>,
         onFlowFinished: @escaping PaymentFlowDismisedCompletion) {
        self.staticInfo = staticInfo
        self.futureData = futureData
        self.onFlowFinished = onFlowFinished
        self.state = RootState(paymentDetails: staticInfo.details, paymentSummary: staticInfo.summary)
        subscribeInit()
    }

    func subscribeInit() {
        state.isLoading = true
        self.futureData
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                if case let .failure(error) = completion {
                    self?.state.error = error
                }
            }, receiveValue: { [weak self] event in
                guard let self = self else { return }
                switch event {
                case .onInitReceived(paymentMethods: let methods, savedAccounts: let accounts):
                    self.state.curentScreen = .paymentMethods
                    self.state.availablePaymentMethods = methods
                    self.state.savedAccounts = accounts
                    self.state.currentMethod = self.state.mergedList.first // по умолчанию выбраем первый метод из писка
                    self.state.isLoading = false
                    break
                case .onPaymentRestored:
                    // TODO: Implement restore
                    break
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
        case .paymentMethodsScreenIntent(.close), .initialLoadingScreenIntent(.close):
            cancellables.forEach {  $0.cancel() }
            onFlowFinished(.byUser)
        case .paymentMethodsScreenIntent(.paySavedAccountWith(id: let id, cvv: let cvv)):
            guard let payRequestFactory = payRequestFactory else {
                return
            }
            let request = payRequestFactory.createSavedCardSaleRequest(cvv: cvv, accountId: id)
            execute(payRequest: request)
        case .paymentMethodsScreenIntent(.payNewCardWith(cvv: let cvv,
                             pan: let pan,
                             year: let year,
                             month: let month,
                             cardHolder: let cardHolder,
                             saveCard: let saveCard)):
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

        case .paymentMethodsScreenIntent(.delete):
            // TODO: Implement card delete
            break
        case .paymentMethodsScreenIntent(.select(let item)):
            state.currentMethod = item
        case .closeErrorAlert:
            cancellables.forEach {  $0.cancel() }
            onFlowFinished(.withError(state.error ?? .unknown))
        case .paymentMethodsScreenIntent(.continueToCustomerScreen):
            state.curentScreen = .customerFields
        }
    }

    private func execute(payRequest request: PayRequest) {
        guard let payInteractor = payInteractor else {
            return
        }
        payInteractor.execute(request: request)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self else { return }
                if case let .failure(error) = completion {
                    self.state.error = error
                }
            }, receiveValue: { [weak self] payEvent in
                guard let self = self else { return }
                switch payEvent {
                default:
                    // TODO: Implement later
                    self.state.error = CoreError(code: .unknown,
                                      message: "\(String(describing: payEvent)) event handling is unimplemented")
                }
            })
            .store(in: &cancellables)
    }
}
