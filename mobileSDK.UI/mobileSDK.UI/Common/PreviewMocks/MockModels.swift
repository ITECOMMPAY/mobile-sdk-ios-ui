//
//  MockModels.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 12.08.2022.
//

import SwiftUI
import PassKit

#if DEBUG

class MockRootViewModel: RootViewModelProtocol {
    func dispatch(intent: RootIntent) {
        print("Intent \(String(describing: intent)) triggered")
    }

    let state: RootState

    init(with state: RootState) {
        self.state = state
    }
}

struct MockCardExpiry: CardExpiry {
    func isValid() -> Bool {
        true
    }

    var expiryMonth: Int32? = 4
    var stringValue: String = "0423"
    var expiryYear: Int32? = 23
}

struct MockCustomerField: CustomerField {
    var fieldServerType: FieldServerType = .text
    var name: String = "MockCustomerField_name"
    var isRequired: Bool = true
    var isHidden: Bool = false
    var isTokenize: Bool = false
    var isVerify: Bool = false
    var hint: String? = "mockField hint"
    var label: String = "mockField label"
    var placeholder: String? = "mockField placeholder"
    var validatorName: String? = "mockField validatorName"
    var validatonMethod: Validator<String>? = { _ in true }
    var fieldType: FieldType = .unknown
    var errorMessage: String? = "mockField error"
    var errorMessageKey: String = "mockField error key"
}

struct MockPayment: Payment {
    var id: String = "MockPayment id"
    var date: String? = "2022-02-02 02:02"
    var paymentAccount: Account? = MockAccount()
    var paymentCompleteFields: [CompleteField]? = [ MockCompleteField(), MockCompleteField() ]
    var paymentMassage: String? = "MockPayment_paymentMassage"
}

struct MockAccount: Account {
    var number: String? = "MockAccount_number"
    var type: String? = "MockAccount_type"
}

struct MockCompleteField: CompleteField {
    var defaultLabel: String? = "MockCompleteField_defaultLabel"
    var name: String?
    var value: String? = "MockCompleteField_value"
}

struct MockCarificationField: ClarificationField {
    var name: String = "MockCarificationField_name"
    var validatorName: String? = "MockCarificationField_validatorName"
    var validatonMethod: Validator<String>?
    var defaultPlaceholder: String? = "MockCarificationField_defaultPlaceholder"
    var defaultHint: String? = "MockCarificationField_defaultHint"
    var defaultLabel: String? = "MockCarificationField_defaultLabel"
    var defaultErrorMessage: String? = "MockCarificationField_defaultErrorMessage"
}

struct MockPaymentOptions: PaymentOptions {
    var pkPaymentRequest: PKPaymentRequest? = nil
    
    var paymentID: String = "123"

    var applePayDescription: String? = nil

    var appleCountryCode: String?

    var applePayMerchantID: String? = nil

    var brandColorOverride: Color?

    var isMockModeEnabled: Bool = true

    var summary: PaymentSummaryData = PaymentSummaryData(currency: "RUB", value: 123.23)

    var details: [PaymentDetailData] = [
        PaymentDetailData(title: L.title_payment_id,
                          description: "EP2e11-f018-RQR12-26VL-0412CS",
                          canBeCopied: true),
        PaymentDetailData(title: L.title_payment_information_description,
                          description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                          canBeCopied: false)
    ]

    var uiAdditionalFields: [AdditionalField] = []
}

struct MockSavedAccount: SavedAccount {
    var id: Int64 = 100500
    var number: String? = "*** 1234"
    var token: String? = "***"
    var type: String? = "card"
    var savedCardExpiry: CardExpiry?
    var savedAccountCardType: CardType = .visa
}

struct MockPaymentMethod: PaymentMethod {
    var paymentUrl: String? = "ecommpay.com"
    var allSupportedCardTypes: [PaymentMethodCard] = []
    var connectedCardTypes: [CardType] = [ .visa ]
    struct MockCardTypeRecognizer: CardTypeRecognizer {
        func getCardType(for pan: String) -> PaymentMethodCard? {
            return nil
        }
    }

    var code: String = "card"
    var methodCustomerFields: [CustomerField] = [MockCustomerField()]
    var isVatInfo: Bool = true
    var methodType: PaymentMethodType = .card
    var name: String? = "Bank card"
    var cardTypeRecognizer: CardTypeRecognizer = MockCardTypeRecognizer()
    var iconUrl: String?
    var translations: [String: String] = [:]
}

struct MockAcsPage: AcsPage {
    var content: String?

    var errorMessage: String?

    var acsUrl: String? = "ecommpay.com"

    var md: String?

    var paReq: String?

    var termUrl: String?
}

let stateMock = RootState(
    isLoading: true,
    currentMethod: .init(entityType: .savedAccount(MockSavedAccount())),
    payment: MockPayment(),
    customerFields: [MockCustomerField(), MockCustomerField()],
    clarificationFields: [MockCarificationField(), MockCarificationField()],
    error: CoreError(code: .unknown, message: "Mock"),
    savedAccounts: [
        MockSavedAccount()
    ],
    availablePaymentMethods: [
        MockPaymentMethod()
    ],
    paymentOptions: MockPaymentOptions(),
    finalPaymentState: FinalPaymentState.Success,
    acsPageState: AcsPageState(acsPage: MockAcsPage(), isCascading: false)
)

#endif
