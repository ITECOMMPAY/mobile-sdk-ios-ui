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
    func threeDSecureHandled()
}

public protocol PayRequest {}

public protocol PayRequestFactory {
    func createSavedCardSaleRequest(cvv: String, accountId: Int64) -> PayRequest

    func createNewCardSaleRequest(cvv: String,
                                  pan: String,
                                  year: Int32,
                                  month: Int32,
                                  cardHolder: String,
                                  saveCard: Bool) -> PayRequest
}
