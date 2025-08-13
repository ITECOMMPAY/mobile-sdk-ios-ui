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
    return EcommpaySDKEntity.sdkVersion + "(" + EcommpaySDKEntity.buildNumber + ")"
}

func getCoreVersionString() -> String {
    return EcommpaySDKEntity.coreVerion
}

#if NL3

    let defaultPaymentData = PaymentData(
        brandColor: nil,
        image: nil,
        projectId: 185541,
        paymentId: getUniquePaymentID(),
        paymentAmount: 11001,
        paymentCurrency: "USD",
        customerId: "12",
        paymentDescription: "Test payment",
        languageCode: "",
        forcePaymentMethod: .none,
        hideSavedWallets: false,
        hideSuccessFinalPage: false,
        hideDeclineFinalPage: false,
        secretKey: "123",
        apiHost: "pp-sdk.westresscode.net",
        wsApiHost: "paymentpage.westresscode.net",
        merchantId: "BCR2DN6TZ75OBLTH",
        merchantName: "Example Merchant",
        mockModeType: MockModeType.disabled,
        regionCode: "",
        storedCardType: ""
    )

#else

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

#endif
