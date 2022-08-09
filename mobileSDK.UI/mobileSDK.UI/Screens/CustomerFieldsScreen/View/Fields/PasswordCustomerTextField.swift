//
//  PasswordCustomerTextField.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 05.08.2022.
//

import SwiftUI

struct PasswordCustomerTextField: View {
    let value: String
    let customerField: CustomerField
    let onValueChanged: OnBaseCustomerTextFieldValueChanged

    var body: some View {
        BaseCustomerTextField(value: value,
                              customerField: customerField,
                              isSecure: true,
                              onValueChanged: onValueChanged)
    }
}
