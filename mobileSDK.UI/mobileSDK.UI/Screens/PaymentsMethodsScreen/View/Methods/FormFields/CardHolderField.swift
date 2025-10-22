//
//  CardHolderField.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 21.07.2022.
//

import SwiftUI

struct CardHolderField: View {
    @Binding var cardHolder: String
    @Binding var isValueValid: Bool

    @State private var isFieldValid: Bool = true

    @State var errorMessage: String = ""

    var body: some View {
        CustomTextField(
            $cardHolder.didSet({ newValue in
                validate(newValue)
            }),
            placeholder: L.title_holder_name.string,
            forceUppercased: true,
            secure: false,
            isAllowedCharacter: { it in
                it.isLetter || " .-'".contains(it)
            },
            hint: errorMessage,
            valid: isFieldValid,
            disabled: false,
            accessoryView: EmptyView()) {
                validate(cardHolder)
            }
            .onAppear {
                validate(cardHolder, ignoreEmpty: true)
            }
    }

    private func validate(_ value: String, ignoreEmpty: Bool = false) {
        if value.isEmpty {
            errorMessage = L.message_required_field.string
            isValueValid = false
            isFieldValid = ignoreEmpty
        } else {
            if serviceLocator.getService(ofType: ValidationService.self)?.isCardHolderNameValid(value: value) ?? false {
                isValueValid = true
                isFieldValid = true
            } else {
                errorMessage = L.message_card_holder.string
                isValueValid = false
                isFieldValid = false
            }
        }
    }
}

#if DEBUG

struct CardHolderField_Previews: PreviewProvider {
    static var previews: some View {
        CardHolderField(cardHolder: .constant(""), isValueValid: .constant(true))
    }
}

#endif
