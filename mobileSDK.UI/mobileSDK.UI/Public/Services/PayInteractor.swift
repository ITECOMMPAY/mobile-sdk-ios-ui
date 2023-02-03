//
//  PayInteractor.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 25.07.2022.
//

import Combine

public protocol PayInteractor {
    func execute(request: PayRequest) -> AnyPublisher<PayEvent, CoreError>
    func sendCustomerFields(fieldsValues: [FieldValue])
    func sendClarificationFields(fieldsValues: [FieldValue])
    func threeDSecureRedirectHandle(url: String)
}

public protocol PayRequest {
    func fillCustomerFields(customerFields: [FieldValue])
}

public protocol PayRequestFactory {
    func createSavedCardSaleRequest(
        cvv: String,
        accountId: Int64,
        recipientInfo: RecipientInfo?
    ) -> PayRequest

    func createSavedCardAuthRequest(
        cvv: String,
        accountId: Int64,
        recipientInfo: RecipientInfo?
    ) -> PayRequest

    func createNewCardSaleRequest(
        cvv: String,
        pan: String,
        year: Int32,
        month: Int32,
        cardHolder: String,
        saveCard: Bool,
        recipientInfo: RecipientInfo?
    ) -> PayRequest

    func createNewCardAuthRequest(
        cvv: String,
        pan: String,
        year: Int32,
        month: Int32,
        cardHolder: String,
        saveCard: Bool,
        recipientInfo: RecipientInfo?
    ) -> PayRequest

    func createTokenizeSaleRequest(
        cvv: String,
        recipientInfo: RecipientInfo?
    ) -> PayRequest

    func createTokenizeAuthRequest(
        cvv: String,
        recipientInfo: RecipientInfo?
    ) -> PayRequest

    func createApplePaySaleRequest(
        token: String,
        recipientInfo: RecipientInfo?
    ) -> PayRequest

    func createApplePayAuthRequest(
        token: String,
        recipientInfo: RecipientInfo?
    ) -> PayRequest

    func createAPSSaleRequest(methodCode: String) -> PayRequest

    func createPaymentRestoreRequest(methodCode: String) -> PayRequest
    
    func createTokenizeRequest(
        pan: String,
        month: Int32,
        year: Int32,
        cardHolder: String
    ) -> PayRequest

    func createVerifyCardRequest(
        cvv: String,
        pan: String,
        year: Int32,
        month: Int32,
        cardHolder: String
    ) -> mobileSDK_UI.PayRequest

    func createVerifyApplePayRequest(
        token: String
    ) -> mobileSDK_UI.PayRequest
}
