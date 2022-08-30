//
//  ApplePayCheckoutView.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 18.07.2022.
//

import SwiftUI

struct ApplePayCheckoutView: View {
    let paymentOptions: PaymentOptions
    let paymentMethod: PaymentMethod

    var payAction: (PaymentMethodsIntent) -> Void = { _ in }

    @State private var isCustomerFieldsValid: Bool = true
    @State private var customerFieldValues: [FieldValue] = []

    private var payButtonIsEnabled: Bool {
        isCustomerFieldsValid
    }

    var body: some View {
        VStack(spacing: UIScheme.dimension.formLargeVerticalSpacing) {
            if let visibleCustomerFields = paymentMethod.visibleCustomerFields {
                EmbeddedCustomerFieldsView(visibleCustomerFields: visibleCustomerFields,
                                           additionalFields: paymentOptions.uiAdditionalFields,
                                           customerFieldValues: customerFieldValues) { fieldsValues, isValid in
                    customerFieldValues = fieldsValues
                    isCustomerFieldsValid = isValid
                }

            }
            ApplePayButton()
                .disabled(!payButtonIsEnabled)
        }
        .padding(.top, UIScheme.dimension.formSmallSpacing)
        .padding(.bottom, UIScheme.dimension.formLargeVerticalSpacing)
        .padding(.horizontal, UIScheme.dimension.middleSpacing)
    }
}

#if DEBUG

struct ApplePayCheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        ApplePayCheckoutView(paymentOptions: MockPaymentOptions(), paymentMethod: MockPaymentMethod())
    }
}

#endif
