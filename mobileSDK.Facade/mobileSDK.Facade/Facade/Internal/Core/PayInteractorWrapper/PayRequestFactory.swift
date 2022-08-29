//
//  PayRequestFactory.swift
//  ecommpaySDK
//
//  Created by Ivan Krapivtsev on 25.07.2022.
//

import mobileSDK_UI
import MsdkCore

class PayRequestFactory: mobileSDK_UI.PayRequestFactory {
    func createSavedCardSaleRequest(cvv: String, accountId: Int64, customerFields: [FieldValue]?) -> mobileSDK_UI.PayRequest {
        let request = SavedCardSaleRequest(cvv: cvv, accountId: accountId)
        request.customerFields = customerFields?.map({ value in
            return MsdkCore.CustomerFieldValue(name: value.name, value: value.value)
        })
        return request
    }

    func createNewCardSaleRequest(cvv: String,
                                  pan: String,
                                  year: Int32,
                                  month: Int32,
                                  cardHolder: String,
                                  saveCard: Bool,
                                  customerFields: [FieldValue]?) -> mobileSDK_UI.PayRequest {
        let request = NewCardSaleRequest(cvv: cvv, pan: pan, year: year, month: month, cardHolder: cardHolder, saveCard: saveCard)
        request.customerFields = customerFields?.map({ value in
            return MsdkCore.CustomerFieldValue(name: value.name, value: value.value)
        })
        return request
    }

    func createApplePaySaleRequest(token: String, customerFields: [FieldValue]?) -> mobileSDK_UI.PayRequest {
        let request = ApplePaySaleRequest(token: token)
        request.customerFields = customerFields?.map({ value in
            return MsdkCore.CustomerFieldValue(name: value.name, value: value.value)
        })
        return request
    }

    func createApplePaySaleRequest(methodCode: String) -> mobileSDK_UI.PayRequest {
        return ApsSaleRequest(methodCode: methodCode)
    }
}

extension SavedCardSaleRequest: mobileSDK_UI.PayRequest {}
extension NewCardSaleRequest: mobileSDK_UI.PayRequest {}
extension ApplePayRequest: mobileSDK_UI.PayRequest {}
extension ApsSaleRequest: mobileSDK_UI.PayRequest {}
