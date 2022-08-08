//
//  CardHolderField.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 21.07.2022.
//

import SwiftUI

struct CardHolderField: View {
    @Binding var cardHolder: String
    @Binding var isValueValid: Bool

    @State private var isFieldValid: Bool = true {
        didSet {
            errorMessage = isFieldValid ? "" : L.message_card_holder.string
        }
    }

    @State var errorMessage: String = ""

    var body: some View {
        CustomTextField($cardHolder,
                      placeholder: L.title_holder_name.string,
                      forceUppercased: true,
                      secure: false,
                      required: true,
                      hint: $errorMessage,
                      valid: $isFieldValid,
                      disabled: .constant(false),
                      accessoryView: EmptyView()) {
            isFieldValid = serviceLocator.getService(ofType: ValidationService.self)?.isCardHolderNameValid(value: cardHolder) ?? false
            isValueValid = isFieldValid
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
