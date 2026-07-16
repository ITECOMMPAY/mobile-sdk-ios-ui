//
//  MaskedDateTextField.swift
//  mobileSDK.SampleApp
//

import SwiftUI
import UIKit

struct MaskedDateTextField: UIViewRepresentable {
    private static let mask = "##-##-####"
    private static let maxDigitsCount = 8

    private let titleKey: String
    @Binding private var text: String

    init(_ titleKey: String, text: Binding<String>) {
        self.titleKey = titleKey
        _text = text
    }

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.placeholder = titleKey
        textField.keyboardType = .numberPad
        textField.textAlignment = .right
        textField.delegate = context.coordinator
        textField.addTarget(
            context.coordinator,
            action: #selector(Coordinator.editingChanged(_:)),
            for: .editingChanged
        )
        return textField
    }

    func updateUIView(_ uiView: UITextField, context: Context) {
        if uiView.text != text {
            uiView.text = text
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(text: $text)
    }

    static func maskDate(_ value: String) -> String? {
        let digits = String(value.filter { $0.isASCII && $0.isNumber }.prefix(maxDigitsCount))

        guard !digits.isEmpty else {
            return nil
        }

        var result = ""
        var index = digits.startIndex

        for character in mask where index < digits.endIndex {
            if character == "#" {
                result.append(digits[index])
                index = digits.index(after: index)
            } else {
                result.append(character)
            }
        }

        return result
    }
}

extension MaskedDateTextField {
    final class Coordinator: NSObject, UITextFieldDelegate {
        @Binding private var text: String

        init(text: Binding<String>) {
            _text = text
        }

        @objc func editingChanged(_ textField: UITextField) {
            let maskedText = MaskedDateTextField.maskDate(textField.text ?? "") ?? ""
            textField.text = maskedText
            text = maskedText
        }

        func textField(
            _ textField: UITextField,
            shouldChangeCharactersIn range: NSRange,
            replacementString string: String
        ) -> Bool {
            guard string.allSatisfy({ $0.isASCII && $0.isNumber }) || string.isEmpty else {
                return false
            }

            let currentText = textField.text ?? ""
            guard let textRange = Range(range, in: currentText) else {
                return false
            }

            let newText = currentText.replacingCharacters(in: textRange, with: string)
            return newText.filter { $0.isASCII && $0.isNumber }.count <= MaskedDateTextField.maxDigitsCount
        }
    }
}
