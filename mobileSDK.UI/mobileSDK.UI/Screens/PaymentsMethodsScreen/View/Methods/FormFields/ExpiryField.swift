//
//  ExpiryField.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 22.07.2022.
//

import SwiftUI
import Combine

struct ExpiryField: View {
    let disabled: Bool
    @Injected var expiryFabric: CardExpiryFabric?

    @Binding var expiryString: String
    @Binding var isValueValid: Bool

    let transformation = InputMaskTransformation(with: "##/##")
    let allowedCharacters = { (c: Character) in c.isASCII && c.isNumber }

    @State private var isFieldValid: Bool = true

    @State var errorMessage: String = ""

    var body: some View {
        CustomTextField(
            $expiryString.didSet({ newValue in
                validate(newValue)
            }),
            placeholder: L.title_expiry.string,
            keyboardType: .numberPad,
            secure: false,
            isAllowedCharacter: allowedCharacters,
            transformation: transformation,
            hint: errorMessage,
            valid: isFieldValid,
            disabled: disabled,
            accessoryView: EmptyView()
        ) {
            validate(expiryString)
        }
        .onAppear {
            validate(expiryString, ignoreEmpty: true)
        }
    }

    private func validate(_ value: String, ignoreEmpty: Bool = false) {
        if value.isEmpty {
            errorMessage = L.message_required_field.string
            isValueValid = false
            isFieldValid = ignoreEmpty
        } else {
            if expiryFabric?.createCardExpiry(with: value).isValid() ?? false {
                isValueValid = true
                isFieldValid = true
            } else {
                errorMessage = L.message_about_expiry.string
                isValueValid = false
                isFieldValid = false
            }
        }
    }
}

#if DEBUG

struct ExpiryFieldPreview: View {
    @State var value: String = ""
    @State var isValid: Bool = true
    @State var anotherText: String = ""
    var body: some View {
        VStack {
            ExpiryField(
                disabled: false,
                expiryString: $value,
                isValueValid: $isValid
            )
            Text("value=\(value)  isValid=\(isValid.description)")
            TextField("Another textfield", text: $anotherText)
        }
    }
}

struct ExpiryField_Previews: PreviewProvider {
    static var previews: some View {
        ExpiryFieldPreview()
    }
}
#endif
