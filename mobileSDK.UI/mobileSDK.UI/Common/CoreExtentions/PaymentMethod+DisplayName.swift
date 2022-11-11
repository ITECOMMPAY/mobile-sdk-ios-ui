//
//  PaymentMethod+DisplayName.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 03.08.2022.
//

import Foundation

extension PaymentMethod {
    var displayName: String? {
        switch self.methodType {
        case .card:
            return L.button_pay_with_card.string
        default:
            return name ?? TranslationsManager.shared.stringValue(for: "\(code)_title")
        }
    }
}
