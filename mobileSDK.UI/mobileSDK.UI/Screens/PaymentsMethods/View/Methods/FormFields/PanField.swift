//
//  PanField.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 22.07.2022.
//

import SwiftUI

struct PanField: View {
    @Injected private var validationService: ValidationService?

    let cardTypesManager: CardTypesManager?

    let allowedCharacters = { (c: Character) in c.isASCII && c.isNumber }

    @Binding var cardNumber: String

    @Binding var isValid: Bool {
        didSet {
            errorMessage = isValid ? "" : L.message_about_card_number.string
        }
    }

    @State var errorMessage: String = ""

    var body: some View {
        FormTextField($cardNumber,
                      placeholder: L.title_holder_name.string,
                      forceUppercased: true,
                      secure: false,
                      maxLength: 19,
                      isValidCharacter: allowedCharacters,
                      formatter: CardNumberFormatter(),
                      required: true,
                      hint: $errorMessage,
                      valid: $isValid,
                      disabled: .constant(false),
                      accessoryView: EmptyView()) {
            isValid = validationService?.isPanValidatorValid(value: cardNumber) ?? false
        }
    }
}

#if DEBUG

struct PanFieldPreview: View {
    @State var cardNumber: String = ""
    @State var isValid: Bool = true
    @State var anotherText: String = ""
    var body: some View {
        PanField(cardTypesManager: nil, cardNumber: $cardNumber, isValid: $isValid)
        Text("cardNumber=\(cardNumber)  isValid=\(isValid.description)")
        TextField("Another textfield", text: $anotherText)
    }
}

struct PanField_Previews: PreviewProvider {
    static var previews: some View {
        PanFieldPreview()
    }
}
#endif
