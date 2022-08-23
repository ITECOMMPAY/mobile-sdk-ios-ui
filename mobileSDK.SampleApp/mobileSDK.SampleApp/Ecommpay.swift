//
//  Ecommpay.swift
//  SampleApp
//
//  Created by Ivan Krapivtsev on 22.08.2022.
//

import Foundation
import ecommpaySDK

func getBrandName() -> String {
    return String(#file.split(separator: "/").last?.split(separator: ".").first ?? "")
}

let defaultPaymentData = PaymentData(
    brandColor: nil,
    image: nil,
    projectId: 111781,
    paymentId: getUniquePaymentID(),
    paymentAmount: 123,
    paymentCurrency: "USD",
    customerId: "12",
    paymentDescription: "Test payment",
    languageCode: "",
    forcePaymentMethod: .none,
    hideSavedWallets: false,
    secretKey: "123",
    apiHost: "pp-sdk-3.westresscode.net",
    wsApiHost: "paymentpage-3.westresscode.net",
    merchantId: "BCR2DN6TZ75OBLTH",
    merchantName: "Example Merchant",
    mockModeType: MockModeType.disabled
)
