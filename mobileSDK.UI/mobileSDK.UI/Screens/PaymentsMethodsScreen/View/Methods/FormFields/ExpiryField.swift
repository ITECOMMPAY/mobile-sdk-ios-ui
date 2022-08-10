//
//  ExpiryField.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 22.07.2022.
//

import SwiftUI

struct ExpiryField: View {
    let disabled: Bool
    @Injected var expiryFabric: CardExpiryFabric?

    @Binding var expiryString: String
    @Binding var isValueValid: Bool

    let formatter = InputMaskFormatter(with: "##/##")
    let allowedCharacters = { (c: Character) in c.isASCII && c.isNumber }

    @State private var isFieldValid: Bool = true {
        didSet {
            errorMessage = isFieldValid ? "" : L.message_about_expiry.string
        }
    }

    @State var errorMessage: String = ""

    var body: some View {
        CustomTextField(
            $expiryString.didSet({ newValue in
                isFieldValid = expiryFabric?.createCardExpiry(with: newValue).isValid() ?? false
                isValueValid = isFieldValid
            }),
            placeholder: disabled ? L.title_expiration.string : L.title_expiration_placeholder.string,
            keyboardType: .numberPad,
            secure: false,
            isAllowedCharacter: allowedCharacters,
            formatter: formatter,
            required: false,
            hint: errorMessage,
            valid: isFieldValid,
            disabled: disabled,
            accessoryView: EmptyView())
    }
}

#if DEBUG

struct ExpiryFieldPreview: View {
    @State var value: String = ""
    @State var isValid: Bool = true
    @State var anotherText: String = ""
    var body: some View {
        VStack {
            ExpiryField(disabled: false, expiryString: $value, isValueValid: $isValid)
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

