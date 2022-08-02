//
//  PaymentMethodsScreenViewModel.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 05.07.2022.
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
    var isContinueButton: Bool {
        visibleCustomerFields.count > 3
    }

    var visibleCustomerFields: [CustomerField] {
        guard let method = currentMethod else { return [] }
        switch method.entityType {
        case .savedAccount:
            return availablePaymentMethods?.first(where: {
                $0.methodType == .card
            })?.methodCustomerFields.filter { !$0.isHidden } ?? []
        case .paymentMethod(let method):
            return method.methodCustomerFields.filter { !$0.isHidden }
        }
    }

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
}
