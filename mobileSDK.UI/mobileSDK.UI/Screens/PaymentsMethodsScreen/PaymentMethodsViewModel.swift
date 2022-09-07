//
//  PaymentMethodsScreenViewModel.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 05.07.2022.
//

import Foundation
import Combine

protocol PaymentMethodsScreenViewModelProtocol: ViewModel
where ViewState == PaymentMethodsScreenState, UserIntent == PaymentMethodsIntent {}

class PaymentMethodsScreenViewModel<rootVM: RootViewModelProtocol>: ChildViewModel<PaymentMethodsScreenState, PaymentMethodsIntent, rootVM>, PaymentMethodsScreenViewModelProtocol {
    override func mapIntent(from childIntent: PaymentMethodsIntent) throws -> rootVM.UserIntent {
        return .paymentMethodsScreenIntent(childIntent)
    }

    override func mapState(from parentState: rootVM.ViewState) throws -> PaymentMethodsScreenState {
        return parentState as PaymentMethodsScreenState
    }
}

extension RootState: PaymentMethodsScreenState {
    var selectedPaymentMethod: PaymentMethodsListEntity? {
        currentMethod
    }

    var mergedList: [PaymentMethodsListEntity] {
        guard let savedAccounts = savedAccounts, let availablePaymentMethods = availablePaymentMethods else {
            return []
        }
        return savedAccounts.map {  PaymentMethodsListEntity(entityType: .savedAccount($0))  }
        + availablePaymentMethods.map { PaymentMethodsListEntity(entityType: .paymentMethod($0)) }
    }

    var cardPaymentMethod: PaymentMethod? {
        return availablePaymentMethods?.first(where: { $0.methodType == .card })
    }
}
