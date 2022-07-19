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
    case loaded(data: PaymentMethodsData)
    case closed(withError: CoreError?)
}

extension PaymentMethodsViewState {
    var isVisible: Bool {
        switch self {
        case .loading, .loaded: return true
        default: return false
        }
    }
}

public struct PaymentDetailData {
    public init(title: String, description: String, canBeCopied: Bool) {
        self.title = title
        self.description = description
        self.canBeCopied = canBeCopied
    }

    let title: String
    let description: String
    let canBeCopied: Bool
}

public struct PaymentSummaryData {
    public init(logo: Image? = nil, currency: String, value: Decimal, isVatIncluded: Bool) {
        self.logo = logo
        self.currency = currency
        self.value = value
        self.isVatIncluded = isVatIncluded
    }

    var logo: Image?
    var currency: String
    var value: Decimal
    var isVatIncluded: Bool
}

public struct PaymentMethodsData {
    var paymentDetails: [PaymentDetailData]
    var paymentSummary: PaymentSummaryData
    var availablePaymentMethods: [PaymentMethod]

    public init(paymentDetails: [PaymentDetailData], paymentSummary: PaymentSummaryData, availablePaymentMethods: [PaymentMethod]) {
        self.paymentDetails = paymentDetails
        self.paymentSummary = paymentSummary
        self.availablePaymentMethods = availablePaymentMethods
    }

}

public struct PaymentMethod {
    public init(id: Int64, name: String, type: UISupportedPaymentMethod) {
        self.id = id
        self.name = name
        self.type = type
    }

    var id: Int64
    var name: String
    var type: UISupportedPaymentMethod
}

public enum UISupportedPaymentMethod: Equatable {
    case ApplePay
    case SavedCard
    case NewCard
    case Unsupported(name: String)
}
