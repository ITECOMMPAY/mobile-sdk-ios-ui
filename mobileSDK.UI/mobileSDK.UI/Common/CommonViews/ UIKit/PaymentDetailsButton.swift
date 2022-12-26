//
//  PaymentDetailsButton.swift
//  mobileSDK.UI
//
//  Created by FlyiingV on 24.11.2022.
//

import SwiftUI

struct PaymentDetailsButton: View {
    let text: String
    let action: () -> Void

    var body: some View {
        Button(action: action, label: {
            Text(text).font(UIScheme.font.commonRegular(size: UIScheme.dimension.smallFont))
                .frame(maxWidth: .infinity)
                .frame(height: UIScheme.dimension.paymentDetailsButtonHeight)
                .foregroundColor(UIScheme.color.paymentDetailsForegroundColor)
                .background(UIScheme.color.paymentDetailsBackgroundColor)
                .cornerRadius(6)
        })
    }
}

#if DEBUG

import AVFoundation

struct PaymentDetailsButton_Previews: PreviewProvider {
    static var previews: some View {
        PaymentDetailsButton(text: "Payment Details") {
            AudioServicesPlaySystemSound(1016)
        }
    }
}

#endif
