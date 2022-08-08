//
//  PaymentMethod+DisplayName.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 03.08.2022.
//

import Foundation

extension PaymentMethod {
    var displayName: String? {
        switch self.methodType {
        case .card:
            return L.button_add_new_card.string
        default:
            return TranslationsManager.shared.stringValue(for: "\(code)_title") ?? name
        }
    }
}
