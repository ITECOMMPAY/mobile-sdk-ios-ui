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
    var selectedMethodValues: FormData? {
        guard let selectedMethodsListEntity = selectedMethodsListEntity else {
            return nil
        }
        return savedValues[selectedMethodsListEntity]
    }

    var selectedMethodsListEntity: PaymentMethodsListEntity? {
        currentMethod
    }

    var mergedList: [PaymentMethodsListEntity] {
        guard let savedAccounts = savedAccounts, let availablePaymentMethods = availablePaymentMethods else {
            return []
        }
        if let applePay = availablePaymentMethods.first(where: { $0.methodType == .applePay }) {
            return [PaymentMethodsListEntity(entityType: .paymentMethod(applePay))]
            + savedAccounts
                .map { PaymentMethodsListEntity(entityType: .savedAccount($0)) }
            + availablePaymentMethods
                .filter({ $0.methodType != .applePay })
                .map { PaymentMethodsListEntity(entityType: .paymentMethod($0)) }
        } else if isTokenizedAction {
            return savedAccounts.map { PaymentMethodsListEntity(entityType: .savedAccount($0)) }
        } else {
            return savedAccounts.map { PaymentMethodsListEntity(entityType: .savedAccount($0)) }
            + availablePaymentMethods.map { PaymentMethodsListEntity(entityType: .paymentMethod($0)) }
        }
    }

    var cardPaymentMethod: PaymentMethod? {
        return availablePaymentMethods?.first(where: { $0.methodType == .card })
    }
}
