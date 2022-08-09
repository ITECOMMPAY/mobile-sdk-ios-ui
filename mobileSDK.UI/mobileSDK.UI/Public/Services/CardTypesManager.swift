//
//  CardTypeRecognizer.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 25.07.2022.
//

import Foundation

public protocol CardTypeRecognizer {
    func getCardType(for pan: String) -> PaymentMethodCard?
}
