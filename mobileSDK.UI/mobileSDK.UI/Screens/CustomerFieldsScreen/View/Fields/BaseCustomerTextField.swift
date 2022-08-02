//
//  BaseCustomerTextField.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 28.07.2022.
//

import SwiftUI

struct BaseCustomerTextField: View {
    @Binding var value: String
    @Binding var isValid: Bool
    var customerField: CustomerField
    let keyboardType: UIKeyboardType = .default
    let formatter: Formatter
    let isAllowedCaracter: (Character) -> Bool
    let maxLength: Int? = nil

    @State private var hint: String = ""

    var body: some View {
        CustomTextField($value,
                      placeholder: customerField.placeholder ?? customerField.hint ?? "",
                      keyboardType: keyboardType,
                      forceUppercased: false,
                      secure: false,
                      maxLength: maxLength,
                      isAllowedCharacter: isAllowedCaracter,
                      formatter: formatter,
                      required: customerField.isRequired,
                      hint: $hint,
                      valid: $isValid,
                      disabled: .constant(false),
                      accessoryView: EmptyView()) {
            if let validationError = customerField.getValidationMessage(value: value) {
                hint = validationError
                isValid = false
            }
            hint = ""
            isValid = true
        }
    }
}

#if DEBUG

struct BaseCustomerTextField_Previews: PreviewProvider {
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
        var validatonMethod: Validator<String>? = { _ in true }
        var fieldType: FieldType = .unknown
        var errorMessage: String? = "mockField error"
        var errorMessageKey: String = "mockField error key"
    }

    static var previews: some View {
        BaseCustomerTextField(value: .constant("Value"),
                              isValid: .constant(true),
                              customerField: MockCustomerField(),
                              formatter: EmptyFormatter(),
                              isAllowedCaracter: { _ in true })
    }
}

#endif
