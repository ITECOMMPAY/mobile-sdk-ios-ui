//
//  FormTextField.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 11.07.2022.
//

import SwiftUI
import Combine

struct FormTextField<AccessoryViewType: View>: View {
    // MARK: - Properties
    let accessoryView: AccessoryViewType
    let isSecure: Bool
    let isRequired: Bool

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
        if isSecure {
            SecureField.init("",
                             text: $text,
                             onCommit: { editing = false })
            .font(UIScheme.font.commonRegular(size: UIScheme.dimension.middleFont))
            .foregroundColor(textFieldTextColor)
            .disabled(disabled)
            .onTapGesture {
                editing = true
            }
        } else {
            TextField("", text: $text) { isEditing in
                editing = isEditing
            } onCommit: {
                editing = false
            }
            .font(UIScheme.font.commonRegular(size: UIScheme.dimension.middleFont))
            .foregroundColor(textFieldTextColor)
            .disabled(disabled)
        }
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
                secure: Bool = false,
                required: Bool = false,
                hint: Binding<String>,
                valid: Binding<Bool>,
                disabled: Binding<Bool> = .constant(false),
                accessoryView: AccessoryViewType) {
        self._text = text
        self.placeholder = placeholder
        self._hint = hint
        self._valid = valid
        self._disabled = disabled
        self.accessoryView = accessoryView
        self.isRequired = required
        self.isSecure = secure
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

struct FormTextField_Previews: PreviewProvider  {
    static var previews: some View {
        Group {
            FormTextField(.constant(""),
                          placeholder: "placeholder text",
                          hint: .constant("hint text"),
                          valid: .constant(true),
                          accessoryView: EmptyView()).previewDisplayName("Empty")
            FormTextField(.constant(""),
                          placeholder: "placeholder text",
                          required: true,
                          hint: .constant("hint text"),
                          valid: .constant(true),
                          accessoryView: EmptyView()).previewDisplayName("Requered")
            FormTextField(.constant("some text"),
                          placeholder: "placeholder text",
                          hint: .constant("hint text"),
                          valid: .constant(false),
                          accessoryView: Color.red.frame(width: 20,
                                                         height: 20)).previewDisplayName("Error hint")
            FormTextField(.constant("some text"),
                          placeholder: "placeholder text",
                          hint: .constant("hint text"),
                          valid: .constant(true),
                          disabled: .constant(true),
                          accessoryView: EmptyView()).previewDisplayName("Disabled")
            FormTextField(.constant("cvc"),
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

final class ExampleContentViewModel: ObservableObject {
    let placeholder1 = "Number"
    let placeholder2 = "Word"
    @Published
    var hint1 = "Hint 1"
    @Published
    var hint2 = "Hint 2"
    @Published
    var text1 = "" {
        didSet {
            validateText1()
        }
    }
    @Published
    var text2 = "" {
        didSet {
            validateText2()
        }
    }
    @Published
    var text1Valid = true {
        didSet {
            hint1 = text1Valid
            ? "Some number"
            : "Should contain only digits"
        }
    }
    @Published
    var text2Valid = true {
        didSet {
            hint2 = text2Valid
            ? "Some words"
            : "Should contain only letters"
        }
    }
    func validateText1() {
        text1Valid = !text1.contains(where: { !$0.isNumber })
    }

    func validateText2() {
        text2Valid = !text2.contains(where: { !$0.isLetter })
    }

}

struct ExampleContentView: View {

    var body: some View {
        VStack {
            FormTextField($viewModel.text1,
                          placeholder: viewModel.placeholder1,
                          hint: $viewModel.hint1,
                          valid: $viewModel.text1Valid,
                          accessoryView: CloseButton())
            .padding()
            FormTextField($viewModel.text2,
                          placeholder: viewModel.placeholder2,
                          required: true,
                          hint: $viewModel.hint2,
                          valid: $viewModel.text2Valid,
                          accessoryView: EmptyView())
            .padding()
            Spacer()
        }
        .contentShape(Rectangle())

        .onTapGesture {
            DispatchQueue.main.async {
                UIApplication.shared.resignFirstResponder()
            }
        }
    }

    @ObservedObject
    private var viewModel = ExampleContentViewModel()

}

struct ExampleContentView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleContentView().previewLayout(.sizeThatFits)
    }

}

#endif







