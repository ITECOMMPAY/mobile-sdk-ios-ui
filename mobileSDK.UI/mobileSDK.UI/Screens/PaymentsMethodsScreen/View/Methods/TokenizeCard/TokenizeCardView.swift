//
//  TokenizeCardView.swift
//  mobileSDK.UI
//
//  Created by Artem Serebrennikov on 16.12.2022.
//

import SwiftUI

struct TokenizeCardView: View {
    @Injected var CardExpiryFabric: CardExpiryFabric?

    @Binding var formValues: FormData

    var paymentOptions: PaymentOptions
    var paymentMethod: PaymentMethod

    var payAction: (PaymentMethodsIntent) -> Void = { _ in }

    @State var isCardValid: Bool = false
    @State var isCardHolderValid: Bool = false
    @State var isExpiryValid: Bool = false

    @State var isCustomerFieldsValid: Bool = false

    private var isFormValid: Bool {
        [
            isCardValid,
            isCardHolderValid,
            isExpiryValid
        ].allSatisfy { $0 }
        && (visibleCustomerFields.shouldBeDisplayed ? isCustomerFieldsValid : true)
    }
    
    private var visibleCustomerFields: [CustomerField] {
        paymentMethod.visibleCustomerFields.filter { $0.isTokenize }
    }

    @State private var cardType: CardType?

    var expiry: CardExpiry {
        return CardExpiryFabric!.createCardExpiry(with: formValues.cardExpiry)
    }

    var body: some View {
        VStack(spacing: 0) {
            PanField(
                paymentMethod: paymentMethod,
                cardNumber: $formValues.cardNumber,
                isValueValid: $isCardValid,
                recognizedCardType: $cardType
            ).padding(.top, UIScheme.dimension.formSmallSpacing)

            CardHolderField(
                cardHolder: $formValues.cardHolder,
                isValueValid: $isCardHolderValid
            ).padding(.top, UIScheme.dimension.formSmallSpacing)

            ExpiryField(
                disabled: false,
                expiryString: $formValues.cardExpiry,
                isValueValid: $isExpiryValid
            )
            .padding(.top, UIScheme.dimension.formSmallSpacing)
            .padding(.bottom, UIScheme.dimension.formSmallSpacing)
            
            if visibleCustomerFields.shouldBeDisplayed {
                EmbeddedCustomerFieldsView(
                    visibleCustomerFields: visibleCustomerFields,
                    additionalFields: paymentOptions.uiAdditionalFields,
                    customerFieldValues: formValues.customerFieldValues
                ) { fieldsValues, isValid in
                    formValues.customerFieldValues = fieldsValues
                    isCustomerFieldsValid = isValid
                }
                .padding(.bottom, UIScheme.dimension.formLargeVerticalSpacing)
            }

            PayButton(label: buttonLabel, disabled: !isFormValid) {
                payAction(.tokenize)
            }
            .padding(.bottom, UIScheme.dimension.formLargeVerticalSpacing)

        }
        .padding(.horizontal, UIScheme.dimension.middleSpacing)
    }

    private var buttonLabel: PayButtonLabel {
        PayButtonLabel(style: .Tokenize)
    }
}

#if DEBUG

struct TokenizeCardView_Previews: PreviewProvider {
    static var previews: some View {
        TokenizeCardView(formValues: .constant(FormData()), paymentOptions: MockPaymentOptions(), paymentMethod: MockPaymentMethod())
    }
}

#endif
