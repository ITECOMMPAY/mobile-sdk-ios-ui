//
//  CvvField.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 22.07.2022.
//

import SwiftUI

struct CvvField: View {
    let showValidation: Bool
    var length: Int = 3
    let allowedCharacters = { (c: Character) in c.isASCII && c.isNumber }

    @Binding var cvv: String

    @Binding var isValid: Bool {
        didSet {
            errorMessage = isValid || !showValidation ? "" : L.message_invalid_cvv.string
        }
    }

    @State var errorMessage: String = ""

    var body: some View {
        FormTextField($cvv,
                      placeholder: L.title_cvv.string,
                      keyboardType: .numberPad,
                      secure: true,
                      maxLength: length,
                      isValidCharacter: allowedCharacters,
                      required: true,
                      hint: $errorMessage,
                      valid: $isValid,
                      disabled: .constant(false),
                      accessoryView: EmptyView()) {
            isValid = cvv.count == length
        }
    }
}

#if DEBUG
struct CvvField_Previews: PreviewProvider {
    static var previews: some View {
        CvvField(showValidation: false, cvv: .constant("123"), isValid: .constant(false))
    }
}
#endif
