//
//  CvvField.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 22.07.2022.
//

import SwiftUI

struct CvvField: View {
    var length: Int = 3
    let allowedCharacters = { (c: Character) in c.isASCII && c.isNumber }

    @Binding var cvvValue: String
    @Binding var isValueValid: Bool

    @State private var isFieldValid: Bool = true {
        didSet {
            errorMessage = isFieldValid ? "" : L.message_invalid_cvv.string
        }
    }

    @State private var errorMessage: String = ""

    var body: some View {
        CustomTextField($cvvValue,
                      placeholder: L.title_cvv.string,
                      keyboardType: .numberPad,
                      secure: true,
                      maxLength: length,
                      isAllowedCharacter: allowedCharacters,
                      required: true,
                      hint: $errorMessage,
                      valid: $isFieldValid,
                      disabled: .constant(false),
                      accessoryView: EmptyView()) {
            isFieldValid = cvvValue.count == length
            isValueValid = isFieldValid
        }
    }
}

#if DEBUG
struct CvvField_Previews: PreviewProvider {
    static var previews: some View {
        CvvField(cvvValue: .constant("123"), isValueValid: .constant(false))
    }
}
#endif
