//
//  ModelTypes.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 21.07.2022.
//

import SwiftUI
import PassKit

public enum InitEvent {
    case onPaymentRestored(Payment)
    case onInitReceived(paymentMethods: [PaymentMethod], savedAccounts: [SavedAccount])
}

public enum PayEvent {
    // need handle and send customer fields
    case onCustomerFields(customerFields: [CustomerField])
    // received clarification fields, which need to fill and send
    case onClarificationFields(clarificationFields: [ClarificationField], payment: Payment)

    case onCompleteWithDecline(isTryAgain: Bool, paymentMessage: String?, payment: Payment)

    case onCompleteWithSuccess(payment: Payment)

    case onPaymentCreated

    case onStatusChanged(status: PaymentStatus, payment: Payment)
    // received 3ds page and need open it in WebView
    case onThreeDSecure(page: ThreeDSecurePage, isCascading: Bool, payment: Payment)
    
    case onThreeDSecureRedirectComplete
}

public enum ActionType: Int {
    case Sale = 1
    case Auth = 2
    case Tokenize = 3
    case Verify = 4
}

public enum ThreeDSecurePageType: Int {
    case THREE_DS_1 = 1
    case THREE_DS_2_FRICTIONLESS = 2
    case THREE_DS_2_CHALLENGE = 3
}

public enum WalletSaveMode: Int {
    case never = 0
    case askCustomer = 1
    case always = 2
}

public typealias Validator<Type> = (_ isValid: Type) -> Bool

public protocol CustomerField {
    var name: String { get }
    var isRequired: Bool { get }
    var isHidden: Bool { get }
    var isTokenize: Bool { get }
    var hint: String? { get }
    var label: String { get }
    var placeholder: String? { get }
    var validationMethod: Validator<String>? { get }
    var fieldServerType: FieldServerType { get }
    var errorMessage: String? { get }
    var errorMessageKey: String { get }
}

public protocol Payment {
    var id: String? { get }
    var date: String? { get }
    var paymentAccount: Account? { get }
    var paymentCompleteFields: [CompleteField]? { get }
    var paymentMassage: String? { get }
    var uiPaymentMethodType: PaymentMethodType { get }
    var paymentStatus: PaymentStatus? { get }
    var method: String? { get }
    var token: String? { get }
    var recurringId: Int? { get }
}

public protocol CompleteField {
    var defaultLabel: String? { get }
    var name: String? { get }
    var value: String? { get }
}

public protocol Account {
    var number: String? { get }
    var type: String? { get }
}

public protocol PaymentMethod {
    var code: String { get }
    var methodCustomerFields: [CustomerField] { get }
    var isVatInfo: Bool { get }
    var methodType: PaymentMethodType { get }
    var name: String? { get }
    var connectedCardTypes: [CardType] { get }
    var cardTypeRecognizer: CardTypeRecognizer? { get }
    var iconUrl: String? { get }
    var translations: [String: String] { get }
    var paymentUrl: String? { get }
    var walletSaveMode: WalletSaveMode { get }
}

public protocol SavedAccount {
    var id: Int64 { get }
    var number: String? { get }
    var token: String? { get }
    var type: String? { get }
    var savedCardExpiry: CardExpiry? { get }
    var savedAccountCardType: CardType { get }
}

public protocol ClarificationField {
    var name: String { get }
    var validationMethod: Validator<String>? { get }
    var defaultPlaceholder: String? { get }
    var defaultHint: String? { get }
    var defaultLabel: String? { get }
    var defaultErrorMessage: String? { get }
}

public protocol PaymentStatus {
    var isFinal: Bool { get }
    var isTryAgain: Bool { get }
}

public protocol ThreeDSecurePage {
    var content: String? { get }
    var loadUrl: String? { get }
    var returnUrl: String? { get }
    var type: ThreeDSecurePageType? { get }
}

public protocol CardExpiry {
    func isValid() -> Bool
    var expiryMonth: Int32? { get }
    var stringValue: String { get }
    var expiryYear: Int32? { get }
}

public protocol PaymentMethodCard {
    var code: String? { get }
    var regExp: String? { get }
    var cardNumberMinLength: Int? { get }
    var cardNumberMaxLength: Int? { get }
    var cardType: CardType { get }
}

public protocol PaymentOptions {
    var languageCode: String? { get }
    var action: ActionType { get }
    var summary: PaymentSummaryData { get }
    var details: [PaymentDetailData] { get }
    var uiAdditionalFields: [AdditionalField] { get }
    var isMockModeEnabled: Bool { get }
    var brandColorOverride: Color? { get }
    var applePayMerchantID: String? { get }
    var appleCountryCode: String? { get }
    var paymentID: String { get }
    var paymentDescription: String? { get }
    var applePayDescription: String? { get }
    var pkPaymentRequest: PKPaymentRequest? { get }
    var token: String? { get }
    var recipientInfo: RecipientInfo? { get }
    var screenDisplayModes: Set<ScreenDisplayMode> { get }
    var recurringRegister: Bool { get }
    var recurringRegular: Bool { get }
    var recurringDetails: [RecurringDetailsData] { get }
    var recurringDisclaimer: L? { get }
    var isDarkThemeOn: Bool { get }
    var hideScanningCards: Bool { get }
}

public protocol AdditionalField {
    var name: String { get }
    var value: String { get }
}

public protocol RecipientInfo {
    var walletId: String? { get }
    var walletOwner: String?  { get }
    var pan: String? { get }
    var cardHolder: String? { get }
    var country: String? { get }
    var stateCode: String? { get }
    var city: String? { get }
    var address: String? { get }
}
