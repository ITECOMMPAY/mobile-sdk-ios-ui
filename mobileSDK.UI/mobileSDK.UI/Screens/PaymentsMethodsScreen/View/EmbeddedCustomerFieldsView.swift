//
//  EmbeddedCustomerFieldsView.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 18.07.2022.
//

import SwiftUI

struct EmbeddedCustomerFieldsView: View {
    private typealias ValidatedFieldValue = (fieldValue: FieldValue, isValid: Bool)

    var visibleCustomerFields: [CustomerField]
    var additionalFields: [AdditionalField]
    @State var customerFieldValues: [FieldValue]
    var onCustomerFieldsChanged: ([FieldValue], Bool) -> Void

    var body: some View {
        VStack(spacing: UIScheme.dimension.formSmallSpacing) {
            ForEach(visibleCustomerFields, id: \.name) { field in
                let foundAdditionalField = additionalFields.first { $0.name == field.name }
                let foundFieldValue = customerFieldValues.first { $0.name == field.name }
                
                if field.options != nil {
                    let selectedOption = field.options?.first { $0.value == foundAdditionalField?.value }
                    
                    OptionsCustomerTextField(
                        customerField: field,
                        initialValue: selectedOption?.name
                    ) { customerField, newValue, isValid in
                        validateFields(
                            customerField: customerField,
                            value: newValue,
                            isValid: isValid,
                            onCustomerFieldsChanged: onCustomerFieldsChanged
                        )
                    }
                } else {
                    view(
                        for: field,
                        value: foundFieldValue?.value ?? foundAdditionalField?.value ?? ""
                    ) { customerField, newValue, isValid in
                        validateFields(
                            customerField: customerField,
                            value: newValue,
                            isValid: isValid,
                            onCustomerFieldsChanged: onCustomerFieldsChanged
                        )
                    }
                }
            }
        }
    }

    @State private var changedFieldsMap: [String: ValidatedFieldValue] = [:]

    private func view(
        for customerField: CustomerField,
        value: String,
        onValueChanged: @escaping OnBaseCustomerTextFieldValueChanged
    ) -> some View {
        return Group {
            switch customerField.fieldServerType {
            case .tel:
                TelCustomerTextField(
                    value: value,
                    customerField: customerField,
                    onValueChanged: onValueChanged
                )
            case .password:
                PasswordCustomerTextField(
                    value: value,
                    customerField: customerField,
                    onValueChanged: onValueChanged
                )
            case .number:
                NumberCustomerTextField(
                    value: value,
                    customerField: customerField,
                    onValueChanged: onValueChanged
                )
            case .email:
                EmailCustomerTextField(
                    value: value,
                    customerField: customerField,
                    onValueChanged: onValueChanged
                )
            case .date:
                DateCustomerTextField(
                    value: value,
                    customerField: customerField,
                    onValueChanged: onValueChanged
                )
            case .text, .file, .textarea, .search, .url:
                TextCustomerTextField(
                    value: value,
                    customerField: customerField,
                    onValueChanged: onValueChanged
                )
            }
        }
    }

    private func validateFields(
        customerField: CustomerField,
        value: String,
        isValid: Bool,
        onCustomerFieldsChanged: ([FieldValue], Bool) -> Void
    ) {
        changedFieldsMap[customerField.name] = (FieldValue(name: customerField.name, value: value), isValid)

        onCustomerFieldsChanged(
            changedFieldsMap.values.map { $0.fieldValue },
            changedFieldsMap.values.allSatisfy {
                $0.isValid
            }
        )
    }
}

#if DEBUG

struct EmbeddedCustomerFieldsView_Previews: PreviewProvider {
    static var previews: some View {
        EmbeddedCustomerFieldsView(
            visibleCustomerFields: [MockCustomerField()],
            additionalFields: [],
            customerFieldValues: [],
            onCustomerFieldsChanged: { _, _ in }
        )
        .previewLayout(.sizeThatFits)
    }
}

#endif
