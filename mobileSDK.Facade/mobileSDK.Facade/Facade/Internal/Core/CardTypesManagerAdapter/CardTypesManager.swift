//
//  CardTypesManager.swift
//  ecommpaySDK
//
//  Created by Ivan Krapivtsev on 26.07.2022.
//

import mobileSDK_UI
import MsdkCore

extension MsdkCore.CardTypesManager: mobileSDK_UI.CardTypeRecognizer {
    public func getCardType(for pan: String) -> mobileSDK_UI.PaymentMethodCard? {
        return self.search(pan: pan)
    }
}

extension MsdkCore.PaymentMethodCard: mobileSDK_UI.PaymentMethodCard {
    public var cardNumberMinLength: Int? {
        self.minLength?.intValue
    }
    public var cardNumberMaxLength: Int? {
        self.maxLength?.intValue
    }

    public var cardType: CardType {
        return CardType.createFrom(self.type)
    }
}
