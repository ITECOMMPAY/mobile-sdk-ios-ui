//
//  ExpiryField.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 22.07.2022.
//

import SwiftUI

struct ExpiryField: View {
    let disabled: Bool
    @Injected var expiryFabric: CardExpiryFabric?

    @Binding var expiryString: String

    let formatter = ExpiryFormatter()
    let allowedCharacters = { (c: Character) in c.isASCII && c.isNumber }

    @Binding var isValid: Bool {
        didSet {
            errorMessage = isValid ? "" : L.message_about_expiry.string
        }
    }

    @State var errorMessage: String = ""

    var body: some View {
        FormTextField($expiryString,
                      placeholder: disabled ? L.title_expiration.string : L.title_expiration_placeholder.string,
                      keyboardType: .numberPad,
                      secure: false,
                      isValidCharacter: allowedCharacters,
                      formatter: formatter,
                      required: true,
                      hint: $errorMessage,
                      valid: $isValid,
                      disabled: .constant(disabled),
                      accessoryView: EmptyView()) {
            isValid = expiryFabric?.createCardExpiry(with: expiryString).isValid() ?? false
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
            ExpiryField(disabled: false, expiryString: $value, isValid: $isValid)
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
