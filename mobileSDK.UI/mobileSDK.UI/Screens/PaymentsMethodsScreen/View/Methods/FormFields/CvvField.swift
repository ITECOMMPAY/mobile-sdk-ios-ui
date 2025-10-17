//
//  CvvField.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 22.07.2022.
//

import SwiftUI

struct CvvField: View {
    var cardType: CardType = .unknown

    var length: Int {
        return cardType == .amex ? 4 : 3
    }

    let allowedCharacters = { (c: Character) in c.isASCII && c.isNumber }
    
    @Binding var errorMessage: String?
    @Binding var cvvValue: String
    @Binding var isValueValid: Bool

    @State private var isFieldValid: Bool = true

    var body: some View {
        CustomTextField(
            $cvvValue.didSet({ newValue in
                validate(newValue)
            }),
            placeholder: L.title_cvv.string,
            keyboardType: .numberPad,
            secure: true,
            maxLength: length,
            isAllowedCharacter: allowedCharacters,
            valid: isFieldValid,
            disabled: false,
            cornerRadii: .init(
                topLeading: 2,
                bottomLeading: 2,
                bottomTrailing: UIScheme.dimension.buttonCornerRadius,
                topTrailing: 2
            ),
            accessoryView: EmptyView(),
        ) {
            validate(cvvValue)
        }
        .onAppear {
            validate(cvvValue, ignoreEmpty: true)
        }
    }

    private func validate(_ value: String, ignoreEmpty: Bool = false) {
        if value.isEmpty {
            errorMessage = ignoreEmpty ? nil : L.message_required_field.string
            isValueValid = false
            isFieldValid = ignoreEmpty
        } else {
            if value.count == length {
                errorMessage = nil
                isValueValid = true
                isFieldValid = true
            } else {
                errorMessage = L.message_invalid_cvv.string
                isValueValid = false
                isFieldValid = false
            }
        }
    }
}

#if DEBUG

struct CvvField_Previews: PreviewProvider {
    static var previews: some View {
        CvvField(
            errorMessage: .constant(nil),
            cvvValue: .constant("123"),
            isValueValid: .constant(false)
        )
    }
}

#endif
