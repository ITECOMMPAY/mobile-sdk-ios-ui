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
    var projectId: Int32?
    var paymentId: String
    var paymentAmount: Int64
    var paymentCurrency: String
    var customerId: String
    var paymentDescription: String
    var languageCode: String
    var forcePaymentMethod: ForcePaymentMethods
    var hideSavedWallets: Bool
    var secretKey: String
    var apiHost: String
    var wsApiHost: String
    var merchantId: String
    var merchantName: String
    var mockModeType: MockModeType

    var applePayMerchantID: String = ""
    var applePayDescription: String = ""
}

enum ForcePaymentMethods: String, CaseIterable, Identifiable {
    case none = "none"
    case CARD = "card"
    case NETELLER_WALLET = "neteller-wallet"
    case QIWI = "qiwi"
    case SKRILL_WALLET = "skrill"
    case DOKU = "doku"
    case MCASH = "mcash"
    case BOOST = "boost"
    case BIGC = "bigccash"
    case ALIPAY = "alipay"
    case QIWI_KZ = "qiwi-kz"
    case ATF24 = "atf24"
    case WEBMONEY_LIGHT = "webmoney-light"
    case WEBMONEY_CLASSIC = "webmoney"
    case GOOGLE_PAY = "google_pay_host"
    case APPLE_PAY = "apple_pay_core"
    case PAY_PALL = " paypal-wallet"
    var id: Self { self }
}

extension MockModeType: CaseIterable, Identifiable, CustomStringConvertible  {
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
