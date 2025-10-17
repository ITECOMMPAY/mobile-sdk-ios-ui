//
//  SavedCardCheckoutView.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 11.07.2022.
//

import SwiftUI

struct SavedCardCheckoutView: View {
    @Binding var formValues: FormData

    let paymentOptions: PaymentOptions
    let savedCard: SavedAccount
    let methodForAccount: PaymentMethod

    var onIntent: (PaymentMethodsIntent) -> Void = { _ in }

    @State private var isCvvValid: Bool = false
    @State private var isCustomerFieldsValid: Bool = false
    @State private var isCardDeleteAlertPresented: Bool = false

    private var payButtonIsEnabled: Bool {
        isCvvValid && (visibleCustomerFields.shouldBeDisplayed ? isCustomerFieldsValid : true)
    }
    
    private var isContinueButton: Bool {
        visibleCustomerFields.count > UIScheme.countOfVisibleCustomerFields
    }
    
    private var isTokenizedAction: Bool {
        (paymentOptions.action == .Sale || paymentOptions.action == .Auth) && paymentOptions.token != nil
    }

    private var visibleCustomerFields: [CustomerField] {
        methodForAccount.visibleCustomerFields
    }

    var body: some View {
        VStack(spacing: 20) {
            VStack(spacing: 2) {
                panField
                
                HStack(spacing: 2) {
                    dateField
                    cvvField
                }
            }
            
            if visibleCustomerFields.shouldBeDisplayed {
                EmbeddedCustomerFieldsView(
                    visibleCustomerFields: visibleCustomerFields,
                    additionalFields: paymentOptions.uiAdditionalFields,
                    customerFieldValues: formValues.customerFieldValues
                ) { fieldsValues, isValid in
                    formValues.customerFieldValues = fieldsValues
                    isCustomerFieldsValid = isValid
                }
            }
            
            PayButton(
                label: buttonLabel,
                disabled: !payButtonIsEnabled
            ) {
                if isTokenizedAction {
                    onIntent(
                        .payToken(
                            cvv: formValues.cardCVV,
                            customerFields: formValues.customerFieldValues
                        )
                    )
                } else {
                    onIntent(
                        .paySavedAccountWith(
                            id: savedCard.id,
                            cvv: formValues.cardCVV,
                            customerFields: formValues.customerFieldValues
                        )
                    )
                }
            }
            
            VStack(spacing: UIScheme.dimension.middleSpacing) {
                if !isTokenizedAction {
                    LinkButton(
                        text: L.button_delete.string,
                        fontSize: .m,
                        foregroundColor: UIScheme.color.inputTextAdditional,
                        onTap: onCardDeleteTap
                    )
                }
                
                if !isContinueButton, let recurringDisclaimer = paymentOptions.recurringDisclaimer {
                    RecurringDisclaimer(text: recurringDisclaimer.string)
                }
            }
        }
        .alert(
            L.message_delete_card_single.string,
            isPresented: $isCardDeleteAlertPresented,
            presenting: savedCard
        ) { savedCard in
            Button(L.button_delete.string, role: .destructive) {
                onIntent(.delete(savedCard))
            }
            Button(L.button_cancel.string, role: .cancel) { }
        }
    }
    
    private var panField: some View {
        PanField(
            paymentMethod: methodForAccount,
            disabled: true,
            errorMessage: .constant(nil),
            cardNumber: .constant(savedCard.number ?? ""),
            isValueValid: .constant(true),
            recognizedCardType: .constant(nil)
        )
    }

    private var dateField: some View {
        ExpiryField(
            disabled: true,
            errorMessage: .constant(nil),
            expiryString: .constant(savedCard.savedCardExpiry?.stringValue ?? ""),
            isValueValid: .constant(true)
        )
    }

    private var cvvField: some View {
        CvvField(
            cardType: savedCard.savedAccountCardType,
            errorMessage: .constant(nil),
            cvvValue: $formValues.cardCVV,
            isValueValid: $isCvvValid
        )
    }

    private var buttonLabel: PayButtonLabel {
        if isContinueButton {
            return PayButtonLabel(style: .continue)
        } else {
            return PayButtonLabel(
                style: .pay(
                    amount: paymentOptions.summary.value,
                    currency: paymentOptions.summary.currency
                )
            )
        }
    }

    private func onCardDeleteTap() {
        isCardDeleteAlertPresented = true
    }
}

#if DEBUG

struct SavedCardCheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        SavedCardCheckoutView(
            formValues: .constant(FormData()),
            paymentOptions: MockPaymentOptions(),
            savedCard: MockSavedAccount(),
            methodForAccount: MockPaymentMethod()
        )
        .previewLayout(.sizeThatFits)
    }
}

#endif
