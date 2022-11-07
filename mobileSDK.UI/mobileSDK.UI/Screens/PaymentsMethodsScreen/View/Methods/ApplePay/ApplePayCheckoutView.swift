//
//  ApplePayCheckoutView.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 18.07.2022.
//

import SwiftUI

struct ApplePayCheckoutView: View {
    @Binding var formValues: FormData
    let paymentOptions: PaymentOptions
    let paymentMethod: PaymentMethod

    var payAction: (PaymentMethodsIntent) -> Void = { _ in }

    @State private var isCustomerFieldsValid: Bool = true

    private var payButtonIsEnabled: Bool {
        isCustomerFieldsValid
    }

    var body: some View {
        VStack(spacing: UIScheme.dimension.formLargeVerticalSpacing) {
            if let visibleCustomerFields = paymentMethod.visibleCustomerFields {
                EmbeddedCustomerFieldsView(visibleCustomerFields: visibleCustomerFields,
                                           additionalFields: paymentOptions.uiAdditionalFields,
                                           customerFieldValues: formValues.customerFieldValues) { fieldsValues, isValid in
                    formValues.customerFieldValues = fieldsValues
                    isCustomerFieldsValid = isValid
                }
            }
            ApplePayButton {
                if payButtonIsEnabled {
                    payAction(.payWithApplePay(customerFields: formValues.customerFieldValues))
                } else {
                    triggerValidation()
                }
            }
        }
        .padding(.top, UIScheme.dimension.formSmallSpacing)
        .padding(.bottom, UIScheme.dimension.formLargeVerticalSpacing)
        .padding(.horizontal, UIScheme.dimension.middleSpacing)
    }

    private func triggerValidation() {
        NotificationCenter.default.post(name: NSNotification.Name( ValidationTriggerNotification), object: nil)
    }
}

#if DEBUG

struct ApplePayCheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        ApplePayCheckoutView(formValues: .constant(FormData()), paymentOptions: MockPaymentOptions(), paymentMethod: MockPaymentMethod())
    }
}

#endif
