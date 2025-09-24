//
//  PaymentDetailsButton.swift
//  mobileSDK.UI
//
//  Created by FlyiingV on 24.11.2022.
//

import SwiftUI

struct PaymentDetailsButton: View {
    let expanded: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Text(
                    expanded
                        ? L.button_hide_details.string
                        : L.title_payment_information_screen.string
                )
                .foregroundColor(UIScheme.color.paymentDetailsForegroundColor)
                Spacer()
                ZStack {
                    Circle()
                        .fill(UIScheme.color.secondaryBrandColor)
                        .frame(width: 28, height: 28)
                    Image(systemName: expanded ? "chevron.up" : "chevron.down")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.black)
                }
            }
        }
    }
}

#if DEBUG

import AVFoundation

struct PaymentDetailsButton_Previews: PreviewProvider {
    static var previews: some View {
        PaymentDetailsButton(expanded: false) {
            AudioServicesPlaySystemSound(1016)
        }
    }
}

#endif
