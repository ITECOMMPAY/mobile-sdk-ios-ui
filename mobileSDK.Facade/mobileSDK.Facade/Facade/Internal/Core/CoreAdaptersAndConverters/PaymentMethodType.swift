//
//  PaymentMethodType.swift
//  etoedtoSDK
//
//  Created by Ivan Krapivtsev on 22.07.2022.
//

#if !DEVELOPMENT
@_implementationOnly import MsdkCore
@_implementationOnly import mobileSDK_UI
#else
import MsdkCore
import mobileSDK_UI
#endif

extension mobileSDK_UI.PaymentMethodType {
    static func createFrom(_ coreEnum: MsdkCore.PaymentMethodType) -> mobileSDK_UI.PaymentMethodType {
        if coreEnum == MsdkCore.PaymentMethodType.card { return .card } else if coreEnum == MsdkCore.PaymentMethodType.googlePay { return .googlePay } else if coreEnum == MsdkCore.PaymentMethodType.applePay { return .applePay }
        return .aps
    }
}
