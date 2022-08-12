//
//  RootState.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 01.08.2022.
//

import Foundation

// MARK: - Stored properties
/// Корневое состояние на основе которого строится предствление всех экранов
struct RootState {
    var isLoading: Bool = false
    var currentMethod: PaymentMethodsListEntity?
    var payment: Payment?
    var customerFields: [CustomerField]?
    var clarificationFields: [ClarificationField]?
    var error: CoreError?
    var savedAccounts: [SavedAccount]?
    var availablePaymentMethods: [PaymentMethod]?
    var paymentOptions: PaymentOptions
    var finalPaymentState: FinalPaymentState?
}

// MARK: - Computed properties
extension RootState {
    var isVatIncluded: Bool {
        guard let entity = currentMethod?.entityType else {
            return false
        }
        switch entity {
        case .savedAccount:
            return availablePaymentMethods?.filter { paymentMethod in
                paymentMethod.methodType == .card
            }.first?.isVatInfo ?? false
        case .paymentMethod(let method):
            return method.isVatInfo
        }
    }

    var currentPaymentMethod: PaymentMethod? {
        guard let entity = currentMethod?.entityType else {
            return nil
        }
        switch entity {
        case .savedAccount:
            return availablePaymentMethods?.filter { paymentMethod in
                paymentMethod.methodType == .card
            }.first
        case .paymentMethod(let method):
            return method
        }
    }

    var currentScreen: SDKScreen {

        if isLoading {
            if availablePaymentMethods == nil {
                return .initialLoading
            }
            return .loading
        }

        if let finalPaymentState = finalPaymentState {
            switch finalPaymentState {
            case .Success:
                return .successResult
            case .Decline(paymentMessage: _, isTryAgain: _):
                return .declineResult
            }
        }

        if clarificationFields != nil {
            return .clarificationFields
        }

        if customerFields != nil {
            return .customerFields
        }

        if availablePaymentMethods != nil {
            return .paymentMethods
        }

        return .none
    }
}

// MARK: - State structs
enum FinalPaymentState {
    case Decline(paymentMessage: String?, isTryAgain: Bool)
    case Success
}
