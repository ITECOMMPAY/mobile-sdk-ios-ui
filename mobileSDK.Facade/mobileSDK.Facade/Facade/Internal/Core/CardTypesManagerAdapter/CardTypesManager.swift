//
//  CardTypesManager.swift
//  ecommpaySDK
//
//  Created by Ivan Krapivev on 26.07.2022.
//

import mobileSDK_UI
import MsdkCore

extension MsdkCore.CardTypesManager: mobileSDK_UI.CardTypesManager {
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
        CardType.init(rawValue: self.type.value) ?? .unknown
    }
}

struct CardTypesManagerFabric: mobileSDK_UI.CardTypesManagerFabric {
    func create(with cardTypes: [mobileSDK_UI.PaymentMethodCard]) -> mobileSDK_UI.CardTypesManager? {
        //TODO: Remove forcecasting
        MsdkCore.CardTypesManager(cardTypes: cardTypes as! [MsdkCore.PaymentMethodCard])
    }
}
