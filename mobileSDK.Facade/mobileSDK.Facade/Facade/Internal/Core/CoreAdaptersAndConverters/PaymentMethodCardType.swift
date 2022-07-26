//
//  PaymentMethodCardType.swift
//  ecommpaySDK
//
//  Created by Ivan Krapivev on 25.07.2022.
//

import MsdkCore
import mobileSDK_UI

extension mobileSDK_UI.PaymentMethodType {
    static func createFrom(_ coreEnum: MsdkCore.PaymentMethodType) -> mobileSDK_UI.PaymentMethodType {
        return mobileSDK_UI.PaymentMethodType(rawValue: coreEnum.value) ?? .unknown
    }
}
