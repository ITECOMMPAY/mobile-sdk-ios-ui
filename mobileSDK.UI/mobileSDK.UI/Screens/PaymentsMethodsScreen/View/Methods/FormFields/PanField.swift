//
//  PanField.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 22.07.2022.
//

import SwiftUI

struct PanField: View {
    @Injected private var validationService: ValidationService?

    let cardTypeRecognizer: CardTypeRecognizer?

    let allowedCharacters = { (c: Character) in c.isASCII && c.isNumber }

    @Binding var cardNumber: String

    @Binding var isValueValid: Bool

    @State private var isFieldValid: Bool = true {
        didSet {
            errorMessage = isFieldValid ? "" : L.message_about_card_number.string
        }
    }

    @State private var errorMessage: String = ""

    var formatter: Formatter {
        if let cardTypeRecognizer = cardTypeRecognizer {
            return CardNumberFormatter(cardTypeRecognizer: cardTypeRecognizer)
        }
        return EmptyFormatter()
    }

    var body: some View {
        CustomTextField($cardNumber,
                      placeholder: L.title_card_number.string,
                      keyboardType: .numberPad,
                      forceUppercased: true,
                      secure: false,
                      maxLength: 19,
                      isAllowedCharacter: allowedCharacters,
                      formatter: formatter,
                      required: true,
                      hint: $errorMessage,
                      valid: $isFieldValid,
                      disabled: .constant(false),
                      accessoryView: EmptyView()) {
            isFieldValid = validationService?.isPanValidatorValid(value: cardNumber) ?? false
            isValueValid = isFieldValid
        }
    }
}

#if DEBUG

struct PanFieldPreview: View {
    @State var cardNumber: String = ""
    @State var isValid: Bool = true
    @State var anotherText: String = ""
    var body: some View {
        PanField(cardTypeRecognizer: nil, cardNumber: $cardNumber, isValueValid: $isValid)
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
