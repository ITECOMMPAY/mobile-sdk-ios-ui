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
        paymentOptions.action != .Verify && paymentMethod.walletSaveMode == .askCustomer
    }

    @State private var cardType: CardType?

    var expiry: CardExpiry {
        return CardExpiryFabric!.createCardExpiry(with: formValues.cardExpiry)
    }

    var body: some View {
        VStack(spacing: 20) {
            VStack(spacing: 8) {
                CardView(
                    isSaved: false,
                    needCVV: true,
                    paymentMethod: paymentMethod,
                    formValues: $formValues
                )
                
                CardHolderField(
                    cardHolder: $formValues.cardHolder,
                    isValueValid: $isCardHolderValid
                )
                
                if paymentMethod.visibleCustomerFields.shouldBeDisplayed {
                    EmbeddedCustomerFieldsView(
                        visibleCustomerFields: paymentMethod.visibleCustomerFields,
                        additionalFields: paymentOptions.uiAdditionalFields,
                        customerFieldValues: formValues.customerFieldValues
                    ) { fieldsValues, isValid in
                        formValues.customerFieldValues = fieldsValues
                        isCustomerFieldsValid = isValid
                    }
                }
            }

            saveCardCheckbox

            PayButton(label: buttonLabel, disabled: !isFormValid) {
                payAction(
                    .payNewCardWith(
                        cvv: formValues.cardCVV,
                        pan: formValues.cardNumber,
                        year: expiry.expiryYear!,
                        month: expiry.expiryMonth!,
                        cardHolder: formValues.cardHolder,
                        saveCard: formValues.isCOFAgreementChecked,
                        customerFields: formValues.customerFieldValues
                    )
                )
            }

            if !isContinueButton,
               let recurringDisclaimer = paymentOptions.recurringDisclaimer {
                RecurringDisclaimer(text: recurringDisclaimer.string)
            }
        }
    }
    
    @ViewBuilder
    private var saveCardCheckbox: some View {
        if canSaveCard {
            VStack(alignment: .leading, spacing: UIScheme.dimension.tinySpacing) {
                Toggle(L.title_saved_cards.string, isOn: $formValues.isCOFAgreementChecked)
                    .toggleStyle(CheckBoxStyle())
                if let translationWithLink = L.cof_agreements.translationWithLink {
                    translationWithLink.attributedText
                        .padding(.leading, 30)
                }
            }
        } else {
            EmptyView()
        }
    }

    private var buttonLabel: PayButtonLabel {
        guard !isContinueButton else {
            return PayButtonLabel(style: .continue)
        }
        
        guard paymentOptions.action != .Verify else {
            return PayButtonLabel(style: .verify)
        }
        
        let paymentAmount = paymentOptions.summary.value
        let paymentCurrency = paymentOptions.summary.currency
        
        return PayButtonLabel(style: .pay(amount: paymentAmount, currency: paymentCurrency))
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
