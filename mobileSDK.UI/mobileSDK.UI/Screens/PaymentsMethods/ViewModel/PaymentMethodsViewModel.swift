//
//  PaymentMethodsViewModel.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 05.07.2022.
//

import Foundation
import Combine

protocol PaymentMethodsViewModelProtocol: ViewModel
where ViewState == PaymentMethodsViewState, UserIntent == PaymentMethodsIntent {
}

class PaymentMethodsViewModel: PaymentMethodsViewModelProtocol {
    let futureData: Future<PaymentMethodsData, CoreError>
    private var paymentMethodsCancelable: AnyCancellable?
    var dismissCompletion: (() -> Void)?

    init(futureData: Future<PaymentMethodsData, CoreError>,
         state: PaymentMethodsViewState = .initial,
         dismissCompletion: (() -> Void)? = nil) {
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
            }, receiveValue: { [weak self] paymentMethodsData in
                self?.state = .loaded(data: paymentMethodsData, expanded: nil)
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
        }
    }
}
