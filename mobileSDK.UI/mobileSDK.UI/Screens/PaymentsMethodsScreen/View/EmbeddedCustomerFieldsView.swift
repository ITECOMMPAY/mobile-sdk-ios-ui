//
//  EmbeddedCustomerFieldsView.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 18.07.2022.
//

import SwiftUI

struct EmbeddedCustomerFieldsView: View {
    var visibleCustomerFields: [CustomerField]
    var additionalFields: [AdditionalField]
    @State var customerFieldValues: [CustomerFieldValue] = []
    var onCustomerFieldsChanged: ([CustomerFieldValue], Bool) -> Void

    var body: some View {
        VStack(spacing: UIScheme.dimension.formSmallSpacing) {
            ForEach(visibleCustomerFields, id: \.name) { field in
                let foundAdditionalField = additionalFields.first { $0.type == field.fieldType }
                let foundCustomerFieldValue = customerFieldValues.first { $0.name == field.name }
                view(for: field, value: foundCustomerFieldValue?.value ?? foundAdditionalField?.value ?? "") { customerField, newValue, isValid in
                    validateFields(
                        customerField: customerField,
                        value: newValue,
                        isValid: isValid,
                        visibleRequiredFields: visibleRequiredCustomerFields,
                        onCustomerFieldsChanged: onCustomerFieldsChanged
                    )
                }
            }
        }
    }

    private var visibleRequiredCustomerFields: [CustomerField] {
        visibleCustomerFields.filter { $0.isRequired }
    }
    @State private var changedFieldsMap: [String: CustomerFieldValue] = [:]
    @State private var changedNonRequiredFieldsMap: [String: CustomerFieldValue] = [:]

    private func view(for customerField: CustomerField,
              value: String,
              onValueChanged: @escaping OnBaseCustomerTextFieldValueChanged) -> some View {
        return Group {
            switch customerField.fieldServerType {
            case .tel:
                TelCustomerTextField(value: value, customerField: customerField, onValueChanged: onValueChanged)
            case .password:
                PasswordCustomerTextField(value: value, customerField: customerField, onValueChanged: onValueChanged)
            case .number:
                NumberCustomerTextField(value: value, customerField: customerField, onValueChanged: onValueChanged)
            case .email:
                EmailCustomerTextField(value: value, customerField: customerField, onValueChanged: onValueChanged)
            case .date:
                DateCustomerTextField(value: value, customerField: customerField, onValueChanged: onValueChanged)
            case .text, .file, .textarea, .search, .url:
                TextCustomerTextField(value: value, customerField: customerField, onValueChanged: onValueChanged)
            }
        }
    }

    private func validateFields(
        customerField: CustomerField,
        value: String,
        isValid: Bool,
        visibleRequiredFields: [CustomerField],
        onCustomerFieldsChanged: ([CustomerFieldValue], Bool) -> Void
    ) {
        // добавляем в мапу поля, которые были изменены пользователем
        // проверка на валидность и обязательность
        if isValid && customerField.isRequired {
            changedFieldsMap[customerField.name] =
            CustomerFieldValue(name: customerField.name, value: value)
        } else if !customerField.isRequired {
            // добавляем в мапу измененные необязательное поля
            changedNonRequiredFieldsMap[customerField.name] =
            CustomerFieldValue(name: customerField.name, value: value)
        } else if customerField.isRequired {
            changedFieldsMap.removeValue(forKey: customerField.name)
        }
        // список всех обязательных полей (по имени)
        let allRequiredFields = visibleRequiredFields.map { $0.name }.sorted()
        // список всех измененных обязательных полей (по имени)
        let changedRequiredCustomerFieldsList = changedFieldsMap.keys.sorted()
        let allCustomerFields = changedFieldsMap.merging(changedNonRequiredFieldsMap, uniquingKeysWith: { first, _ in first }).values.map {
            CustomerFieldValue(name: $0.name, value: $0.value)
        }
        onCustomerFieldsChanged(
            allCustomerFields,
            allRequiredFields == changedRequiredCustomerFieldsList  // проверка, что список всех обязательных полей соответствует списку измененных и прошедших проверку обязательных полей
        )
    }
}

#if DEBUG

struct EmbeddedCustomerFieldsView_Previews: PreviewProvider {
    static var previews: some View {
        // TODO: repare preview
        /*
        EmbeddedFieldView(visibleCustomerFields: [], customerFieldValues: .constant([]), isValid: .constant(false))
         */
        EmptyView()
    }
}

#endif
