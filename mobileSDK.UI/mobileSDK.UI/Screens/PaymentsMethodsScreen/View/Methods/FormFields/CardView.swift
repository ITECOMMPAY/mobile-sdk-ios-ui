//
//  CardView.swift
//  mobileSDK.UI
//
//  Created by Ilya Matveev on 12.10.2025.
//

import SwiftUI

struct CardView: View {
    let isSaved: Bool
    let needCVV: Bool
    
    var paymentMethod: PaymentMethod
    
    @State var isPanValid: Bool = false
    @State var isExpiryValid: Bool = false
    @State var isCvvValid: Bool = false
    
    @Binding var formValues: FormData
    
    @State private var cardType: CardType?
    @State private var panErrorMessage: String?
    @State private var expiryErrorMessage: String?
    @State private var cvvErrorMessage: String?

    private var prioritizedErrorMessage: String? {
        panErrorMessage ?? expiryErrorMessage ?? cvvErrorMessage
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            VStack(spacing: 2) {
                PanField(
                    paymentMethod: paymentMethod,
                    disabled: isSaved,
                    errorMessage: $panErrorMessage,
                    cardNumber: $formValues.cardNumber,
                    isValueValid: isSaved ? .constant(true) : $isPanValid,
                    recognizedCardType: $cardType
                )

                HStack(spacing: 2) {
                    ExpiryField(
                        disabled: isSaved,
                        errorMessage: $expiryErrorMessage,
                        expiryString: $formValues.cardExpiry,
                        isValueValid: isSaved ? .constant(true) : $isExpiryValid,
                        cornerRadii: needCVV
                            ? .init(
                                topLeading: 2,
                                bottomLeading: UIScheme.dimension.buttonCornerRadius,
                                bottomTrailing: 2,
                                topTrailing: 2
                            )
                            : .init(
                                topLeading: 2,
                                bottomLeading: UIScheme.dimension.buttonCornerRadius,
                                bottomTrailing: UIScheme.dimension.buttonCornerRadius,
                                topTrailing: 2
                            )
                    )

                    if needCVV {
                        CvvField(
                            cardType: cardType ?? .unknown,
                            errorMessage: $cvvErrorMessage,
                            cvvValue: $formValues.cardCVV,
                            isValueValid: $isCvvValid
                        )
                    }
                }
            }

            if let errorMessage = prioritizedErrorMessage {
                Text(errorMessage)
                    .font(.custom(.primary(size: .xs, weight: .regular)))
                    .foregroundColor(UIScheme.color.inputErrorBorder)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }
}

#if DEBUG

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(
            isSaved: false,
            needCVV: true,
            paymentMethod: MockPaymentMethod(),
            formValues: .constant(FormData())
        )
    }
}

#endif
