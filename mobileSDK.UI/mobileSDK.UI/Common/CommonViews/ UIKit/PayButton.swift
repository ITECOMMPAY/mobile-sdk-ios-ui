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
        case Tokenize
        case Proceed
        case TryAgain
        case Done
        case Close
        
        var title: String {
            switch self {
            case .Pay: return "Pay"
            case .Continue: return L.button_confirmation.string
            case .Tokenize: return L.button_tokenize.string
            case .Proceed: return L.button_proceed.string
            case .TryAgain: return L.button_try_again.string
            case .Done: return L.button_done.string
            case .Close: return L.button_close.string
            }
        }
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
                plainText
                Text("\(amount as NSDecimalNumber, formatter: numberFormatter) \(currency)").font(UIScheme.font.commonBold(size: UIScheme.dimension.smallFont))
            }
        default: plainText
        }
    }
    
    var plainText: some View {
        Text(style.title).font(UIScheme.font.commonRegular(size: UIScheme.dimension.middleFont))
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
