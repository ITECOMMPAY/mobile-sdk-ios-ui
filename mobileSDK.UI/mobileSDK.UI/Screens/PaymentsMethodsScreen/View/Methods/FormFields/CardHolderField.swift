//
//  CardHolderField.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 21.07.2022.
//

import SwiftUI

struct CardHolderField: View {
    @Binding var cardHolder: String

    @Binding var isValid: Bool {
        didSet {
            errorMessage = isValid ? "" : L.message_card_holder.string
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
                      valid: $isValid,
                      disabled: .constant(false),
                      accessoryView: EmptyView()) {
            isValid = serviceLocator.getService(ofType: ValidationService.self)?.isCardHolderNameValid(value: cardHolder) ?? false
        }
    }
}

#if DEBUG
struct CardHolderField_Previews: PreviewProvider {
    static var previews: some View {
        CardHolderField(cardHolder: .constant(""), isValid: .constant(true))
    }
}
#endif
