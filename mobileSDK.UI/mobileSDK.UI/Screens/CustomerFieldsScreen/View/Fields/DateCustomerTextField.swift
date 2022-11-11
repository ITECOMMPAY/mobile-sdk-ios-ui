//
//  DateCustomerTextField.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 05.08.2022.
//

import SwiftUI

struct DateCustomerTextField: View {
    let value: String
    let customerField: CustomerField
    let onValueChanged: OnBaseCustomerTextFieldValueChanged

    private let keyboardType: UIKeyboardType = .default

    var body: some View {
        BaseCustomerTextField(value: value,
                              customerField: customerField,
                              keyboardType: .numberPad,
                              transformation: InputMaskTransformation(with: "##-##-####", unmaskingEnabled: false),
                              isAllowedCharacter: { $0.isASCII && $0.isNumber },
                              maxLength: 8,
                              onValueChanged: onValueChanged)
    }
}

#if DEBUG

struct DateCustomerTextField_Previews: PreviewProvider {
    struct MockCustomerField: CustomerField {
        var fieldServerType: FieldServerType = .text
        var name: String = "mockField name"
        var isRequired: Bool = true
        var isHidden: Bool = false
        var isTokenize: Bool = false
        var isVerify: Bool = false
        var hint: String? = "mockField hint"
        var label: String = "mockField label"
        var placeholder: String? = "mockField placeholder"
        var validatorName: String? = "mockField validatorName"
        var validationMethod: Validator<String>? = { _ in false }
        var errorMessage: String? = "mockField error"
        var errorMessageKey: String = "mockField error key"
    }

    struct DateCustomerTextFieldPreview: View {
        @State var value = ""
        @State var isValid = false

        var body: some View {
            VStack {
                DateCustomerTextField(value: value, customerField: MockCustomerField()) { _, newValue, isValid in
                    value = newValue
                    self.isValid = isValid
                }
                Text("Unmasked value:\(value) isValid: \(isValid.description)")
                TextField("Another textfield", text: .constant(""))
            }.padding()
        }
    }

    static var previews: some View {
        DateCustomerTextFieldPreview()
    }
}

#endif
