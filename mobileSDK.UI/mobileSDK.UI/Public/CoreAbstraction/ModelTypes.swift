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

    case onCompleteWithDecline(paymentMessage: String?, payment: Payment)

    case onCompleteWithFail(isTryAgain: Bool, paymentMessage: String?, payment: Payment)

    case onCompleteWithSuccess(payment: Payment)

    case onPaymentCreated

    case onStatusChanged(status: PaymentStatus, payment: Payment)
    // received 3ds page and need open it in WebView
    case onThreeDSecure(acsPage: AcsPage, isCascading: Bool, payment: Payment)
}

public typealias Validator<Type> = (_ isValid: Type) -> Bool

public protocol CustomerField {
    var name: String { get }
    var isRequired: Bool { get }
    var isHidden: Bool { get }
    var isTokenize: Bool { get }
    var isVerify: Bool { get }
    var hint: String? { get }
    var label: String { get }
    var placeholder: String? { get }
    var validatorName: String? { get }
    var validatonMethod: Validator<String>? { get }
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
    var allSupportedCardTypes: [PaymentMethodCard] { get }
    var connectedCardTypes: [CardType] { get }
    var cardTypeRecognizer: CardTypeRecognizer { get }
    var iconUrl: String? { get }
    var translations: [String: String] { get }
    var paymentUrl: String? { get }
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
    var validatorName: String? { get }
    var validatonMethod: Validator<String>? { get }
    var defaultPlaceholder: String? { get }
    var defaultHint: String? { get }
    var defaultLabel: String? { get }
    var defaultErrorMessage: String? { get }
}

public protocol PaymentStatus {
    var isFinal: Bool { get }
}

public protocol AcsPage {
    var content: String? { get }
    var errorMessage: String? { get }
    var acsUrl: String? { get }
    var md: String? { get }
    var paReq: String? { get }
    var termUrl: String? { get }
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
    var summary: PaymentSummaryData { get }
    var details: [PaymentDetailData] { get }
    var uiAdditionalFields: [AdditionalField] { get }
    var isMockModeEnabled: Bool { get }
    var brandColorOverride: Color? { get }
    var applePayMerchantID: String? { get }
    var appleCountryCode: String? { get }
    var paymentID: String { get }
    var applePayDescription: String? { get }
    var pkPaymentRequest: PKPaymentRequest? { get }
}

public protocol AdditionalField {
    var name: String { get }
    var value: String { get }
}
