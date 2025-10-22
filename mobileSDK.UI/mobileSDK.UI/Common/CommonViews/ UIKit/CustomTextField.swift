//
//  CustomTextField.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 11.07.2022.
//

import SwiftUI
import Combine

struct CustomTextField<AccessoryViewType: View>: View {
    // MARK: - Properties
    let accessoryView: AccessoryViewType
    let isOptional: Bool
    let isSecure: Bool
    let onCommit: () -> Void
    let keyboardType: UIKeyboardType
    let forceUppercased: Bool
    let formatter: CustomFormatter
    let maxLength: Int?
    let adjustsFontSizeToFitWidth: Bool
    let minimumFontSize: CGFloat
    let isAllowedCharacter: (Character) -> Bool
    let cornerRadii: RectangleCornerRadii

    // MARK: View protocol properties

    public var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: UIScheme.dimension.smallSpacing) {
                ZStack {
                    textField
                        .padding(textFieldPaddings)
                        .accessibilityHint(disabled ? "Disabled" : "Double tap to edit")
                    HStack(spacing: .zero) {
                        Text(placeholder)
                            .font(
                                .custom(
                                    .primary(
                                        size: editing || disabled || !text.isEmpty ? .xs : .s,
                                        weight: .regular
                                    )
                                )
                            )
                            .foregroundStyle(
                                editing
                                    ? UIScheme.color.brandPrimary
                                    : disabled || !text.isEmpty
                                        ? UIScheme.color.inputTextAdditional
                                        : UIScheme.color.inputTextPrimary
                            )
                            .layoutPriority(1)
                        
                        if isOptional && !editing && text.isEmpty && !disabled {
                            Text(" (optional)")
                                .font(
                                    .custom(
                                        .primary(
                                            size: editing || disabled || !text.isEmpty ? .xs : .s,
                                            weight: .regular
                                        )
                                    )
                                )
                                .foregroundStyle(UIScheme.color.inputTextAdditional)
                                .layoutPriority(1)
                        }
                        
                        Spacer()
                    }
                    .padding(placeholderPaddings)
                }
                .onTapGesture {
                    isFocused = true
                }
                accessoryView.padding(.trailing, UIScheme.dimension.middleSpacing)
            }
            .background(backgroundColor)
            .clipShape(.rect(cornerRadii: cornerRadii))
            .onReceive(Just(editing)) { _ in
                withAnimation(.easeOut(duration: 0.1)) {
                    updateBorder()
                    updateBackgroundColor()
                    updatePlaceholder()
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: UIScheme.dimension.textFieldHeight)
            .overlay(
                UnevenRoundedRectangle(cornerRadii: cornerRadii)
                    .inset(by: borderWidth / 2)
                    .stroke(borderColor, lineWidth: borderWidth)
            )

            if !showValid && !hint.isEmpty {
                Text(hint)
                    .font(.custom(.primary(size: .xs, weight: .regular)))
                    .foregroundColor(errorHintColor)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .accessibilityElement(children: .combine)
    }

    @ViewBuilder
    var textField: some View {
        UIKitTextField(
            config: UIKitTextField.Configuration()
                .focused($isFocused)
                .isSecureTextEntry(isSecure)
                .keyboardType(keyboardType)
                .autocapitalizationType(forceUppercased ? .allCharacters : nil)
                .adjustsFontSizeToFitWidth(adjustsFontSizeToFitWidth)
                .minimumFontSize(minimumFontSize)
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
                    }
                )
                .shouldChangeCharacters(handler: shouldChangeCharacters)
                .onBeganEditing(
                    handler: { _ in
                        editing = true
                    }
                )
                .onEndedEditing(
                    handler: { _, _ in
                        editing = false
                        onCommit()
                    }
                )
                .textColor(textFieldTextColor)
        )
        .font(.custom(.primary(size: .s, weight: .regular)))
        .disabled(disabled)
    }

    private func shouldChangeCharacters(
        uiTextField: BaseUITextField,
        range: NSRange, replacementString: String
    ) -> Bool {
        if replacementString.isEmpty {
            return true
        }

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
        let previewString = textFieldText.replacingCharacters(
            in: rangeOfTextToReplace,
            with: replacementString
        )
        return formatter.transformation.rawString(from: previewString).count <= maxLength
    }

    // MARK: Private properties

    private let placeholder: String
    @State
    private var isFocused: Bool = false
    @State
    private var borderColor: Color = .clear
    @State
    private var borderWidth: CGFloat = UIScheme.dimension.inputBorderWidth
    @State
    private var backgroundColor: Color = UIScheme.color.inputNeutral
    @State
    private var editing: Bool = false

    @State
    private var placeholderPaddings: EdgeInsets = EdgeInsets(
        top: 17,
        leading: UIScheme.dimension.middleSpacing,
        bottom: 17,
        trailing: 0
    )

    private var textFieldTextColor: Color {
        disabled ? UIScheme.color.inputTextAdditional : UIScheme.color.inputTextPrimary
    }
    
    private var errorHintColor: Color {
        valid ? .clear : UIScheme.color.inputErrorBorder
    }

    private let textFieldPaddings: EdgeInsets = EdgeInsets(
        top: 25,
        leading: UIScheme.dimension.middleSpacing,
        bottom: 9,
        trailing: UIScheme.dimension.middleSpacing
    )

    @Binding
    private var text: String

    private var valid: Bool
    private var disabled: Bool
    private var hint: String

    private var showValid: Bool {
        editing ? true : valid
    }

    // MARK: - Initialization

    /// Creates a Material Design inspired text field with an animated border and placeholder.
    /// - Parameters:
    ///   - text: The text field contents.
    ///   - placeholder: The placeholder string.
    ///   - hint: The field hint string.
    ///   - editing: Whether the field is in the editing state.
    ///   - valid: Whether the field is in the valid state.
    ///   - cornerRadii: Corner radii configuration for the text field shape.
    public init(
        _ text: Binding<String>,
        placeholder: String,
        keyboardType: UIKeyboardType = .default,
        forceUppercased: Bool = false,
        isOptional: Bool = false,
        secure: Bool = false,
        maxLength: Int? = nil,
        adjustsFontSizeToFitWidth: Bool = false,
        minimumFontSize: CGFloat = 0.0,
        isAllowedCharacter: @escaping (Character) -> Bool = { _ in true },
        transformation: CustomFormatterTransformation = EmptyTransformation(),
        hint: String? = nil,
        valid: Bool,
        disabled: Bool = false,
        cornerRadii: RectangleCornerRadii = .init(
            topLeading: UIScheme.dimension.buttonCornerRadius,
            bottomLeading: UIScheme.dimension.buttonCornerRadius,
            bottomTrailing: UIScheme.dimension.buttonCornerRadius,
            topTrailing: UIScheme.dimension.buttonCornerRadius
        ),
        accessoryView: AccessoryViewType,
        onCommit: @escaping () -> Void = {}
    ) {
        self._text = text
        self.onCommit = onCommit
        self.placeholder = placeholder
        self.hint = hint ?? ""
        self.valid = valid
        self.disabled = disabled
        self.accessoryView = accessoryView
        self.isOptional = isOptional
        self.isSecure = secure
        self.keyboardType = keyboardType
        self.forceUppercased = forceUppercased
        self.formatter = CustomFormatter(transformation: transformation)
        self.maxLength = maxLength
        self.isAllowedCharacter = isAllowedCharacter
        self.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth
        self.minimumFontSize = minimumFontSize
        self.cornerRadii = cornerRadii
    }

    // MARK: - Methods

    // MARK: Private methods

    private func updateBorder() {
        guard !disabled else {
            borderColor = .clear
            return
        }
        
        if !showValid {
            borderColor = UIScheme.color.inputErrorBorder
        } else if isFocused {
            borderColor = UIScheme.color.brandPrimary
        } else {
            borderColor = .clear
        }
    }

    private func updateBackgroundColor() {
        guard !disabled else {
            backgroundColor = UIScheme.color.inputDisabled
            return
        }

        if !showValid {
            backgroundColor = UIScheme.color.inputErrorBackground
        } else if isFocused {
            backgroundColor = UIScheme.color.brandSecondary.opacity(0.3)
        } else {
            backgroundColor = UIScheme.color.inputNeutral
        }
    }

    private func updatePlaceholder() {
        updatePlaceholderPosition()
    }

    private func updatePlaceholderPosition() {
        if editing
            || !text.isEmpty {
            placeholderPaddings = EdgeInsets(
                top: 9.0,
                leading: UIScheme.dimension.middleSpacing,
                bottom: 29.0,
                trailing: 0
            )
        } else {
            placeholderPaddings = EdgeInsets(
                top: 17.0,
                leading: UIScheme.dimension.middleSpacing,
                bottom: 17.0,
                trailing: 0
            )
        }
    }
}

#if DEBUG

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CustomTextField(
                .constant(""),
                placeholder: "placeholder text",
                hint: "hint text",
                valid: true,
                accessoryView: EmptyView()
            )
            .previewDisplayName("Empty")
            CustomTextField(
                .constant("some text"),
                placeholder: "placeholder text",
                hint: "hint text",
                valid: false,
                accessoryView: Color.red.frame(width: 20, height: 20)
            )
            .previewDisplayName("Error hint")
            CustomTextField(
                .constant("some text"),
                placeholder: "placeholder text",
                hint: "hint text",
                valid: true,
                disabled: true,
                accessoryView: EmptyView()
            )
            .previewDisplayName("Disabled")
            CustomTextField(
                .constant("cvv"),
                placeholder: "CVV",
                secure: true,
                hint: "hint text",
                valid: true,
                disabled: false,
                accessoryView: EmptyView()
            )
            .previewDisplayName("Sequre")
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}

#endif
