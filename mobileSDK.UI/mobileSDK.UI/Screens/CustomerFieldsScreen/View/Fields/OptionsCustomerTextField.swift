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
    let onValueChanged: OnBaseCustomerTextFieldValueChanged
    
    @State private var selectedValue = ""
    @State private var showingPicker = false
    
    init(
        customerField: CustomerField,
        initialValue: String?,
        onValueChanged: @escaping OnBaseCustomerTextFieldValueChanged
    ) {
        self.customerField = customerField
        self.initialValue = initialValue
        self.onValueChanged = onValueChanged
        
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
                    .foregroundColor(UIScheme.color.inputTextPrimary)
                    .font(.custom(.primary(size: .m, weight: .regular)))
                Spacer()
                Image(systemName: "chevron.down")
                    .foregroundColor(.secondary)
            }
            .padding()
            .background(UIScheme.color.inputNeutral)
            .cornerRadius(UIScheme.dimension.buttonCornerRadius)
        }
        .onAppear() {
            let value = customerField.options?.first(where: { $0.name == initialValue })?.value ?? ""

            onValueChanged(customerField, value, !value.isEmpty)
        }
        .onChange(of: selectedValue) { name in
            guard let value = customerField.options?.first(where: { $0.name == name })?.value else {
                return
            }
            
            onValueChanged(customerField, value, !value.isEmpty)
        }
    }
}
