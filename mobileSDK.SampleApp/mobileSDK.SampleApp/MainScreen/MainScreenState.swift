//
//  MainScreenState.swift
//  SampleApp
//
//  Created by Ivan Krapivtsev on 22.08.2022.
//

import Foundation
import ecommpaySDK
import SwiftUI

struct PaymentData {
    var brandColor: Color?
    var image: UIImage?
    var projectId: Int
    var paymentId: String
    var paymentAmount: Int
    var paymentCurrency: String
    var customerId: String
    var paymentDescription: String
    var languageCode: String
    var forcePaymentMethod: ForcePaymentMethods
    var forcePaymentMethodCustomValue: String = ""
    var hideSavedWallets: Bool
    var secretKey: String
    var apiHost: String
    var wsApiHost: String
    var merchantId: String
    var merchantName: String
    var mockModeType: MockModeType
    var regionCode: String

    var applePayMerchantID: String = "merchant.ecommpayDemo.sdk"
    var applePayDescription: String = "Apple Pay Description"
    var applePayCountryCode: String = "US"
}

enum ForcePaymentMethods: String, CaseIterable, Identifiable {
    case customValue
    case none
    case card
    case neteller_wallet = "neteller-wallet"
    case qiwi
    case skrill
    case doku
    case mcash
    case boost
    case bigccash
    case alipay
    case qiwi_kz = "qiwi-kz"
    case atf24
    case webmoney_light = "webmoney-light"
    case webmoney
    case google_pay_host
    case apple_pay_core
    case paypal_wallet = "paypal-wallet"
    var id: Self { self }
}

extension MockModeType: CaseIterable, Identifiable, CustomStringConvertible {
    public var description: String {
        switch self {
        case .disabled:
            return "disabled"
        case .success:
            return "success"
        case .decline:
            return "decline"
        }
    }

    public static var allCases: [MockModeType] {
        return [.decline, .success, .disabled]
    }

    public var id: Self { self }
}

extension AdditionalFieldType: Identifiable {
    public var id: Self { self }
}
