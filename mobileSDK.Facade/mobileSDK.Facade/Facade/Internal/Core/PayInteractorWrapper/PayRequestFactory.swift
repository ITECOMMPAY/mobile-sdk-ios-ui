//
//  PayRequestFactory.swift
//  ecommpaySDK
//
//  Created by Ivan Krapivtsev on 25.07.2022.
//

@_implementationOnly import mobileSDK_UI
@_implementationOnly import MsdkCore

class PayRequestFactory: mobileSDK_UI.PayRequestFactory {
    func createSavedCardSaleRequest(cvv: String, accountId: Int64, customerFields: [FieldValue]?) -> mobileSDK_UI.PayRequest {
        let request = SavedCardSaleRequest(cvv: cvv, accountId: accountId)
        request.customerFields = customerFields?.map({ value in
            return MsdkCore.CustomerFieldValue(name: value.name, value: value.value)
        })
        return PayRequestWrapper(coreRequest: request)
    }

    func createNewCardSaleRequest(cvv: String,
                                  pan: String,
                                  year: Int32,
                                  month: Int32,
                                  cardHolder: String,
                                  saveCard: Bool,
                                  customerFields: [FieldValue]?) -> mobileSDK_UI.PayRequest {
        let request = NewCardSaleRequest(cvv: cvv, pan: pan, expiryDate: CardDate(month: month, year: year), cardHolder: cardHolder, saveCard: saveCard)
        request.customerFields = customerFields?.map({ value in
            return MsdkCore.CustomerFieldValue(name: value.name, value: value.value)
        })
        return PayRequestWrapper(coreRequest: request)
    }

    func createApplePaySaleRequest(token: String, customerFields: [FieldValue]?) -> mobileSDK_UI.PayRequest {
        #if targetEnvironment(simulator) && DEBUG
        let request = ApplePaySaleRequest(token: "qqweqweqweqweqwe")
        #else
        let request = ApplePaySaleRequest(token: token)
        #endif
        request.customerFields = customerFields?.map({ value in
            return MsdkCore.CustomerFieldValue(name: value.name, value: value.value)
        })
        return PayRequestWrapper(coreRequest: request)
    }

    func createAPSSaleRequest(methodCode: String) -> mobileSDK_UI.PayRequest {
        PayRequestWrapper(coreRequest: ApsSaleRequest(methodCode: methodCode))
    }

    func createPaymentRestoreRequest(methodCode: String) -> mobileSDK_UI.PayRequest {
        PayRequestWrapper(coreRequest: PaymentRestoreRequest())
    }
}

internal struct PayRequestWrapper: mobileSDK_UI.PayRequest {
    let coreRequest: MsdkCore.PayRequest
}
