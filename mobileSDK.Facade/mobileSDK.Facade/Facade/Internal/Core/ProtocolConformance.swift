//
//  ProtocolConformance.swift
//  ecommpaySDK
//
//  Created by Ivan Krapivtsev on 21.07.2022.
//

import MsdkCore
import mobileSDK_UI

extension MsdkCore.PaymentMethod: mobileSDK_UI.PaymentMethod {
    public var allSupportedCardTypes: [mobileSDK_UI.PaymentMethodCard] {
        allCardTypes as [mobileSDK_UI.PaymentMethodCard]
    }

    public var connectedCardTypes: [CardType] {
        availableCardTypes.map(CardType.createFrom(_:))
    }

    public var cardTypeRecognizer: CardTypeRecognizer {
        cardTypesManager
    }

    public var methodCustomerFields: [mobileSDK_UI.CustomerField] {
        self.customerFields as [mobileSDK_UI.CustomerField]
    }

    public var methodType: mobileSDK_UI.PaymentMethodType {
        mobileSDK_UI.PaymentMethodType.createFrom(self.paymentMethodType)
    }
}
extension MsdkCore.SavedAccount: mobileSDK_UI.SavedAccount {
    public var savedAccountCardType: CardType {
        CardType.createFrom(cardType)
    }

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

extension MsdkCore.CustomerField: mobileSDK_UI.CustomerField {
    public var fieldServerType: mobileSDK_UI.FieldServerType {
        .createFrom(code: self.serverType)
    }

    public var validatonMethod: mobileSDK_UI.Validator<String>? {
        guard let validator = self.validator else { return nil }
        return {
            validator.isValid(value: $0)
        }
    }

    public var fieldType: mobileSDK_UI.FieldType {
        return .createFrom(code: self.type)
    }
}

extension MsdkCore.ClarificationField: mobileSDK_UI.ClarificationField {
    public var validatonMethod: mobileSDK_UI.Validator<String>? {
        guard let validator = self.validator else { return nil }
        return {
            validator.isValid(value: $0)
        }
    }
}

extension MsdkCore.PaymentStatus: mobileSDK_UI.PaymentStatus {}
extension MsdkCore.Account: mobileSDK_UI.Account {}
extension MsdkCore.CompleteField: mobileSDK_UI.CompleteField {}

extension MsdkCore.Payment: mobileSDK_UI.Payment {
    public var paymentCompleteFields: [mobileSDK_UI.CompleteField]? {
        completeFields as [mobileSDK_UI.CompleteField]?
    }

    public var paymentAccount: mobileSDK_UI.Account? {
        return account
    }
}

extension MsdkCore.AcsPage: mobileSDK_UI.AcsPage {
    public var acsUrl: String? {
        acs?.acsUrl
    }

    public var md: String? {
        acs?.md
    }

    public var paReq: String? {
        acs?.paReq
    }

    public var termUrl: String? {
        acs?.termUrl
    }
}

class StringResourceManagerAdapter: mobileSDK_UI.StringResourceManager {
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

extension AdditionalField: mobileSDK_UI.AdditionalField {}
