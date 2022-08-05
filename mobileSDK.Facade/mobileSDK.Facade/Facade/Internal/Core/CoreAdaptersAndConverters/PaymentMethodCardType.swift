//
//  MsdkCore.PaymentMethodType.swift
//  ecommpaySDK
//
//  Created by Ivan Krapivev on 25.07.2022.
//

import MsdkCore
import mobileSDK_UI

extension mobileSDK_UI.CardType {
    static func createFrom(_ coreEnum: MsdkCore.PaymentMethodCardType) -> mobileSDK_UI.CardType {
        if coreEnum == PaymentMethodCardType.forbrugsforeningen { return .forbrugsforeningen }
        else if coreEnum == PaymentMethodCardType.solo { return .solo }
        else if coreEnum == PaymentMethodCardType.switch_ { return .switch_ }
        else if coreEnum == PaymentMethodCardType.discover { return .discover }
        else if coreEnum == PaymentMethodCardType.belcard { return .belcard }
        else if coreEnum == PaymentMethodCardType.dankort { return .dankort }
        else if coreEnum == PaymentMethodCardType.mir { return .mir }
        else if coreEnum == PaymentMethodCardType.amex { return .amex }
        else if coreEnum == PaymentMethodCardType.maestro { return .maestro }
        else if coreEnum == PaymentMethodCardType.cup { return .cup }
        else if coreEnum == PaymentMethodCardType.jcb { return .jcb }
        else if coreEnum == PaymentMethodCardType.master5 { return .master5 }
        else if coreEnum == PaymentMethodCardType.visa { return .visa }
        else if coreEnum == PaymentMethodCardType.dinersClub { return .dinersClub }
        else if coreEnum == PaymentMethodCardType.laser { return .laser }
        else if coreEnum == PaymentMethodCardType.napas { return .napas }
        else if coreEnum == PaymentMethodCardType.uzcard { return .uzcard }
        else if coreEnum == PaymentMethodCardType.troy { return .troy }
        else if coreEnum == PaymentMethodCardType.unknown { return .unknown }
        return .unknown
    }
}
