//
//  ApsCheckoutView.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 26.08.2022.
//

import SwiftUI

struct ApsCheckoutView: View {
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
                payAction(.payAPS(paymentMethod))
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

struct ApsCheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        ApsCheckoutView(paymentOptions: MockPaymentOptions(), paymentMethod: MockPaymentMethod())
    }
}

#endif
