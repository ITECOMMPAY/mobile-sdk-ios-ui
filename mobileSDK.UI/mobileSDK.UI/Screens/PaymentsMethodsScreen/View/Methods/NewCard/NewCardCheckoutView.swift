//
//  NewCardCheckoutView.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 18.07.2022.
//

import SwiftUI

struct NewCardCheckoutView: View {
    @Injected var CardExpiryFabric: CardExpiryFabric?

    var paymentOptions: PaymentOptions
    var paymentMethod: PaymentMethod

    var payAction: (PaymentMethodsIntent) -> Void = { _ in }

    @State var isCOFAgreementChecked: Bool = false

    @State var cardCVV: String = ""
    @State var cardNumber: String = ""
    @State var cardHolder: String = ""
    @State var cardExpiry: String = ""
    @State var customerFieldValues: [FieldValue] = []

    @State var isCardValid: Bool = false
    @State var isCVVValid: Bool = false
    @State var isCardHolderValid: Bool = false
    @State var isExpiryValid: Bool = false

    @State var isCustomerFieldsValid: Bool = false

    var isFormValid: Bool {
        [
            isCardValid,
            isCVVValid,
            isCardHolderValid,
            isExpiryValid,
            isCustomerFieldsValid
        ].allSatisfy { $0 }
    }

    var expiry: CardExpiry {
        return CardExpiryFabric!.createCardExpiry(with: cardExpiry)
    }

    var body: some View {
        VStack(spacing: 0) {
            PanField(cardTypeRecognizer: paymentMethod.cardTypeRecognizer, cardNumber: $cardNumber, isValueValid: $isCardValid)
                .padding(.top, UIScheme.dimension.formSmallSpacing)

            CardHolderField(cardHolder: $cardHolder, isValueValid: $isCardHolderValid)
                .padding(.top, UIScheme.dimension.formSmallSpacing)

            HStack(alignment: .top, spacing: UIScheme.dimension.formSmallSpacing) {
                ExpiryField(disabled: false, expiryString: $cardExpiry, isValueValid: $isExpiryValid)
                CvvField(withInfoButton: true, cvvValue: $cardCVV, isValueValid: $isCVVValid)
            }
            .padding(.top, UIScheme.dimension.formSmallSpacing)
            .padding(.bottom, UIScheme.dimension.formSmallSpacing)

            if !paymentMethod.visibleCustomerFields.isEmpty &&
                paymentMethod.visibleCustomerFields.count <= UIScheme.countOfVisibleCustomerFields {
                EmbeddedCustomerFieldsView(visibleCustomerFields: paymentMethod.visibleCustomerFields,
                                           additionalFields: paymentOptions.uiAdditionalFields,
                                           customerFieldValues: customerFieldValues) { fieldsValues, isValid in
                    customerFieldValues = fieldsValues
                    isCustomerFieldsValid = isValid
                }
                .padding(.bottom, UIScheme.dimension.formLargeVerticalSpacing)
            }

            HStack(alignment: .top, spacing: UIScheme.dimension.formSmallSpacing) {
                CheckBoxView(checked: $isCOFAgreementChecked)

                VStack(alignment: .leading, spacing: UIScheme.dimension.paymentDetailsAttributeSpacing) {
                    Text(L.title_saved_cards.string)
                        .font(UIScheme.font.commonRegular(size: UIScheme.dimension.middleFont))
                        .foregroundColor(UIScheme.color.text)
                    if let translationWithLink = L.cof_agreements.translationWithLink {
                        translationWithLink.attributedText
                     }
                }
                Spacer()
            }
            .padding(.bottom, UIScheme.dimension.formSmallSpacing)

            PayButton(label: buttonLabel, disabled: isFormValid) {
                payAction(.payNewCardWith(cvv: cardCVV,
                                          pan: cardNumber,
                                          year: expiry.expiryYear!,
                                          month: expiry.expiryMonth!,
                                          cardHolder: cardHolder,
                                          saveCard: isCOFAgreementChecked,
                                          customerFields: customerFieldValues))
            }
            .padding(.bottom, UIScheme.dimension.formLargeVerticalSpacing)

        }
        .padding(.horizontal, UIScheme.dimension.middleSpacing)
    }

    private var buttonLabel: PayButtonLabel {
        if !isContinueButton {
            let paymentAmount = paymentOptions.summary.value
            let paymentCurrency = paymentOptions.summary.currency
            return PayButtonLabel(style: .Pay(paymentAmount, currency: paymentCurrency))
        } else {
            return PayButtonLabel(style: .Continue)
        }
    }

    private var isContinueButton: Bool {
        return paymentMethod.visibleCustomerFields.count > UIScheme.countOfVisibleCustomerFields
    }
}

#if DEBUG

struct NewCardCheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        NewCardCheckoutView(paymentOptions: MockPaymentOptions(), paymentMethod: MockPaymentMethod())
    }
}

#endif
