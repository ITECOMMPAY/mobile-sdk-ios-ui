//
//  ProtocolConformance.swift
//  ecommpaySDK
//
//  Created by Ivan Krapivtsev on 21.07.2022.
//


#if !DEVELOPMENT
@_implementationOnly import MsdkCore
@_implementationOnly import mobileSDK_UI
#else
import MsdkCore
import mobileSDK_UI
#endif

internal extension MsdkCore.PaymentMethod {
    var wrapper: some mobileSDK_UI.PaymentMethod {
        MsdkCorePaymentMethodWrapper(coreType: self)
    }
}

private struct MsdkCorePaymentMethodWrapper: mobileSDK_UI.PaymentMethod {
    fileprivate init(coreType: MsdkCore.PaymentMethod) {
        self.coreType = coreType
    }

    let coreType: MsdkCore.PaymentMethod

    var allSupportedCardTypes: [mobileSDK_UI.PaymentMethodCard] {
        coreType.allCardTypes.map { $0.wrapper } as [mobileSDK_UI.PaymentMethodCard]
    }

    var connectedCardTypes: [CardType] {
        coreType.availableCardTypes.map(CardType.createFrom(_:))
    }

    var cardTypeRecognizer: CardTypeRecognizer {
        coreType.cardTypesManager.wrapper
    }

    var methodCustomerFields: [mobileSDK_UI.CustomerField] {
        coreType.customerFields.map { $0.wrapper } as [mobileSDK_UI.CustomerField]
    }

    var methodType: mobileSDK_UI.PaymentMethodType {
        mobileSDK_UI.PaymentMethodType.createFrom(coreType.paymentMethodType)
    }

    var code: String { coreType.code }

    var isVatInfo: Bool { coreType.isVatInfo }

    var name: String? { coreType.name }

    var iconUrl: String? { coreType.iconUrl }

    var translations: [String: String] { coreType.translations }

    var paymentUrl: String? { coreType.paymentUrl }
}

internal extension MsdkCore.SavedAccount {
    var wrapper: some mobileSDK_UI.SavedAccount {
        MsdkCoreSavedAccountWrapper(coreType: self)
    }
}

private struct MsdkCoreSavedAccountWrapper: mobileSDK_UI.SavedAccount {

    fileprivate init(coreType: MsdkCore.SavedAccount) {
        self.coreType = coreType
    }

    let coreType: MsdkCore.SavedAccount

    public var savedAccountCardType: CardType { CardType.createFrom(coreType.cardType) }

    public var savedCardExpiry: CardExpiry? { coreType.cardExpiry?.wrapper }

    var id: Int64 { coreType.id }

    var number: String? { coreType.number }

    var token: String? { coreType.token }

    var type: String? { coreType.type }

}

internal extension MsdkCore.SdkExpiry {
    var wrapper: some mobileSDK_UI.CardExpiry {
        MsdkCoreExpiryWrapper(coreType: self)
    }
}

private struct MsdkCoreExpiryWrapper: mobileSDK_UI.CardExpiry {
    fileprivate init(coreType: MsdkCore.SdkExpiry) {
        self.coreType = coreType
    }

    let coreType: MsdkCore.SdkExpiry

    public var expiryMonth: Int32? { coreType.month?.int32Value }

    public var expiryYear: Int32? { coreType.year?.int32Value }

    func isValid() -> Bool { coreType.isValid()}

    var stringValue: String { coreType.stringValue }
}

internal struct CardExpiryFabric: mobileSDK_UI.CardExpiryFabric {
    public func createCardExpiry(with string: String) -> mobileSDK_UI.CardExpiry {
        return MsdkCore.SdkExpiry.init(text: string).wrapper
    }
}

internal class CoreValidationService: ValidationService {
    func isCardHolderNameValid(value: String) -> Bool {
        CardHolderNameValidator().isValid(value: value)
    }
    func isPanValidatorValid(value: String) -> Bool {
        PanValidator().isValid(value: value)
    }
}

extension MsdkCore.CustomerField {
    var wrapper: some mobileSDK_UI.CustomerField {
        MsdkCoreCustomerFieldWrapper(coreType: self)
    }
}

struct MsdkCoreCustomerFieldWrapper: mobileSDK_UI.CustomerField {
    fileprivate init(coreType: MsdkCore.CustomerField) {
        self.coreType = coreType
    }

    let coreType: MsdkCore.CustomerField

    public var fieldServerType: mobileSDK_UI.FieldServerType {
        .createFrom(code: coreType.serverType)
    }

    var validationMethod: mobileSDK_UI.Validator<String>? {
        guard let validator = coreType.validator else { return nil }
        return {
            validator.isValid(value: $0)
        }
    }

    var name: String { coreType.name }

    var isRequired: Bool { coreType.isRequired }

    var isHidden: Bool { coreType.isHidden }

    var isTokenize: Bool { coreType.isTokenize }

    var isVerify: Bool { coreType.isVerify }

    var hint: String? { coreType.hint }

    var label: String { coreType.label }

    var placeholder: String? { coreType.placeholder }

    var errorMessage: String? { coreType.errorMessage }

    var errorMessageKey: String { coreType.errorMessageKey }
}

internal extension MsdkCore.ClarificationField {
    var wrapper: some mobileSDK_UI.ClarificationField {
        MsdkCoreClarificationFieldWrapper(coreType: self)
    }
}

private struct MsdkCoreClarificationFieldWrapper: mobileSDK_UI.ClarificationField {

