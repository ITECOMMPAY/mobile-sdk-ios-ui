//
//  PayButton.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 12.07.2022.
//

import SwiftUI

struct PayButton<Label: View>: View {
    let label: Label
    let disabled: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action, label: {
            label.frame(maxWidth: .infinity)
                .frame(height: UIScheme.dimension.payButtonHeight)
                .foregroundColor(.white)
                .background(disabled ? UIScheme.color.brandColor.opacity(0.3) : UIScheme.color.brandColor)
                .cornerRadius(8)
        })
        .disabled(disabled)
    }
}

struct PayButtonLabel: View {
    enum Style {
        case Pay(Decimal, currency: String)
        case Continue
        case TryAgain
        case Done
        case Close
    }

    let style: Style

    var body: some View {
        switch style {
        case .Pay(let amount, currency: let currency):
            let numberFormatter = { () -> NumberFormatter in
                let formatter = NumberFormatter()
                formatter.maximumFractionDigits = 2
                formatter.minimumFractionDigits = 2
                return formatter
            }()
            HStack(spacing: UIScheme.dimension.payButtonPayPriceSpacing) {
                Text("Pay").font(UIScheme.font.commonRegular(size: UIScheme.dimension.smallFont))
                Text("\(amount as NSDecimalNumber, formatter: numberFormatter) \(currency)").font(UIScheme.font.commonBold(size: UIScheme.dimension.smallFont))
            }
        case .Continue:
            Text(L.button_confirmation.string).font(UIScheme.font.commonRegular(size: UIScheme.dimension.smallFont))
        case .TryAgain:
            Text(L.button_try_again.string).font(UIScheme.font.commonRegular(size: UIScheme.dimension.smallFont))
        case .Done:
            Text(L.button_done.string).font(UIScheme.font.commonRegular(size: UIScheme.dimension.smallFont))
        case .Close:
            Text(L.button_close.string).font(UIScheme.font.commonRegular(size: UIScheme.dimension.smallFont))
        }
    }
}

#if DEBUG

import AVFoundation

struct PayButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            PayButton(label: PayButtonLabel(style: .Pay(100.50, currency: "RUB")), disabled: false) {
                AudioServicesPlaySystemSound(1016)
            }.padding()
            PayButton(label: PayButtonLabel(style: .Continue), disabled: true) {
                AudioServicesPlaySystemSound(1016)
            }.padding()
        }
    }
}

#endif
