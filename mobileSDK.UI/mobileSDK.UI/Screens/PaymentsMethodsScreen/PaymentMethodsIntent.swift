//
//  PaymentMethodsIntent.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 05.07.2022.
//

import Foundation

enum PaymentMethodsIntent {
    case close
    case paySavedAccountWith(id: Int64, cvv: String)
    case payNewCardWith(cvv: String,
                        pan: String,
                        year: Int32,
                        month: Int32,
                        cardHolder: String,
                        saveCard: Bool)
    case continueToCustomerScreen
    case delete(SavedAccount)
    case select(PaymentMethodsListEntity)
}
