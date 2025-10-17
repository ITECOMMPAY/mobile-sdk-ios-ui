//
//  BaseCustomerTextField.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 28.07.2022.
//

import SwiftUI

typealias OnBaseCustomerTextFieldValueChanged = (
    _ customerField: CustomerField,
    _ newValue: String,
    _ isValid: Bool
) -> Void

let ValidationTriggerNotification = "ValidationTriggerNotification"

struct BaseCustomerTextField: View {
    let validationPublisher = NotificationCenter.default
        .publisher(for: NSNotification.Name(ValidationTriggerNotification))
    @State var value: String

    let customerField: CustomerField
    var keyboardType: UIKeyboardType = .default
    var transformation: CustomFormatterTransformation = EmptyTransformation()
    var isAllowedCharacter: (Character) -> Bool = { _ in true }
    var maxLength: Int?
    var isSecure: Bool = false
    let onValueChanged: OnBaseCustomerTextFieldValueChanged

    @State private var hint: String = ""

    @State private var isFieldValid: Bool = true
    @State private var isValid: Bool = false

    var body: some View {
        CustomTextField(
            $value.didSet({ newValue in
                validate(newValue)
            }),
            placeholder: customerField.placeholder ?? (customerField.hint ?? ""),
            keyboardType: keyboardType,
            forceUppercased: false,
            secure: isSecure,
            maxLength: maxLength,
            isAllowedCharacter: isAllowedCharacter,
            transformation: transformation,
            hint: hint,
            valid: isFieldValid,
            disabled: false,
            accessoryView: EmptyView()
        ) {
            validate(value)
        }
        .onAppear {
            validate(value, ignoreEmpty: true)
        }
        .onReceive(validationPublisher) { _ in
            validate(value)
        }
    }

    private func validate(_ value: String, ignoreEmpty: Bool = false) {
        let value = value.trimmingCharacters(in: .whitespacesAndNewlines)

        if value.isEmpty {
            hint = L.message_required_field.string
            isValid = false
            isFieldValid = ignoreEmpty
        } else {
            if let validationError = customerField.getValidationMessage(value: value) {
                hint = validationError
                isValid = false
                isFieldValid = false
            } else {
                isValid = true
                isFieldValid = true
            }
        }
        onValueChanged(customerField, value, isValid)
    }
}

#if DEBUG

struct BaseCustomerTextField_Previews: PreviewProvider {
    struct MockCustomerField: CustomerField {
        var fieldServerType: FieldServerType = .text
        var name: String = "mockField name"
        var isHidden: Bool = false
        var isTokenize: Bool = false
        var hint: String? = "mockField hint"
        var label: String = "mockField label"
        var placeholder: String? = "mockField placeholder"
        var validatorName: String? = "mockField validatorName"
        var validationMethod: Validator<String>? = { _ in false }
        var errorMessage: String? = "mockField error"
        var errorMessageKey: String = "mockField error key"
        var options: [any AdditionalField]? = nil
    }

    static var previews: some View {
        VStack {
            BaseCustomerTextField(value: "", customerField: MockCustomerField(), transformation: EmptyTransformation(), isAllowedCharacter: { _ in true }) { _, newValue, isValid in
                print("\(newValue) is \(isValid)")
            }
        }
    }
}

#endif
