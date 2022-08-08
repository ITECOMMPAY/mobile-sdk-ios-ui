//
//  CustomTextField.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 11.07.2022.
//

import SwiftUI
import Combine
import UIKitTextField

struct CustomTextField<AccessoryViewType: View>: View {
    // MARK: - Properties
    let accessoryView: AccessoryViewType
    let isSecure: Bool
    let isRequired: Bool
    let onCommit: () -> Void
    let keyboardType: UIKeyboardType
    let forceUppercased: Bool
    let formatter: Formatter
    let maxLength: Int?
    let isAllowedCharacter: (Character) -> Bool

    // MARK: View protocol properties

    public var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: UIScheme.dimension.smallSpacing) {
                ZStack {
                    textField
                        .padding(textFieldPaddings)
                    HStack(spacing: .zero) {
                        Text(placeholder)
                            .foregroundColor(!disabled ? placeholderColor : UIScheme.color.textFieldDisabledColor)
                            .animatableFont(size: placeholderFontSize, makeFont: UIScheme.font.commonRegular)
                            .layoutPriority(1)
                        if isRequired {
                            Text("*").foregroundColor(UIScheme.color.textFieldRequirementMarkColor)
                        }
                        Spacer()
                    }
                    .padding(placeholderPaddings)
                }
                accessoryView.padding(.trailing, UIScheme.dimension.middleSpacing)
            }
            .background(backgroundColor.overlay(
                RoundedRectangle(cornerRadius: UIScheme.dimension.buttonCornerRadius, style: .continuous)
                    .stroke(borderColor, lineWidth: UIScheme.dimension.borderWidth)
            ))

            .onReceive(Just(editing)) { _ in
                withAnimation(.easeOut(duration: 0.1)) {
                    updateBorder()
                    updateBackgroundColor()
                    updatePlaceholder()
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: UIScheme.dimension.textFieldHeight)

            if !valid {
                Text(hint)
                    .font(UIScheme.font.commonRegular(size: UIScheme.dimension.smallFont))
                    .foregroundColor(valid ? .clear : UIScheme.color.textFieldErrorBorderColor)
            }
        }

    }

    @ViewBuilder
    var textField: some View {
        UIKitTextField(config: .init()
            .isSecureTextEntry(isSecure)
            .keyboardType(keyboardType)
            .autocapitalizationType(forceUppercased ? .allCharacters : .none)
            .value(
                updateViewValue: { textField in
                    if let text = formatter.string(for: $text.wrappedValue),
                       text != textField.text {
                        textField.text = text
                    }
                },
                onViewValueChanged: { textField in
                    var objectValue: AnyObject?
                    if formatter.getObjectValue(&objectValue, for: textField.text ?? "", errorDescription: nil),
                       let newValue = objectValue as? String {
                        $text.wrappedValue = newValue
                    } else {
                        $text.wrappedValue = ""
                    }
                })
                .shouldChangeCharacters(handler: shouldChangeCharacters)
                    .onBeganEditing(handler: { _ in
                        editing = true
                    })
                    .onEndedEditing(handler: { _, _ in
                        editing = false
                        onCommit()
                    })
                        .textColor(textFieldTextColor)
        )
        .font(UIScheme.font.commonRegular(size: UIScheme.dimension.middleFont))
        .foregroundColor(textFieldTextColor)
        .disabled(disabled)
    }

    private func shouldChangeCharacters(uiTextField: BaseUITextField, range: NSRange, replacementString: String) -> Bool {
        guard replacementString.filter(isAllowedCharacter) == replacementString
        else {
            return false
        }
        guard let maxLength = maxLength else {
            return true
        }
        guard let textFieldText = uiTextField.text,
              let rangeOfTextToReplace = Range(range, in: textFieldText) else {
            return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + replacementString.count
        return count <= maxLength
    }

    // MARK: Private properties

    private var textFieldTextColor: Color {
        disabled ? UIScheme.color.textFieldDisabledColor : UIScheme.color.text
    }

    private let placeholder: String
    @State
    private var borderColor = UIScheme.color.textFieldUnfocusedBorderColor
    @State
    private var backgroundColor = UIScheme.color.textFieldNormalBackgroundColor
    @State
    private var editing: Bool = false
    @Binding
    private var hint: String
    @State
    private var placeholderFontSize = UIScheme.dimension.middleFont
    @State
    private var placeholderPaddings: EdgeInsets = EdgeInsets(top: 17,
                                                             leading: UIScheme.dimension.middleSpacing,
                                                             bottom: 17,
                                                             trailing: 0)

    private let placeholderColor = UIScheme.color.textFieldPlaceholderColor
    private let textFieldPaddings: EdgeInsets = EdgeInsets(top: 25,
                                                           leading: UIScheme.dimension.middleSpacing,
                                                           bottom: 9,
                                                           trailing: 0)

    @Binding
    private var text: String
    @Binding
    private var valid: Bool
    @Binding
    private var disabled: Bool

    // MARK: - Initialization

    /// Creates a Material Design inspired text field with an animated border and placeholder.
    /// - Parameters:
    ///   - text: The text field contents.
    ///   - placeholder: The placeholder string.
    ///   - hint: The field hint string.
    ///   - editing: Whether the field is in the editing state.
    ///   - valid: Whether the field is in the valid state.
    public init(_ text: Binding<String>,
                placeholder: String,
                keyboardType: UIKeyboardType = .default,
                forceUppercased: Bool = false,
                secure: Bool = false,
                maxLength: Int? = nil,
                isAllowedCharacter: @escaping (Character) -> Bool = {_ in true },
                formatter: Formatter = EmptyFormatter(),
                required: Bool = false,
                hint: Binding<String>,
                valid: Binding<Bool>,
                disabled: Binding<Bool> = .constant(false),
                accessoryView: AccessoryViewType,
                onCommit: @escaping () -> Void = {}) {
        self._text = text
        self.onCommit = onCommit
        self.placeholder = placeholder
        self._hint = hint
        self._valid = valid
        self._disabled = disabled
        self.accessoryView = accessoryView
        self.isRequired = required
        self.isSecure = secure
        self.keyboardType = keyboardType
        self.forceUppercased = forceUppercased
        self.formatter = formatter
        self.maxLength = maxLength
        self.isAllowedCharacter = isAllowedCharacter
    }

    // MARK: - Methods

    // MARK: Private methods

    private func updateBorder() {
        updateBorderColor()
    }

    private func updateBorderColor() {
        guard !disabled else {
            borderColor = UIScheme.color.textFieldDisabledColor
            return
        }

        if !valid {
            borderColor = UIScheme.color.textFieldErrorBorderColor
        } else if editing {
            borderColor = UIScheme.color.textFieldFocusedBorderColor
        } else {
            borderColor = UIScheme.color.textFieldUnfocusedBorderColor
        }
    }

    private func updateBackgroundColor() {
        guard !disabled else {
            backgroundColor = .clear
            return
        }

        if !valid {
            backgroundColor = UIScheme.color.textFieldErrorBackgroundColor
        } else {
            backgroundColor = UIScheme.color.textFieldNormalBackgroundColor
        }
    }

    private func updatePlaceholder() {
        updatePlaceholderFontSize()
        updatePlaceholderPosition()
    }

    private func updatePlaceholderFontSize() {
        if editing
            || !text.isEmpty {
            placeholderFontSize = UIScheme.dimension.tinyFont
        } else {
            placeholderFontSize = UIScheme.dimension.middleFont
        }
    }

    private func updatePlaceholderPosition() {
        if editing
            || !text.isEmpty {
            placeholderPaddings = EdgeInsets(top: 9.0,
                                             leading: UIScheme.dimension.middleSpacing,
                                             bottom: 29.0,
                                             trailing: 0)
        } else {
            placeholderPaddings = EdgeInsets(top: 17.0,
                                             leading: UIScheme.dimension.middleSpacing,
                                             bottom: 17.0,
                                             trailing: 0)
        }
    }
}

