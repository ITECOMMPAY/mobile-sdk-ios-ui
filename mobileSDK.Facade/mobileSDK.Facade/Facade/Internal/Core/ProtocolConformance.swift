//
//  ProtocolConformance.swift
//  ecommpaySDK
//
//  Created by Ivan Krapivev on 21.07.2022.
//

import MsdkCore
import mobileSDK_UI

extension MsdkCore.PaymentMethod: mobileSDK_UI.PaymentMethod {
    public var cardTypeRecognizer: CardTypeRecognizer {
        self.cardTypesManager
    }

    public var methodCardTypes: [mobileSDK_UI.PaymentMethodCard] {
        self.cardTypes as [mobileSDK_UI.PaymentMethodCard]
    }

    public var methodCustomerFields: [mobileSDK_UI.CustomerField] {
        return self.customerFields as [mobileSDK_UI.CustomerField]
    }

    public var methodType: mobileSDK_UI.PaymentMethodType {
        mobileSDK_UI.PaymentMethodType.createFrom(self.type)
    }
}
extension MsdkCore.SavedAccount: mobileSDK_UI.SavedAccount {
    public var savedCardExpiry: CardExpiry? {
        return self.cardExpiry
    }
}

extension MsdkCore.SdkExpiry: CardExpiry, mobileSDK_UI.CardExpiryFabric {
    public var expiryMonth: Int32? {
        self.month?.int32Value
    }

    public var expiryYear: Int32? {
        self.year?.int32Value
    }

    public func createCardExpiry(with string: String) -> CardExpiry {
        return MsdkCore.SdkExpiry.init(text: string)
    }
}

class CoreValidationService: ValidationService {
    func isCardHolderNameValid(value: String) -> Bool {
        CardHolderNameValidator().isValid(value: value)
    }
    func isPanValidatorValid(value: String) -> Bool {
        PanValidator().isValid(value: value)
    }
}

extension MsdkCore.CustomerField: mobileSDK_UI.CustomerField {}
extension MsdkCore.ClarificationField: mobileSDK_UI.ClarificationField {}
extension MsdkCore.PaymentStatus: mobileSDK_UI.PaymentStatus {}
extension MsdkCore.Payment: mobileSDK_UI.Payment {}
extension MsdkCore.AcsPage: mobileSDK_UI.AcsPage {}

class StringResourceManagerAdapter:  mobileSDK_UI.StringResourceManager {
    func getLinkMessageByKey(key: String) -> TranslationWithLink {
        return manger.getLinkMessageByKey(key: key)
    }

    func getStringByKey(key: String) -> String {
        manger.getStringByKey(key: key)
    }

    let manger: MsdkCore.StringResourceManager

    init(manger: MsdkCore.StringResourceManager) {
        self.manger = manger
    }
}

extension LinkMessage: TranslationWithLink {
    public var name: String? {
        self.message
    }

    public var messageLinks: [mobileSDK_UI.Link]? {
        return links
    }
}

extension MsdkCore.Link: mobileSDK_UI.Link {
    public var messageLink: String? {
        message
    }
}
