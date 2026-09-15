//
//  PaymentSummaryData.swift
//  mobileSDK.UI
//
//  Created by Artem Serebrennikov on 01.02.2023.
//

import Foundation
import SwiftUI

public struct PaymentSummaryData {
    public init(logo: Image? = nil, currency: String, value: Decimal) {
        self.init(
            logo: logo,
            currency: currency,
            value: value,
            currencyExponent: 2
        )
    }

    public init(logo: Image? = nil, currency: String, value: Decimal, currencyExponent: Int) {
        self.logo = logo
        self.currency = currency
        self.value = value
        self.currencyExponent = currencyExponent
    }

    var logo: Image?
    var currency: String
    var value: Decimal
    var currencyExponent: Int
}