#if DEBUG

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CustomTextField(.constant(""),
                          placeholder: "placeholder text",
                          hint: .constant("hint text"),
                          valid: .constant(true),
                          accessoryView: EmptyView()).previewDisplayName("Empty")
            CustomTextField(.constant(""),
                          placeholder: "placeholder text",
                          required: true,
                          hint: .constant("hint text"),
                          valid: .constant(true),
                          accessoryView: EmptyView()).previewDisplayName("Requered")
            CustomTextField(.constant("some text"),
                          placeholder: "placeholder text",
                          hint: .constant("hint text"),
                          valid: .constant(false),
                          accessoryView: Color.red.frame(width: 20,
                                                         height: 20)).previewDisplayName("Error hint")
            CustomTextField(.constant("some text"),
                          placeholder: "placeholder text",
                          hint: .constant("hint text"),
                          valid: .constant(true),
                          disabled: .constant(true),
                          accessoryView: EmptyView()).previewDisplayName("Disabled")
            CustomTextField(.constant("cvc"),
                          placeholder: "CVC",
                          secure: true,
                          required: true,
                          hint: .constant("hint text"),
                          valid: .constant(true),
                          disabled: .constant(false),
                          accessoryView: EmptyView()).previewDisplayName("Sequre")

        }
        .padding()
        .previewLayout(.sizeThatFits)
    }

}

#endif
