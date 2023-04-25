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
        VStack(spacing: 0) {
            HStack(alignment: .top, spacing: UIScheme.dimension.formSmallSpacing) {
                dateField
                cvvField
            }
            .padding(.top, UIScheme.dimension.formSmallSpacing)
            .padding(.bottom, UIScheme.dimension.formLargeVerticalSpacing)
            if visibleCustomerFields.shouldBeDisplayed {
                EmbeddedCustomerFieldsView(visibleCustomerFields: visibleCustomerFields,
                                           additionalFields: paymentOptions.uiAdditionalFields,
                                           customerFieldValues: formValues.customerFieldValues) { fieldsValues, isValid in
                    formValues.customerFieldValues = fieldsValues
                    isCustomerFieldsValid = isValid
                }
                .padding(.bottom, UIScheme.dimension.formLargeVerticalSpacing)
            }
            PayButton(label: buttonLabel,
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
            .padding(.bottom, UIScheme.dimension.middleSpacing)
            
            VStack(spacing: UIScheme.dimension.middleSpacing) {
                if !isTokenizedAction {
                    LinkButton(text: L.button_delete.string,
                               fontSize: UIScheme.dimension.smallFont,
                               foregroundColor: UIScheme.color.deleteCardButtonColor,
                               onTap: onCardDeleteTap)
                }
                
                if !isContinueButton, let recurringDisclaimer = paymentOptions.recurringDisclaimer {
                    RecurringDisclaimer(text: recurringDisclaimer.string)
                }
            }.padding(.bottom, UIScheme.dimension.formLargeVerticalSpacing)
        }
        .padding(.horizontal, UIScheme.dimension.middleSpacing)
        .alert(isPresented: $isCardDeleteAlertPresented) {
            Alert(
                title: Text(L.message_delete_card_single.string),
                message: nil,
                primaryButton: .destructive(Text(L.button_delete.string), action: {
                    onIntent(.delete(savedCard))
                }),
                secondaryButton: .cancel(Text(L.button_cancel.string))
            )
        }
    }

    private var dateField: some View {
        ExpiryField(
            disabled: true,
            expiryString: .constant(savedCard.savedCardExpiry?.stringValue ?? ""),
            isValueValid: .constant(true)
        )
    }

    private var cvvField: some View {
        CvvField(withInfoButton: false,
                 cardType: savedCard.savedAccountCardType,
                 cvvValue: $formValues.cardCVV,
                 isValueValid: $isCvvValid)
    }

    private var buttonLabel: PayButtonLabel {
        if isContinueButton {
            return PayButtonLabel(style: .Continue)
        } else {
            return PayButtonLabel(style: .Pay(paymentOptions.summary.value, currency: paymentOptions.summary.currency))
        }
    }

    private func onCardDeleteTap() {
        isCardDeleteAlertPresented = true
    }
}

#if DEBUG

struct SavedCardCheckoutView_Previews: PreviewProvider {

    static var previews: some View {
        SavedCardCheckoutView(formValues: .constant(FormData()),
                              paymentOptions: MockPaymentOptions(),
                              savedCard: MockSavedAccount(),
                              methodForAccount: MockPaymentMethod())
        .previewLayout(.sizeThatFits)
    }
}

#endif
