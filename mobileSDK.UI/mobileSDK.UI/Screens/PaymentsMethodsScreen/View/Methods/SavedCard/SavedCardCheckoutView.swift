//
//  SavedCardCheckoutView.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 11.07.2022.
//

import SwiftUI

struct SavedCardCheckoutView: View {
    let paymentOptions: PaymentOptions
    let savedCard: SavedAccount
    let methodForAccount: PaymentMethod

    var payAction: (PaymentMethodsIntent) -> Void = { _ in }
    var deleteCardAction: () -> Void

    @State private var cvvText: String = ""
    @State private var isCvvValid: Bool = false
    @State private var isCustomerFieldsValid: Bool = true

    @State private var customerFieldValues: [FieldValue] = []

    private var payButtonIsEnabled: Bool {
        isCvvValid && isCustomerFieldsValid
    }

    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .top, spacing: UIScheme.dimension.formSmallSpacing) {
                dateField
                cvvField
            }
            .padding(.top, UIScheme.dimension.formSmallSpacing)
            .padding(.bottom, UIScheme.dimension.formLargeVerticalSpacing)
            if let visibleCustomerFields = methodForAccount.visibleCustomerFields,
               !visibleCustomerFields.isEmpty,
               visibleCustomerFields.count <= UIScheme.countOfVisibleCustomerFields {
                EmbeddedCustomerFieldsView(visibleCustomerFields: visibleCustomerFields,
                                           additionalFields: paymentOptions.uiAdditionalFields,
                                           customerFieldValues: customerFieldValues) { fieldsValues, isValid in
                    customerFieldValues = fieldsValues
                    isCustomerFieldsValid = isValid
                }
                .padding(.bottom, UIScheme.dimension.formLargeVerticalSpacing)
            }
            PayButton(label: buttonLabel,
                      disabled: !payButtonIsEnabled) {
                payAction(.paySavedAccountWith(id: savedCard.id, cvv: cvvText, customerFields: customerFieldValues))
            }
            .padding(.bottom, UIScheme.dimension.middleSpacing)

            LinkButton(text: L.button_delete.string,
                       fontSize: UIScheme.dimension.smallFont,
                       foregroundColor: UIScheme.color.deleteCardButtonColor,
                       onTap: deleteCardAction)
            .padding(.bottom, UIScheme.dimension.formLargeVerticalSpacing)
        }.padding(.horizontal, UIScheme.dimension.middleSpacing)
    }

    private var dateField: some View {
        ExpiryField(disabled: true, expiryString: .constant(savedCard.savedCardExpiry?.stringValue ?? ""), isValueValid: .constant(true))
    }

    private var cvvField: some View {
        CvvField(withInfoButton: false, cvvValue: $cvvText, isValueValid: $isCvvValid)
    }

    private var buttonLabel: PayButtonLabel {
        if !isContinueButton {
            return PayButtonLabel(style: .Pay(paymentOptions.summary.value, currency: paymentOptions.summary.currency))
        } else {
            return PayButtonLabel(style: .Continue)
        }
    }

    private var isContinueButton: Bool {
        methodForAccount.visibleCustomerFields.count > UIScheme.countOfVisibleCustomerFields
    }
}

#if DEBUG

struct SavedCardCheckoutView_Previews: PreviewProvider {

    static var previews: some View {
        SavedCardCheckoutView(paymentOptions: MockPaymentOptions(),
                              savedCard: MockSavedAccount(),
                              methodForAccount: MockPaymentMethod(),
                              deleteCardAction: {})
        .previewLayout(.sizeThatFits)
    }
}

#endif
