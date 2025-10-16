//
//  ProtocolConformance.swift
//  etoedtoSDK
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
    var wrapper: mobileSDK_UI.PaymentMethod {
        MsdkCorePaymentMethodWrapper(coreType: self)
    }
}

private struct MsdkCorePaymentMethodWrapper: mobileSDK_UI.PaymentMethod {
    let coreType: MsdkCore.PaymentMethod
    var code: String { coreType.code }
    var isVatInfo: Bool { coreType.isVatInfo }
    var name: String? { coreType.name }
    var iconUrl: String? { coreType.iconUrl }
    var translations: [String: String] { coreType.translations }
    var paymentUrl: String? { coreType.paymentUrl }
    
    var walletSaveMode: mobileSDK_UI.WalletSaveMode {
        mobileSDK_UI.WalletSaveMode.createFrom(coreType.walletSaveMode)
    }
    
    var connectedCardTypes: [CardType] {
        coreType.availableCardTypes.map(CardType.createFrom(_:))
    }

    var cardTypeRecognizer: CardTypeRecognizer? {
        coreType.cardTypesManager?.wrapper
    }

    var methodCustomerFields: [mobileSDK_UI.CustomerField] {
        coreType.customerFields.map { $0.wrapper } as [mobileSDK_UI.CustomerField]
    }

    var methodType: mobileSDK_UI.PaymentMethodType {
        mobileSDK_UI.PaymentMethodType.createFrom(coreType.paymentMethodType)
    }
    
    fileprivate init(coreType: MsdkCore.PaymentMethod) {
        self.coreType = coreType
    }
}

internal extension MsdkCore.SavedAccount {
    var wrapper: mobileSDK_UI.SavedAccount {
        MsdkCoreSavedAccountWrapper(coreType: self)
    }
}

private struct MsdkCoreSavedAccountWrapper: mobileSDK_UI.SavedAccount {
    public var savedAccountCardType: CardType { CardType.createFrom(coreType.cardType) }
    public var savedCardExpiry: CardExpiry? { coreType.cardExpiry?.wrapper }

    let coreType: MsdkCore.SavedAccount
    var id: Int64 { coreType.id }
    var number: String? { coreType.number }
    var token: String? { coreType.token }
    var type: String? { coreType.type }

    fileprivate init(coreType: MsdkCore.SavedAccount) {
        self.coreType = coreType
    }
}

internal extension MsdkCore.SdkExpiry {
    var wrapper: mobileSDK_UI.CardExpiry {
        MsdkCoreExpiryWrapper(coreType: self)
    }
}

private struct MsdkCoreExpiryWrapper: mobileSDK_UI.CardExpiry {
    public var expiryMonth: Int32? { coreType.month?.int32Value }
    public var expiryYear: Int32? { coreType.year?.int32Value }
    
    let coreType: MsdkCore.SdkExpiry
    var stringValue: String { coreType.stringValue }
    
    fileprivate init(coreType: MsdkCore.SdkExpiry) {
        self.coreType = coreType
    }
    
    func isValid() -> Bool { coreType.isValid() && coreType.isMoreThanNow() }
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
    var wrapper: mobileSDK_UI.CustomerField {
        MsdkCoreCustomerFieldWrapper(coreType: self)
    }
}

struct MsdkCoreCustomerFieldWrapper: mobileSDK_UI.CustomerField {
    public var fieldServerType: mobileSDK_UI.FieldServerType {
        .createFrom(code: coreType.serverType)
    }
    
    let coreType: MsdkCore.CustomerField
    var name: String { coreType.name }
    var isRequired: Bool { coreType.isRequired }
    var isHidden: Bool { coreType.isHidden }
    var isTokenize: Bool { coreType.isTokenize }
    var hint: String? { coreType.hint }
    var label: String { coreType.label }
    var placeholder: String? { coreType.placeholder }
    var errorMessage: String? { coreType.errorMessage }
    var errorMessageKey: String { coreType.errorMessageKey }
    var validationMethod: mobileSDK_UI.Validator<String>? {
        guard let validator = coreType.validator else { return nil }
        return {
            validator.isValid(value: $0)
        }
    }
    
    var options: [any mobileSDK_UI.AdditionalField]? {
        coreType.options?
            .compactMap {
                guard let name = $0.name,
                      let value = $0.value
                else {
                    return nil
                }
                
                return AdditionalField(customName: name, value: value).wrapper
            }
    }
    
    fileprivate init(coreType: MsdkCore.CustomerField) {
        self.coreType = coreType
    }
}

internal extension MsdkCore.ClarificationField {
    var wrapper: mobileSDK_UI.ClarificationField {
        MsdkCoreClarificationFieldWrapper(coreType: self)
    }
}

private struct MsdkCoreClarificationFieldWrapper: mobileSDK_UI.ClarificationField {
    public var validationMethod: mobileSDK_UI.Validator<String>? {
        guard let validator = coreType.validator else { return nil }
        return {
            validator.isValid(value: $0)
        }
    }

    let coreType: MsdkCore.ClarificationField
    var name: String { coreType.name }
    var validatorName: String? { coreType.validatorName }
    var defaultPlaceholder: String? { coreType.defaultPlaceholder }
    var defaultHint: String? { coreType.defaultHint }
    var defaultLabel: String? { coreType.defaultLabel }
    var defaultErrorMessage: String? { coreType.defaultErrorMessage }
    
    fileprivate init(coreType: MsdkCore.ClarificationField) {
        self.coreType = coreType
    }
}

