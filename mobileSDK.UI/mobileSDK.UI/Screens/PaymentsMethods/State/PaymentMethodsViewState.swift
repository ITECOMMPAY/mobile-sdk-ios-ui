//
//  PaymentMethodsViewState.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 04.07.2022.
//

import Foundation
import SwiftUI

enum PaymentMethodsViewState {
    case initial
    case loading
    case loaded(PaymentMethodsLoadedState)
    case closed(withError: CoreError?)
}

extension PaymentMethodsViewState {
    var isVisible: Bool {
        switch self {
        case .loading, .loaded: return true
        default: return false
        }
    }

    var loadedState: PaymentMethodsLoadedState? {
        switch self {
        case .loaded(let paymentMethodsLoadedState):
            return paymentMethodsLoadedState
        default:
            return nil
        }
    }
}

struct PaymentMethodsLoadedState {
    var paymentDetails: [PaymentDetailData]
    var paymentSummary: PaymentSummaryData
    var savedAccounts: [SavedAccount]
    var availablePaymentMethods: [PaymentMethod]
}

public enum UISupportedPaymentMethod: Equatable {
    case ApplePay
    case SavedCard
    case NewCard
    case Unsupported(name: String)
}
