//
//  EmailCustomerTextField.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 05.08.2022.
//

import SwiftUI

struct EmailCustomerTextField: View {
    let value: String
    let customerField: CustomerField
    let onValueChanged: OnBaseCustomerTextFieldValueChanged

    var body: some View {
        BaseCustomerTextField(value: value,
                              customerField: customerField,
                              keyboardType: .emailAddress,
                              onValueChanged: onValueChanged)
    }
}
