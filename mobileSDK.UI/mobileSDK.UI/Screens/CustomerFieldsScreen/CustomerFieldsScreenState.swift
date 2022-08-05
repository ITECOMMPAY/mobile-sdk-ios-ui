//
//  CustomerFieldsScreenState.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 28.07.2022.
//

import Foundation

protocol CustomerFieldsScreenState {
    var paymentOptions: PaymentOptions { get }
    var visibleCustomerFields: [CustomerField] { get }
    var isVatIncluded: Bool { get }
}
