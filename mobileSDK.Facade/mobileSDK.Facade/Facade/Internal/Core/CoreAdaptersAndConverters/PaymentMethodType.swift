//
//  PaymentMethodType.swift
//  ecommpaySDK
//
//  Created by Ivan Krapivtsev on 22.07.2022.
//

import MsdkCore
import mobileSDK_UI

extension mobileSDK_UI.PaymentMethodType {
    static func createFrom(_ coreEnum: MsdkCore.PaymentMethodType) -> mobileSDK_UI.PaymentMethodType {
        if coreEnum == MsdkCore.PaymentMethodType.card { return .card }
        else if coreEnum == MsdkCore.PaymentMethodType.netellerWallet { return .netellerWallet }
        else if coreEnum == MsdkCore.PaymentMethodType.qiwi { return .qiwi }
        else if coreEnum == MsdkCore.PaymentMethodType.skrillWallet { return .skrillWallet }
        else if coreEnum == MsdkCore.PaymentMethodType.doku { return .doku }
        else if coreEnum == MsdkCore.PaymentMethodType.yandexMoney { return .yandexMoney }
        else if coreEnum == MsdkCore.PaymentMethodType.mcash { return .mcash }
        else if coreEnum == MsdkCore.PaymentMethodType.boost { return .boost }
        else if coreEnum == MsdkCore.PaymentMethodType.malaysia { return .malaysia }
        else if coreEnum == MsdkCore.PaymentMethodType.thailand { return .thailand }
        else if coreEnum == MsdkCore.PaymentMethodType.bigc { return .bigc }
        else if coreEnum == MsdkCore.PaymentMethodType.bank { return .bank }
        else if coreEnum == MsdkCore.PaymentMethodType.alipay { return .alipay }
        else if coreEnum == MsdkCore.PaymentMethodType.webmoneyLight { return .webmoneyLight }
        else if coreEnum == MsdkCore.PaymentMethodType.webmoneyClassic { return .webmoneyClassic }
        else if coreEnum == MsdkCore.PaymentMethodType.googlePay { return .googlePay }
        else if coreEnum == MsdkCore.PaymentMethodType.applePay { return .applePay }
        else if coreEnum == MsdkCore.PaymentMethodType.unknown { return .unknown }
        return .unknown
    }
}

