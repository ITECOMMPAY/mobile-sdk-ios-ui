//
//  OptionsCustomerTextField.swift
//  mobileSDK.UI
//
//  Created by Ilya Matveev on 20.06.2025.
//

import SwiftUI

struct OptionsCustomerTextField: View {
    let customerField: CustomerField
    let onValueChanged: OnBaseCustomerTextFieldValueChanged
    
    @State private var selectedValue = ""
    @State private var showingPicker = false
    
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
                Spacer()
                Image(systemName: "chevron.down")
                    .foregroundColor(.secondary)
            }
            .padding()
            .background(UIScheme.color.textFieldNormalBackgroundColor)
            .cornerRadius(UIScheme.dimension.buttonCornerRadius)
        }
        .onChange(of: selectedValue) { name in
            guard let value = customerField.options?.first(where: { $0.name == name })?.value else {
                return
            }
            onValueChanged(customerField, value, true)
        }
    }
}
