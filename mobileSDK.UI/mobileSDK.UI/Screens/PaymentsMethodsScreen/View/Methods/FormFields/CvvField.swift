//
//  CvvField.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 22.07.2022.
//

import SwiftUI

struct CvvField: View {
    let withInfoButton: Bool
    var length: Int = 3
    let allowedCharacters = { (c: Character) in c.isASCII && c.isNumber }

    @Binding var cvvValue: String

    @Binding var isValueValid: Bool

    @State private var isFieldValid: Bool = true {
        didSet {
            errorMessage = isFieldValid ? "" : L.message_invalid_cvv.string
        }
    }

    @State private var showAbout: Bool = false

    @State private var errorMessage: String = ""

    var body: some View {
        CustomTextField(
            $cvvValue.didSet({ newValue in
                isFieldValid = newValue.count == length
                isValueValid = isFieldValid
            }),
            placeholder: L.title_cvv.string,
            keyboardType: .numberPad,
            secure: true,
            maxLength: length,
            isAllowedCharacter: allowedCharacters,
            required: true,
            hint: errorMessage,
            valid: isFieldValid,
            disabled: false,
            accessoryView: aboutButton)
        .alert(isPresented: $showAbout) {
            aboutCVVAlert
        }
    }

    @ViewBuilder
    var aboutButton: some View {
        if withInfoButton {
            InfoButton {
                showAbout = true
            }
        } else {
            EmptyView()
        }
    }

    var aboutCVVAlert: Alert {
        Alert(title: Text(L.title_about_cvv.string),
              message: Text(L.message_about_cvv.string),
              dismissButton: Alert.Button.default(Text(L.button_ok.string), action: {
            showAbout = false
        }))
    }
}

#if DEBUG
struct CvvField_Previews: PreviewProvider {
    static var previews: some View {
        CvvField(withInfoButton: true, cvvValue: .constant("123"), isValueValid: .constant(false))
    }
}
#endif
