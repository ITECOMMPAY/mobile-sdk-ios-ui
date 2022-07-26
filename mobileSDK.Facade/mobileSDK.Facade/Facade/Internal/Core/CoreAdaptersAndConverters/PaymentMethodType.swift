//
//  PaymentMethodType.swift
//  ecommpaySDK
//
//  Created by Ivan Krapivev on 22.07.2022.
//

import MsdkCore
import mobileSDK_UI

extension mobileSDK_UI.CardType {
    static func createFrom(_ coreEnum: MsdkCore.PaymentMethodCardType) -> mobileSDK_UI.CardType {
        return mobileSDK_UI.CardType(rawValue: coreEnum.value) ?? .unknown
    }
}