internal extension MsdkCore.PaymentStatus {
    var wrapper: mobileSDK_UI.PaymentStatus {
        MsdkCorePaymentStatusWrapper(coreType: self)
    }
}

private struct MsdkCorePaymentStatusWrapper: mobileSDK_UI.PaymentStatus {
    let coreType: MsdkCore.PaymentStatus
    var isFinal: Bool { coreType.isFinal }
    var isTryAgain: Bool { coreType == MsdkCore.PaymentStatus.awaitingCustomer }
    
    fileprivate init(coreType: MsdkCore.PaymentStatus) {
        self.coreType = coreType
    }
}

internal extension MsdkCore.Account {
    var wrapper: mobileSDK_UI.Account {
        MsdkCoreAccountWrapper(coreType: self)
    }
}

private struct MsdkCoreAccountWrapper: mobileSDK_UI.Account {
    let coreType: MsdkCore.Account
    var number: String? { coreType.number }
    var type: String? { coreType.type }
    var cardHolder: String? { coreType.cardHolder }
    
    fileprivate init(coreType: MsdkCore.Account) {
        self.coreType = coreType
    }
}

internal extension MsdkCore.CompleteField {
    var wrapper: mobileSDK_UI.CompleteField {
        MsdkCoreCompleteFieldWrapper(coreType: self)
    }
}

private struct MsdkCoreCompleteFieldWrapper: mobileSDK_UI.CompleteField {
    var defaultLabel: String? { coreType.defaultLabel }
    var name: String? { coreType.name }
    var value: String? { coreType.value }
    let coreType: MsdkCore.CompleteField
    
    fileprivate init(coreType: MsdkCore.CompleteField) {
        self.coreType = coreType
    }
}

internal extension MsdkCore.Payment {
    var wrapper: mobileSDK_UI.Payment {
        MsdkCorePaymentWrapper(coreType: self)
    }
}

internal struct MsdkCorePaymentWrapper: mobileSDK_UI.Payment {
    fileprivate init(coreType: MsdkCore.Payment) {
        self.coreType = coreType
    }

    let coreType: MsdkCore.Payment
    var id: String? { coreType.id }
    var date: String? { coreType.date }
    var paymentMassage: String? { coreType.paymentMassage }
    var method: String? { coreType.method }
    var token: String? { coreType.token }

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

    var recurringId: Int? {
        guard let value = coreType.recurringId else {
            return nil
        }

        return Int(truncating: value)
    }
}

internal extension MsdkCore.ThreeDSecurePage {
    var wrapper: mobileSDK_UI.ThreeDSecurePage {
        MsdkCoreThreeDSecurePageWrapper(coreType: self)
    }
}

private struct MsdkCoreThreeDSecurePageWrapper: mobileSDK_UI.ThreeDSecurePage {
    let coreType: MsdkCore.ThreeDSecurePage
    var loadUrl: String? { coreType.loadUrl }
    var returnUrl: String? { coreType.returnUrl }
    var content: String? { coreType.content }
    
    var type: mobileSDK_UI.ThreeDSecurePageType? {
        mobileSDK_UI.ThreeDSecurePageType.createFrom(coreType.type)
    }
    
    fileprivate init(coreType: MsdkCore.ThreeDSecurePage) {
        self.coreType = coreType
    }
}

internal struct StringResourceManagerAdapter: mobileSDK_UI.StringResourceManager {
    let manager: MsdkCore.StringResourceManager
    
    init(manager: MsdkCore.StringResourceManager) {
        self.manager = manager
    }
    
    func getLinkMessageByKey(key: String) -> mobileSDK_UI.TranslationWithLink? {
        return manager.getLinkMessageByKey(key: key)?.wrapper
    }

    func getStringByKey(key: String) -> String? {
        manager.getStringByKey(key: key)
    }
}

internal extension LinkMessage {
    var wrapper: mobileSDK_UI.TranslationWithLink {
        TranslationWithLink(
            message: message,
            name: message,
            messageLinks: links?
                .map { link in
                    Link(url: link.url, messageLink: link.message)
                }
        )
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
    var wrapper: mobileSDK_UI.AdditionalField {
        AdditionalFieldWrapper(publicType: self)
    }
}

private struct AdditionalFieldWrapper: mobileSDK_UI.AdditionalField {
    let name: String
    let value: String
    
    init(publicType: AdditionalField) {
        let processedValue: String = {
            switch publicType.type {
            case .customer_phone:
                return AdditionalFieldWrapper.normalizePhoneNumber(publicType.value)
            default:
                return publicType.value
            }
        }()

        let processedName: String = {
            switch publicType.type {
            case .custom:
                return publicType.serverName
            default:
                return publicType.type.description
            }
        }()

        self.value = processedValue
        self.name = processedName
    }

    private static func normalizePhoneNumber(_ phone: String) -> String {
        return phone.filter { $0.isNumber }
    }
}

internal extension RecipientInfo {
    var wrapper: mobileSDK_UI.RecipientInfo {
        RecipientInfoWrapper(publicType: self)
    }
}

private struct RecipientInfoWrapper: mobileSDK_UI.RecipientInfo {
    let publicType: RecipientInfo
    var walletId: String? { publicType.walletId }
    var walletOwner: String? { publicType.walletOwner }
    var pan: String? { publicType.pan }
    var cardHolder: String? { publicType.cardHolder }
    var country: String? { publicType.country }
    var stateCode: String? { publicType.stateCode }
    var city: String? { publicType.city }
    var address: String? { publicType.address }
    
    init(publicType: RecipientInfo) {
        self.publicType = publicType
    }
}
