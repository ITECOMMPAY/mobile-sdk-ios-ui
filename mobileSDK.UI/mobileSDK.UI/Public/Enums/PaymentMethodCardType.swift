//
//  PaymentMethodCardType.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 25.07.2022.
//

import Foundation
import PassKit

public enum CardType: String {
    case forbrugsforeningen
    case `switch`
    case discover
    case belcard
    case dankort
    case mir
    case amex
    case maestro
    case cup
    case jcb
    case mastercard
    case visa
    case diners_club
    case unknown
    
    var pkPaymentNetwork: PKPaymentNetwork? {
        switch self {
        case .discover:
            return .discover
        case .dankort:
            return .dankort
        case .mir:
            return .mir
        case .amex:
            return .amex
        case .maestro:
            return .maestro
        case .jcb:
            return .JCB
        case .mastercard:
            return .masterCard
        case .visa:
            return .visa
        default:
            return nil
        }
    }
}

extension CardType: CaseIterable {}
