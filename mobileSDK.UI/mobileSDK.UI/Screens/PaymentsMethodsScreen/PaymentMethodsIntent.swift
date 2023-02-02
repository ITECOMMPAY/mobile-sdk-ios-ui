//
//  PaymentMethodsIntent.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 05.07.2022.
//

import Foundation

enum PaymentMethodsIntent {
    case close
    case paySavedAccountWith(id: Int64, cvv: String, customerFields: [FieldValue])
    case payToken(cvv: String, customerFields: [FieldValue])
    case payNewCardWith(cvv: String,
                        pan: String,
                        year: Int32,
                        month: Int32,
                        cardHolder: String,
                        saveCard: Bool,
                        customerFields: [FieldValue])
    case payAPS(PaymentMethod)
    case delete(SavedAccount)
    case select(PaymentMethodsListEntity)
    case payWithApplePay(customerFields: [FieldValue])
    case store(data: FormData, entity: PaymentMethodsListEntity)
}
