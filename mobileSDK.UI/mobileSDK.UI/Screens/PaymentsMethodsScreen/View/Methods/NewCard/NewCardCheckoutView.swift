//
//  NewCardCheckoutView.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 18.07.2022.
//

import SwiftUI

struct NewCardCheckoutView: View {
    @Injected var CardExpiryFabric: CardExpiryFabric?

    @Binding var formValues: FormData

    var paymentOptions: PaymentOptions
    var paymentMethod: PaymentMethod

    var payAction: (PaymentMethodsIntent) -> Void = { _ in }

    @State var isCardValid: Bool = false
    @State var isCVVValid: Bool = false
    @State var isCardHolderValid: Bool = false
    @State var isExpiryValid: Bool = false
    @State var isCustomerFieldsValid: Bool = false
    @State var scannedCardInfo: ScannedCardInfo? = nil

    private var isFormValid: Bool {
        [
            isCardValid,
            isCVVValid,
            isCardHolderValid,
            isExpiryValid
        ].allSatisfy { $0 }
        && (!isContinueButton ? (isCustomerFieldsValid || paymentMethod.visibleCustomerFields.isEmpty): true)
    }

    private var canSaveCard: Bool {
        paymentOptions.action != .Verify && paymentMethod.walletModeAsk
    }

    @State private var cardType: CardType?

    var expiry: CardExpiry {
        return CardExpiryFabric!.createCardExpiry(with: formValues.cardExpiry)
    }

    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .top, spacing: UIScheme.dimension.formSmallSpacing) {
                
                PanField(
                    paymentMethod: paymentMethod,
                    cardNumber: $formValues.cardNumber,
                    scannedCardInfo: $scannedCardInfo,
                    isValueValid: $isCardValid,
                    recognizedCardType: $cardType
                )

                ScanCardButton() { info in
                    if let cardNumber = info.cardNumber {
                        formValues.cardNumber = cardNumber
                    }
                    
                    if let cardExpiry = info.cardExpiry {
                        formValues.cardExpiry = cardExpiry
                    }

                    scannedCardInfo = info
                }
            }.padding(.top, UIScheme.dimension.formSmallSpacing)

            CardHolderField(
                cardHolder: $formValues.cardHolder,
                isValueValid: $isCardHolderValid
            ).padding(.top, UIScheme.dimension.formSmallSpacing)

            HStack(alignment: .top, spacing: UIScheme.dimension.formSmallSpacing) {
                ExpiryField(
                    disabled: false,
                    expiryString: $formValues.cardExpiry,
                    scannedCardInfo: $scannedCardInfo,
                    isValueValid: $isExpiryValid
                )
                CvvField(withInfoButton: true, cardType: cardType ?? .unknown, cvvValue: $formValues.cardCVV, isValueValid: $isCVVValid)
            }
            .padding(.top, UIScheme.dimension.formSmallSpacing)
            .padding(.bottom, UIScheme.dimension.formSmallSpacing)
            if paymentMethod.visibleCustomerFields.shouldBeDisplayed {
                EmbeddedCustomerFieldsView(visibleCustomerFields: paymentMethod.visibleCustomerFields,
                                           additionalFields: paymentOptions.uiAdditionalFields,
                                           customerFieldValues: formValues.customerFieldValues) { fieldsValues, isValid in
                    formValues.customerFieldValues = fieldsValues
                    isCustomerFieldsValid = isValid
                }
                .padding(.bottom, UIScheme.dimension.formLargeVerticalSpacing)
            }

            saveCardCheckbox.padding(.bottom, UIScheme.dimension.formSmallSpacing)

            PayButton(label: buttonLabel, disabled: !isFormValid) {
                payAction(.payNewCardWith(cvv: formValues.cardCVV,
                                          pan: formValues.cardNumber,
                                          year: expiry.expiryYear!,
                                          month: expiry.expiryMonth!,
                                          cardHolder: formValues.cardHolder,
                                          saveCard: formValues.isCOFAgreementChecked,
                                          customerFields: formValues.customerFieldValues))
            }
            .padding(.bottom, UIScheme.dimension.formLargeVerticalSpacing)

        }
        .padding(.horizontal, UIScheme.dimension.middleSpacing)
    }
    
    @ViewBuilder
    private var saveCardCheckbox: some View {
        if canSaveCard {
            HStack(alignment: .top, spacing: UIScheme.dimension.formSmallSpacing) {
                CheckBoxView(checked: $formValues.isCOFAgreementChecked)

                VStack(alignment: .leading, spacing: UIScheme.dimension.tinySpacing) {
                    Text(L.title_saved_cards.string)
                        .font(UIScheme.font.commonRegular(size: UIScheme.dimension.middleFont))
                        .foregroundColor(UIScheme.color.text)
                    if let translationWithLink = L.cof_agreements.translationWithLink {
                        translationWithLink.attributedText
                     }
                }
                Spacer()
            }
        } else {
            EmptyView()
        }
    }

    private var buttonLabel: PayButtonLabel {
        guard !isContinueButton else {
            return PayButtonLabel(style: .Continue)
        }

        guard paymentOptions.action != .Verify else {
            return PayButtonLabel(style: .Verify)
        }

        let paymentAmount = paymentOptions.summary.value
        let paymentCurrency = paymentOptions.summary.currency

        return PayButtonLabel(style: .Pay(paymentAmount, currency: paymentCurrency))
    }

    private var isContinueButton: Bool {
        return paymentMethod.visibleCustomerFields.count > UIScheme.countOfVisibleCustomerFields
    }
}

#if DEBUG

struct NewCardCheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        NewCardCheckoutView(formValues: .constant(FormData()), paymentOptions: MockPaymentOptions(), paymentMethod: MockPaymentMethod())
    }
}

#endif
