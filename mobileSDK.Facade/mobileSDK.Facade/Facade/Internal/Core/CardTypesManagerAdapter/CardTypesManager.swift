//
//  CardTypesManager.swift
//  ecommpaySDK
//
//  Created by Ivan Krapivtsev on 26.07.2022.
//

#if !DEVELOPMENT
@_implementationOnly import mobileSDK_UI
@_implementationOnly import MsdkCore
#else
import mobileSDK_UI
import MsdkCore
#endif

internal extension MsdkCore.CardTypesManager {
    var wrapper: some mobileSDK_UI.CardTypeRecognizer {
        MsdkCoreCardTypesManagerWrapper(coreType: self)
    }
}

private struct MsdkCoreCardTypesManagerWrapper: mobileSDK_UI.CardTypeRecognizer {
    internal init(coreType: CardTypesManager) {
        self.coreType = coreType
    }

    let coreType: MsdkCore.CardTypesManager

    public func getCardType(for pan: String) -> mobileSDK_UI.PaymentMethodCard? {
        return coreType.search(pan: pan)?.wrapper
    }
}

extension MsdkCore.PaymentMethodCard {
    var wrapper: some mobileSDK_UI.PaymentMethodCard {
        MsdkCorePaymentMethodCardWrapper(coreType: self)
    }
}

private struct MsdkCorePaymentMethodCardWrapper: mobileSDK_UI.PaymentMethodCard {
    internal init(coreType: MsdkCore.PaymentMethodCard) {
        self.coreType = coreType
    }

    let coreType: MsdkCore.PaymentMethodCard

    public var cardNumberMinLength: Int? {
        coreType.minLength?.intValue
    }
    public var cardNumberMaxLength: Int? {
        coreType.maxLength?.intValue
    }

    public var cardType: CardType {
        return CardType.createFrom(coreType.code)
    }

    var code: String? {
        coreType.code
    }

    var regExp: String? {
        coreType.regExp
    }
}
