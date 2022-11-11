//
//  PanField.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 22.07.2022.
//

import SwiftUI

struct PanField: View {
    @Injected private var validationService: ValidationService?

    let paymentMethod: PaymentMethod

    var cardTypeRecognizer: CardTypeRecognizer? {
        paymentMethod.cardTypeRecognizer
    }

    let allowedCharacters = { (c: Character) in c.isASCII && c.isNumber }

    @Binding var cardNumber: String

    @Binding var isValueValid: Bool

    @Binding var recognizedCardType: CardType?

    @State private var isFieldValid: Bool = true

    @State private var errorMessage: String = ""

    var transformation: CustomFormatterTransformation {
        if let cardTypeRecognizer = cardTypeRecognizer {
            return CardNumberTransformation(cardTypeRecognizer: cardTypeRecognizer)
        }
        return EmptyTransformation()
    }

    var body: some View {
        CustomTextField(
            $cardNumber.didSet({ newValue in
                validate(newValue)
            }),
            placeholder: L.title_card_number.string,
            keyboardType: .numberPad,
            forceUppercased: true,
            secure: false,
            maxLength: 19,
            isAllowedCharacter: allowedCharacters,
            transformation: transformation,
            required: true,
            hint: errorMessage,
            valid: isFieldValid,
            disabled: false,
            accessoryView: CardTypeView(
                connectedCardTypes: paymentMethod.connectedCardTypes,
                recognizedType: $recognizedCardType
            )
        ) {
            validate(cardNumber)
        }.onAppear {
            validate(cardNumber, ignoreEmpty: true)
        }
    }

    private func validate(_ value: String, ignoreEmpty: Bool = false) {
        recognizeCardType(value)
        if value.isEmpty {
            errorMessage = L.message_required_field.string
            isValueValid = false
            isFieldValid = ignoreEmpty
        } else {
            if validationService?.isPanValidatorValid(value: value) ?? false {
                if paymentMethod.connectedCardTypes.contains(recognizedCardType ?? .unknown) {
                    isValueValid = true
                    isFieldValid = true
                } else {
                    let cardTypeName = (recognizedCardType ?? .unknown).rawValue
                    errorMessage = L.message_wrong_card_type.stringByReplacingPlaceholder(with: cardTypeName)
                    isValueValid = false
                    isFieldValid = false
                }
            } else {
                errorMessage = L.message_about_card_number.string
                isValueValid = false
                isFieldValid = false
            }
        }
    }

    func recognizeCardType(_ value: String) {
        recognizedCardType = cardTypeRecognizer?
            .getCardType(for: value)?
            .cardType ?? (value.isEmpty ? nil : .unknown )
    }
}

private struct CardTypeView: View {
    let connectedCardTypes: [CardType]
    @Binding var recognizedType: CardType?

    @State private var timer: Timer?
    @State private var thirdCardIndex: Int?

    private var visibleCardTypes: [CardType] {
        connectedCardTypes.filter { cardType in
            cardType.localLogo != nil
        }
    }

    var body: some View {
        HStack(spacing: UIScheme.dimension.tinySpacing) {
            if let recognizedType = recognizedType {
                view(for: recognizedType)
            } else if !visibleCardTypes.isEmpty {
                if let first = visibleCardTypes.first {
                    view(for: first)
                }
                if visibleCardTypes.count > 1, let second = visibleCardTypes[1] {
                    view(for: second)
                }
                if visibleCardTypes.count > 2 {
                    let index = thirdCardIndex ?? 2
                    view(for: visibleCardTypes[index])
                }
            } else {
                view(for: nil)
            }
        }.onAppear(perform: initTimer)
    }

    func view(for type: CardType?) -> some View {
        let transition: AnyTransition = .asymmetric(
            insertion: .move(edge: .top).combined(with: .opacity),
            removal: .move(edge: .bottom).combined(with: .opacity)
        )
        return Group {
            if let type = type, let logo = type.localLogo {
                logo
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                IR.bankCard.image?
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        .id(type)
        .transition(transition)
        .frame(height: 16)
        .frame(maxWidth: 20)
    }

    func initTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.5,
                       repeats: true) { _ in
            withAnimation(.linear(duration: 0.5)) {
                onTimerTick()
            }
        }
    }

    private func onTimerTick() {
        switch visibleCardTypes.count {
        case 0...2:
            thirdCardIndex = nil
        case 3:
            thirdCardIndex = 2
        default:
            if let thirdCardIndex = thirdCardIndex {
                let tailCount = visibleCardTypes.count - 2
                let tailIndex = thirdCardIndex - 2
                self.thirdCardIndex = 2 + (tailIndex + 1) % tailCount
            } else {
                thirdCardIndex = 2
            }
        }
    }
}

#if DEBUG

struct PanFieldPreview: View {
    @State var cardNumber: String = ""
    @State var isValid: Bool = true
    @State var anotherText: String = ""
    var body: some View {
        PanField(paymentMethod: MockPaymentMethod(), cardNumber: $cardNumber, isValueValid: $isValid, recognizedCardType: .constant(nil))
        Text("cardNumber=\(cardNumber)  isValid=\(isValid.description)")
        TextField("Another textfield", text: $anotherText)
    }
}

struct PanField_Previews: PreviewProvider {
    static var previews: some View {
        PanFieldPreview()
    }
}
#endif
