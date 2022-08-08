//
//  TelCustomerTextField.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 05.08.2022.
//

import SwiftUI

struct TelCustomerTextField: View {
    let value: String
    let customerField: CustomerField
    let onValueChanged: OnBaseCustomerTextFieldValueChanged

    var body: some View {
        BaseCustomerTextField(value: value,
                              customerField: customerField,
                              keyboardType: .numberPad,
                              isAllowedCharacter: { $0.isASCII && $0.isNumber },
                              onValueChanged: onValueChanged)
    }
}
