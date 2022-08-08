//
//  PublicStructs.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 21.07.2022.
//

import Foundation
import SwiftUI

public struct PaymentDetailData {
    public init(title: L, description: String, canBeCopied: Bool) {
        self.title = title
        self.description = description
        self.canBeCopied = canBeCopied
    }

    let title: L
    let description: String
    let canBeCopied: Bool
}

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

public struct CustomerFieldValue {
    public var name: String
    public var value: String
}
