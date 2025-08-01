//
//  OptionsCustomerTextField.swift
//  mobileSDK.UI
//
//  Created by Ilya Matveev on 20.06.2025.
//

import SwiftUI

struct OptionsCustomerTextField: View {
    let customerField: CustomerField
    let initialValue: String?
    let isRequired: Bool
    let onValueChanged: OnBaseCustomerTextFieldValueChanged
    
    private var requiredMarkColor: Color = UIScheme.color.textFieldRequirementMarkColor
    
    @State private var selectedValue = ""
    @State private var showingPicker = false
    
    init(customerField: CustomerField, initialValue: String?, isRequired: Bool, onValueChanged: @escaping OnBaseCustomerTextFieldValueChanged) {
            self.customerField = customerField
            self.initialValue = initialValue
            self.onValueChanged = onValueChanged
            self.isRequired = isRequired
            
            _selectedValue = State(initialValue: initialValue ?? "")
        }
    
    var body: some View {
        Menu {
            Picker(customerField.name, selection: $selectedValue) {
                ForEach(customerField.options?.map(\.name) ?? [], id: \.self) { option in
                    Text(option).tag(option)
                }
            }
        } label: {
            HStack {
                Text(selectedValue.isEmpty ? customerField.name : selectedValue)
                    .foregroundColor(
                        selectedValue.isEmpty
                            ? UIScheme.color.textFieldPlaceholderColor
                            : UIScheme.color.text
                    )
                    .font(UIScheme.font.commonRegular(size: UIScheme.dimension.middleFont))
                if isRequired {
                    Text("*").foregroundColor(requiredMarkColor)
                        .accessibilityHidden(true)
                }
                Spacer()
                Image(systemName: "chevron.down")
                    .foregroundColor(.secondary)
            }
            .padding()
            .background(UIScheme.color.textFieldNormalBackgroundColor)
            .cornerRadius(UIScheme.dimension.buttonCornerRadius)
        }
        .onAppear() {
            let value = customerField.options?.first(where: { $0.name == initialValue })?.value ?? ""

            onValueChanged(customerField, value, self.isRequired ? !value.isEmpty : true)
        }
        .onChange(of: selectedValue) { name in
            guard let value = customerField.options?.first(where: { $0.name == name })?.value else {
                return
            }
            onValueChanged(customerField, value, self.isRequired ? !value.isEmpty : true)
        }
    }
}
