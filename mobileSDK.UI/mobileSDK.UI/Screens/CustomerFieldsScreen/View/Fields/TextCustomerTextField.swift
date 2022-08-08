//
//  TextCustomerTextField.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 05.08.2022.
//

import SwiftUI

struct TextCustomerTextField: View {
    let value: String
    let customerField: CustomerField
    let onValueChanged: OnBaseCustomerTextFieldValueChanged

    var body: some View {
        BaseCustomerTextField(value: value,
                              customerField: customerField,
                              onValueChanged: onValueChanged)
    }
}
