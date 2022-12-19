//
//  PaymentMethodsScreenState.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 04.07.2022.
//

import Foundation
import SwiftUI

protocol PaymentMethodsScreenState {
    var selectedMethodsListEntity: PaymentMethodsListEntity? { get }
    var selectedMethodValues: FormData? { get }
    var paymentOptions: PaymentOptions { get }
    var mergedList: [PaymentMethodsListEntity] { get }
    var cardPaymentMethod: PaymentMethod? { get }
    var isVatIncluded: Bool { get }
}

extension PaymentMethodsScreenState {
    var applePayPresentationMode: ApplePayPresentationMode? {
        guard let applePayMethod = applePayMethod else { return nil }
        return applePayMethod.visibleCustomerFields.count > 0 ? .method : .button
    }

    var applePayMethod: PaymentMethod? {
        mergedList.compactMap { listItem in
            return listItem.paymentMethod
        }.filter { method in
            method.methodType == .applePay
        }.first
    }
}

enum ApplePayPresentationMode {
    case button
    case method
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

extension PaymentMethodsListEntity: Equatable {
    static func == (lhs: PaymentMethodsListEntity, rhs: PaymentMethodsListEntity) -> Bool {
        lhs.id == rhs.id
    }
}

extension PaymentMethodsListEntity: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension PaymentMethodsListEntity {
    var savedAccount: SavedAccount? {
        if case let .savedAccount(savedAccount) = self.entityType {
            return savedAccount
        }
        return nil
    }
    var paymentMethod: PaymentMethod? {
        if case let .paymentMethod(paymentMethod) = self.entityType {
            return paymentMethod
        }
        return nil
    }
}

enum PaymentMethodsListEntityType {
    case savedAccount(SavedAccount)
    case paymentMethod(PaymentMethod)
}
