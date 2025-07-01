//
//  Ecommpay.swift
//  SampleApp
//
//  Created by Ivan Krapivtsev on 22.08.2022.
//

import Foundation
import EcommpaySDK

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
    projectId: 127033,
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
    secretKey: "",
    apiHost: "sdk.ecommpay.com",
    wsApiHost: "paymentpage.ecommpay.com",
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
