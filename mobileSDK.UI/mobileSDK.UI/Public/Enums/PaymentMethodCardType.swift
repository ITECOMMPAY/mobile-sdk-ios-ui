//
//  PaymentMethodCardType.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 25.07.2022.
//

import Foundation

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
}

extension CardType: CaseIterable {}
