//
//  PaymentMethodCardType.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 25.07.2022.
//

import Foundation

public enum CardType: String {
    case forbrugsforeningen
    case solo // TODO: добавить иконку
    case switch_
    case discover
    case belcard
    case dankort
    case mir
    case amex
    case maestro
    case cup
    case jcb
    case master5 // TODO: добавить иконку
    case visa
    case dinersClub
    case laser // TODO: добавить иконку
    case napas // TODO: добавить иконку
    case uzcard // TODO: добавить иконку
    case troy // TODO: добавить иконку
    case unknown
}

extension CardType: CaseIterable {}
