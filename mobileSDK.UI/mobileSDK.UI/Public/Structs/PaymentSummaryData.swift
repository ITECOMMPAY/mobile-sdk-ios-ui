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
        self.logo = logo
        self.currency = currency
        self.value = value
    }

    var logo: Image?
    var currency: String
    var value: Decimal
}
