//
//  MobileSDKEnums.swift
//  mobilesdk-ios
//
//  Created by Ecommpay on 04/01/2019.
//  Copyright © 2019 Ecommpay. All rights reserved.
//

import Foundation

enum PaymentStatus: Int {
    case Success = 0
    case Decline = 100
    case Cancelled = 301
    case Error = 501
    case Unknown = 20000
}

enum FamilyType: String {
    case banks
}

internal enum SupportedPaymentMethods: Equatable {
    case CreditCard
    case ApplePay
    case NetellerWallet
    case Qiwi
    case SkrillWallet
    case Doku
    case YandexMoney
    case Malaysia
    case Thailand
    case Boost
    case Bigc
    case Mcash
    case Alipay
    case WebMoneyLight
    case WebMoneyClassic
    case Bank(code: String)
    case Unknown(code: String)

    init?(code: String, family: String = "") {
        switch code {
        case "card": self = .CreditCard
        case "apple_pay_core": self = .ApplePay
        case "neteller-wallet": self = .NetellerWallet
        case "qiwi": self = .Qiwi
        case "skrill-wallet": self = .SkrillWallet
        case "doku": self = .Doku
        case "yandexMoney": self = .YandexMoney
        case "online-malaysian-banks": self = .Malaysia
        case "online-thailand-banks": self = .Thailand
        case "boost": self = .Boost
        case "bigccash": self = .Bigc
        case "mcash": self = .Mcash
        case "alipay": self = .Alipay
        case "webmoney-light": self = .WebMoneyLight
        case "webmoney": self = .WebMoneyClassic
        default: self = .Unknown(code: code)
        }
        if let type = FamilyType(rawValue: family),
           type == .banks {
            self = .Bank(code: code)
        }
    }

    func getCodeAps() -> String {
        switch self {
        case .CreditCard: return "card"
        case .ApplePay: return "apple_pay_core"
        case .NetellerWallet: return "neteller-wallet"
        case .Qiwi: return "qiwi"
        case .SkrillWallet: return "skrill-wallet"
        case .Doku: return "doku"
        case .YandexMoney: return "yandexMoney"
        case .Malaysia: return "online-malaysian-banks"
        case .Thailand: return "online-thailand-banks"
        case .Boost: return "boost"
        case .Bigc: return "bigccash"
        case .Mcash: return "mcash"
        case .Alipay: return "alipay"
        case .WebMoneyLight: return "webmoney-light"
        case .WebMoneyClassic: return "webmoney"
        case .Unknown(let code): return code
        case .Bank(let code): return code
        }
    }

    static func ==(lhs: SupportedPaymentMethods, rhs: SupportedPaymentMethods) -> Bool {
        return lhs.getCodeAps() == rhs.getCodeAps()
    }

    func isUnknownMethod() -> Bool {
        switch self {
        case .Unknown: return true
        default: return false
        }
    }

    func isBankMethod() -> Bool {
        switch self {
        case .Bank: return true
        default: return false
        }
    }
}
