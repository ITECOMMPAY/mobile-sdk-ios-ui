//
//  NewCardCheckoutView.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 18.07.2022.
//

import SwiftUI

struct NewCardCheckoutView: View {
    @Injected var CardExpiryFabric: CardExpiryFabric?

    var paymentMethod: PaymentMethod?
    var paymentOptions: PaymentOptions?

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
            PanField(cardTypeRecognizer: paymentMethod?.cardTypeRecognizer, cardNumber: $cardNumber, isValueValid: $isCardValid)
            .padding(.top, UIScheme.dimension.formSmallSpacing)

            CardHolderField(cardHolder: $cardHolder, isValueValid: $isCardHolderValid)
            .padding(.top, UIScheme.dimension.formSmallSpacing)

            HStack(alignment: .top, spacing: UIScheme.dimension.formSmallSpacing) {
                ExpiryField(disabled: false, expiryString: $cardExpiry, isValueValid: $isExpiryValid)
                CvvField(withInfoButton: true, cvvValue: $cardCVV, isValueValid: $isCVVValid)
            }
            .padding(.top, UIScheme.dimension.formSmallSpacing)
            .padding(.bottom, UIScheme.dimension.formSmallSpacing)

            if let visibleCustomerFields = paymentMethod?.visibleCustomerFields,
               !visibleCustomerFields.isEmpty,
               visibleCustomerFields.count <= UIScheme.countOfVisibleCustomerFields {
                EmbeddedCustomerFieldsView(visibleCustomerFields: visibleCustomerFields,
                                           additionalFields: paymentOptions?.uiAdditionalFields ?? [],
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
                    Text(L.cof_agreements.string)
                        .font(UIScheme.font.commonRegular(size: UIScheme.dimension.tinyFont))
                        .foregroundColor(UIScheme.color.textFieldPlaceholderColor)

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
                                          saveCard: isCOFAgreementChecked))
            }
            .padding(.bottom, UIScheme.dimension.formLargeVerticalSpacing)

        }
        .padding([.leading, .trailing], UIScheme.dimension.middleSpacing)
    }

    private var buttonLabel: PayButtonLabel {
        if !isContinueButton, let paymentAmount = paymentOptions?.summary.value, let paymentCurrency = paymentOptions?.summary.currency {
            return PayButtonLabel(style: .Pay(paymentAmount, currency: paymentCurrency))
        } else {
            return PayButtonLabel(style: .Continue)
        }
    }

    private var isContinueButton: Bool {
        if let visibleCustomerFields = paymentMethod?.visibleCustomerFields {
            return visibleCustomerFields.count > UIScheme.countOfVisibleCustomerFields
        }
        return true
    }
}

#if DEBUG

struct NewCardCheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        NewCardCheckoutView()
    }
}

#endif
