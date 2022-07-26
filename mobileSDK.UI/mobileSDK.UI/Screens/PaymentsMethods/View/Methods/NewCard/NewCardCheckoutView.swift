//
//  NewCardCheckoutView.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 18.07.2022.
//

import SwiftUI

struct NewCardCheckoutView: View {
    @Injected var cardTypeManageFabric: CardTypesManagerFabric?
    @Injected var CardExpiryFabric: CardExpiryFabric?

    var methodCardTypes: [PaymentMethodCard]
    var paymentAmount: Decimal
    var paymentCurrency: String

    var payAction: (PaymentMethodsIntent) -> Void = { _ in }

    @State var isCOFAgreementChecked: Bool = false

    @State var cardCVV: String = ""
    @State var cardNumber: String = ""
    @State var cardHolder: String = ""
    @State var cardExpiry: String = ""

    @State var isCardValid: Bool = false
    @State var isCVVValid: Bool = false
    @State var isCardHolderValid: Bool = false
    @State var isExpiryValid: Bool = false

    var isFormValid: Bool {
        [
            isCardValid,
            isCVVValid,
            isCardHolderValid,
            isExpiryValid,
        ].allSatisfy { $0 }
    }

    var expiry: CardExpiry {
        return CardExpiryFabric!.createCardExpiry(with: cardExpiry)
    }


    var body: some View {
        VStack(spacing: 0) {
            PanField(cardTypesManager: cardTypeManageFabric?.create(with: methodCardTypes), cardNumber: $cardNumber, isValid: $isCardValid)
            .padding(.top, UIScheme.dimension.formSmallSpacing)

            CardHolderField(cardHolder: $cardHolder, isValid: $isCardHolderValid)
            .padding(.top, UIScheme.dimension.formSmallSpacing)

            HStack(alignment: .top, spacing: UIScheme.dimension.formSmallSpacing) {
                ExpiryField(disabled: false, expiryString: $cardExpiry, isValid: $isExpiryValid)
                CvvField(showValidation: true, cvv: $cardCVV, isValid: $isCVVValid)
            }
            .padding(.top, UIScheme.dimension.formSmallSpacing)

            EmbeddedAdditionalFieldsView()
                .padding(.top, UIScheme.dimension.formSmallSpacing)
                .padding(.bottom, UIScheme.dimension.formLargeVerticalSpacing)

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

            PayButton(label: PayButtonLabel(style: .Pay(paymentAmount, currency: paymentCurrency)), disabled: isFormValid) {
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
}

#if DEBUG

struct NewCardCheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        NewCardCheckoutView(methodCardTypes: [], paymentAmount: 100.500, paymentCurrency: "RUB")
    }
}

#endif
