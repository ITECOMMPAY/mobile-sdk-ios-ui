//
//  String+CurrencySymbol.swift
//  mobileSDK.UI
//
//  Created by Ilya Matveev on 27.01.2026.
//

import Foundation

extension String {
    /// Converts ISO 4217 currency code to currency symbol for UI display
    var currencySymbol: String {
        switch self.uppercased() {
        case "USD":
            return "$"
        case "EUR":
            return "€"
        case "GBP":
            return "£"
        default:
            return self
        }
    }
}
