//
//  ModelTypes.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 21.07.2022.
//

import Foundation

public enum InitEvent {
    case onPaymentRestored(Payment)
    case onInitReceived(paymentMethods: [PaymentMethod], savedAccounts: [SavedAccount])
}

public enum PayEvent {
    // need handle and send customer fields
    case onCustomerFields(customerFields: [CustomerField])
    // received clarification fields, which need to fill and send
    case onClarificationFields(clarificationFields: [ClarificationField], payment: Payment)

    case onCompleteWithDecline(payment: Payment)

    case onCompleteWithFail(status: String?, payment: Payment)

    case onCompleteWithSuccess(payment: Payment)

    case onPaymentCreated

    case onStatusChanged(status: PaymentStatus, payment: Payment)
    // received 3ds page and need open it in WebView
    case onThreeDSecure(acsPage: AcsPage, isCascading: Bool, payment: Payment)
}

public protocol CustomerField {}

public protocol Payment {}

public protocol PaymentMethod {
    var code: String { get }
    var methodCustomerFields: [CustomerField] { get }
    var isVatInfo: Bool { get }
    var methodType: PaymentMethodType { get }
    var name: String? { get }
    var methodCardTypes: [PaymentMethodCard] { get }
}

public protocol SavedAccount {
    var cardUrlLogo: String? { get }
    var id: Int64 { get }
    var number: String? { get }
    var token: String? { get }
    var type: String? { get }
    var savedCardExpiry: CardExpiry? { get }
}

public protocol ClarificationField {}

public protocol PaymentStatus {}

public protocol AcsPage {}

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