    fileprivate init(coreType: MsdkCore.ClarificationField) {
        self.coreType = coreType
    }

    let coreType: MsdkCore.ClarificationField

    public var validationMethod: mobileSDK_UI.Validator<String>? {
        guard let validator = coreType.validator else { return nil }
        return {
            validator.isValid(value: $0)
        }
    }

    var name: String { coreType.name }

    var validatorName: String? { coreType.validatorName }

    var defaultPlaceholder: String? { coreType.defaultPlaceholder }

    var defaultHint: String? { coreType.defaultHint }

    var defaultLabel: String? { coreType.defaultLabel }

    var defaultErrorMessage: String? { coreType.defaultErrorMessage }
}

internal extension MsdkCore.PaymentStatus {
    var wrapper: some mobileSDK_UI.PaymentStatus {
        MsdkCorePaymentStatusWrapper(coreType: self)
    }
}

private struct MsdkCorePaymentStatusWrapper: mobileSDK_UI.PaymentStatus {
    fileprivate init(coreType: MsdkCore.PaymentStatus) {
        self.coreType = coreType
    }

    let coreType: MsdkCore.PaymentStatus

    var isFinal: Bool { coreType.isFinal }
}

internal extension MsdkCore.Account {
    var wrapper: some mobileSDK_UI.Account {
        MsdkCoreAccountWrapper(coreType: self)
    }
}

private struct MsdkCoreAccountWrapper: mobileSDK_UI.Account {
    fileprivate init(coreType: MsdkCore.Account) {
        self.coreType = coreType
    }

    let coreType: MsdkCore.Account

    var number: String? { coreType.number }

    var type: String? { coreType.type }
}

internal extension MsdkCore.CompleteField {
    var wrapper: some mobileSDK_UI.CompleteField {
        MsdkCoreCompleteFieldWrapper(coreType: self)
    }
}

private struct MsdkCoreCompleteFieldWrapper: mobileSDK_UI.CompleteField {
    var defaultLabel: String? { coreType.defaultLabel }

    var name: String? { coreType.name }

    var value: String? { coreType.value }

    fileprivate init(coreType: MsdkCore.CompleteField) {
        self.coreType = coreType
    }

    let coreType: MsdkCore.CompleteField
}

internal extension MsdkCore.Payment {
    var wrapper: some mobileSDK_UI.Payment {
        MsdkCorePaymentWrapper(coreType: self)
    }
}

private struct MsdkCorePaymentWrapper: mobileSDK_UI.Payment {
    fileprivate init(coreType: MsdkCore.Payment) {
        self.coreType = coreType
    }

    let coreType: MsdkCore.Payment

    var paymentStatus: mobileSDK_UI.PaymentStatus? {
        coreType.status?.wrapper as mobileSDK_UI.PaymentStatus?
    }

    var paymentCompleteFields: [mobileSDK_UI.CompleteField]? {
        coreType.completeFields?.map { $0.wrapper } as [mobileSDK_UI.CompleteField]?
    }

    var paymentAccount: mobileSDK_UI.Account? {
        coreType.account?.wrapper
    }

    var uiPaymentMethodType: mobileSDK_UI.PaymentMethodType {
        mobileSDK_UI.PaymentMethodType.createFrom(coreType.paymentMethodType)
    }

    var id: String? { coreType.id }

    var date: String? { coreType.date }

    var paymentMassage: String? { coreType.paymentMassage }

    var method: String? { coreType.method }
}

internal extension MsdkCore.AcsPage {
    var wrapper: some mobileSDK_UI.AcsPage {
        MsdkCoreAcsPageWrapper(coreType: self)
    }
}

private struct MsdkCoreAcsPageWrapper: mobileSDK_UI.AcsPage {
    fileprivate init(coreType: MsdkCore.AcsPage) {
        self.coreType = coreType
    }

    let coreType: MsdkCore.AcsPage

    var acsUrl: String? { coreType.acs?.acsUrl }

    var termUrl: String? { coreType.acs?.termUrl }

    var content: String? { coreType.content }
}

internal struct StringResourceManagerAdapter: mobileSDK_UI.StringResourceManager {
    func getLinkMessageByKey(key: String) -> mobileSDK_UI.TranslationWithLink? {
        return manager.getLinkMessageByKey(key: key)?.wrapper
    }

    func getStringByKey(key: String) -> String? {
        manager.getStringByKey(key: key)
    }

    let manager: MsdkCore.StringResourceManager

    init(manager: MsdkCore.StringResourceManager) {
        self.manager = manager
    }
}

internal extension LinkMessage {
    var wrapper: some mobileSDK_UI.TranslationWithLink {
        TranslationWithLink(message: message, name: message, messageLinks: links?.map({ link in
            Link(url: link.url, messageLink: link.message)
        }))
    }
}

private struct TranslationWithLink: mobileSDK_UI.TranslationWithLink {
    let message: String?
    let name: String?
    let messageLinks: [mobileSDK_UI.Link]?
}

private struct Link: mobileSDK_UI.Link {
    let url: String?
    let messageLink: String?
}

internal extension AdditionalField {
    var wrapper: some mobileSDK_UI.AdditionalField {
        AdditionalFieldWrapper(publicType: self)
    }
}

private struct AdditionalFieldWrapper: mobileSDK_UI.AdditionalField {
    init(publicType: AdditionalField) {
        value = publicType.value
        name = {
            switch publicType.type {
            case .custom:
                return publicType.serverName
            default:
                return publicType.type.description
            }
        }()
    }

    let name: String
    let value: String
}
