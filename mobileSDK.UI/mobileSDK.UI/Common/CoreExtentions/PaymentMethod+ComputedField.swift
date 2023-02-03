//
//  PaymentMethod+ComputedField.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 04.08.2022.
//

import Foundation

extension PaymentMethod {
    var visibleCustomerFields: [CustomerField] {
        methodCustomerFields.filter { !$0.isHidden }
    }
}
