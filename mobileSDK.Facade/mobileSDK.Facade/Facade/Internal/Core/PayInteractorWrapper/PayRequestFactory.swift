//
//  PayRequestFactory.swift
//  ecommpaySDK
//
//  Created by Ivan Krapivtsev on 25.07.2022.
//

import mobileSDK_UI
import MsdkCore

class PayRequestFactory: mobileSDK_UI.PayRequestFactory {
    func createSavedCardSaleRequest(cvv: String, accountId: Int64) -> mobileSDK_UI.PayRequest {
        return SavedCardSaleRequest(cvv: cvv, accountId: accountId)
    }

    func createNewCardSaleRequest(cvv: String,
                                  pan: String,
                                  year: Int32,
                                  month: Int32,
                                  cardHolder: String,
                                  saveCard: Bool) -> mobileSDK_UI.PayRequest {
        return NewCardSaleRequest(cvv: cvv, pan: pan, year: year, month: month, cardHolder: cardHolder, saveCard: saveCard)
    }
}

extension SavedCardSaleRequest: mobileSDK_UI.PayRequest {}
extension NewCardSaleRequest: mobileSDK_UI.PayRequest {}
