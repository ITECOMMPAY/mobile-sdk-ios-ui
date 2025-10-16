//
//  Ecommpay.swift
//  SampleApp
//
//  Created by Ivan Krapivtsev on 22.08.2022.
//

import Foundation
import EcommpaySDK
import SwiftUI

func getBrandName() -> String {
    return String(#file.split(separator: "/").last?.split(separator: ".").first ?? "")
}

func getSDKVersionString() -> String {
    return Ecommpay.sdkVersion
}

func getCoreVersionString() -> String {
    return Ecommpay.coreVerion
}

let defaultPaymentData = PaymentData(
    brandColor: nil,
    image: nil,
    projectId: 109751,
    paymentId: getUniquePaymentID(),
    paymentAmount: 123,
    paymentCurrency: "USD",
    customerId: "12",
    paymentDescription: "Test payment",
    languageCode: "",
    forcePaymentMethod: .none,
    hideSavedWallets: false,
    hideSuccessFinalPage: false,
    hideDeclineFinalPage: false,
    secretKey: "9085e3712fe773da63a9f3f8cd4e1923bbaf2ea33d62d8f36aed286497a8b8dde238d5e353886ee21159b9359b2b9fb24cb97bfb7bee953033901c6d02adf0b9",
    merchantId: "BCR2DN6TZ75OBLTH",
    merchantName: "Example Merchant",
    mockModeType: MockModeType.disabled,
    regionCode: "",
    storedCardType: ""
)


extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
