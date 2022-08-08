//
//  SavedCardCheckoutView.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 11.07.2022.
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

    @State private var customerFieldValues: [CustomerFieldValue] = []

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
                payAction(.paySavedAccountWith(id: savedCard.id, cvv: cvvText))
            }
            .padding(.bottom, UIScheme.dimension.middleSpacing)

            LinkButton(text: L.button_delete.string,
                       fontSize: UIScheme.dimension.smallFont,
                       foregroundColor: UIScheme.color.deleteCardButtonColor,
                       onTap: deleteCardAction)
            .padding(.bottom, UIScheme.dimension.formLargeVerticalSpacing)
        }.padding([.leading, .trailing], UIScheme.dimension.middleSpacing)
    }

    private var dateField: some View {
        ExpiryField(disabled: true, expiryString: .constant(savedCard.savedCardExpiry?.stringValue ?? ""), isValueValid: .constant(true))
    }

    private var cvvField: some View {
        CvvField(cvvValue: $cvvText, isValueValid: $isCvvValid)
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
    struct MockSavedAccount: SavedAccount {
        var cardUrlLogo: String?
        var id: Int64 = 100500
        var number: String? = "*** 1234"
        var token: String? = "***"
        var type: String? = "card"
        var savedCardExpiry: CardExpiry?
    }

    static var previews: some View {
        // TODO: repare preview
        /*/
        SavedCardCheckoutView(paymentAmount: 100.500,
                              paymentCurrency: "RUB",
                              savedCard: MockSavedAccount(),
                              additionalFieldsView: nil,
                              payButtonLabelStyle: .Continue,
                              payAction: { _ in },
                              deleteCardAction: {})
            .previewLayout(.sizeThatFits)
         */
        EmptyView()
    }
}

#endif
