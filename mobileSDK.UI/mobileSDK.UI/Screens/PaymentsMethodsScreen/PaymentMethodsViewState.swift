//
//  PaymentMethodsScreenState.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 04.07.2022.
//

import Foundation
import SwiftUI

protocol PaymentMethodsScreenState {
    var selectedPaymentMethod: PaymentMethodsListEntity? { get }
    var paymentOptions: PaymentOptions { get }
    var mergedList: [PaymentMethodsListEntity] { get }
    var cardPaymentMethod: PaymentMethod? { get }
    var isVatIncluded: Bool { get }
}

struct PaymentMethodsListEntity {
    let entityType: PaymentMethodsListEntityType
    var id: String {
        switch entityType {
        case .savedAccount(let savedAccount):
            return String(savedAccount.id)
        case .paymentMethod(let paymentMethod):
            return paymentMethod.methodType.rawValue + (paymentMethod.name ?? "")
        }
    }
}

extension PaymentMethodsListEntity {
    var paymentMethodType: PaymentMethodType {
        switch entityType {
        case .paymentMethod(let method):
            return method.methodType
        case .savedAccount:
            return .card
        }
    }
}

enum PaymentMethodsListEntityType {
    case savedAccount(SavedAccount)
    case paymentMethod(PaymentMethod)
}
