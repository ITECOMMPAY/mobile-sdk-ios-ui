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
    
    @State var isCardFieldsValid: Bool = false
    @State var isCardHolderValid: Bool = false
    @State var isCustomerFieldsValid: Bool = false
    
    private var isFormValid: Bool {
        [
            isCardFieldsValid,
            isCardHolderValid
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
        VStack(spacing: 20) {
            VStack(spacing: 8) {
                CardView(
                    isSaved: false,
                    needCVV: false,
                    paymentMethod: paymentMethod,
                    cardValidationChanged: { isValid in
                        self.isCardFieldsValid = isValid
                    },
                    formValues: $formValues
                )
                
                CardHolderField(
                    cardHolder: $formValues.cardHolder,
                    isValueValid: $isCardHolderValid
                )
                
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
            }
            
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
        }
    }

    private var buttonLabel: PayButtonLabel {
        if isTokenizeButton {
            return PayButtonLabel(style: .tokenize)
        }
        else {
            return PayButtonLabel(style: .continue)
        }
    }

    private var isTokenizeButton: Bool {
        return visibleCustomerFields.shouldBeDisplayed || visibleCustomerFields.isEmpty
    }
}

#if DEBUG

struct TokenizeCardView_Previews: PreviewProvider {
    static var previews: some View {
        TokenizeCardView(formValues: .constant(FormData()), paymentOptions: MockPaymentOptions(), paymentMethod: MockPaymentMethod())
    }
}

#endif
