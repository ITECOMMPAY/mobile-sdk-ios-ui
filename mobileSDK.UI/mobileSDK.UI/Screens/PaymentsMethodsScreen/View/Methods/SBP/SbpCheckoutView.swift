//
//  SbpCheckoutView.swift
//  mobileSDK.UI
//
//  Created by Claude on 21.05.2026.
//

import SwiftUI

struct SbpCheckoutView: View {
    let paymentOptions: PaymentOptions
    let paymentMethod: PaymentMethod

    var payAction: (PaymentMethodsIntent) -> Void = { _ in }

    var body: some View {
        VStack(spacing: 20) {
            Text(L.aps_payment_disclaimer.string)
                .font(.custom(.primary(size: .s, weight: .regular)))
                .foregroundColor(UIScheme.color.inputTextPrimary)
            PayButton(
                label: buttonLabel,
                disabled: false
            ) {
                payAction(.paySBP(paymentMethod))
            }
        }
    }

    private var buttonLabel: PayButtonLabel {
        let paymentAmount = paymentOptions.summary.value
        let paymentCurrency = paymentOptions.summary.currency
        return PayButtonLabel(style: .pay(amount: paymentAmount, currency: paymentCurrency))
    }
}

#if DEBUG

struct SbpCheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        SbpCheckoutView(paymentOptions: MockPaymentOptions(), paymentMethod: MockPaymentMethod())
    }
}

#endif
