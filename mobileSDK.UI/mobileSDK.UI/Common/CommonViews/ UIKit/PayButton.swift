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
        Button(action: action) {
            HStack {
                label
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.black)
                ZStack {
                    Circle()
                        .fill(UIScheme.color.primaryBrandColor)
                        .frame(width: 36, height: 36)
                    Image(systemName: "chevron.right")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                }
            }
        }
        .frame(height: UIScheme.dimension.payButtonHeight)
        .background(
            disabled
                ? UIScheme.color.primaryBrandColor.opacity(0.3)
                : UIScheme.color.primaryBrandColor
        )
        .clipShape(.capsule)
        .disabled(disabled)
        Button(
            action: action,
            label: {
                label.frame(maxWidth: .infinity)
                    .frame(height: UIScheme.dimension.payButtonHeight)
                    .foregroundColor(.black)
                    .background(
                        disabled
                            ? UIScheme.color.primaryBrandColor.opacity(0.3)
                            : UIScheme.color.primaryBrandColor
                    )
                    .clipShape(.capsule)
            }
        )
        .disabled(disabled)
    }
}

struct PayButtonLabel: View {
    enum Style {
        case pay(amount: Decimal, currency: String)
        case `continue`
        case tokenize
        case verify
        case proceed
        case tryAgain
        case done
        case close
        
        var title: String {
            switch self {
            case .pay: return L.button_pay.string
            case .continue: return L.button_confirmation.string
            case .tokenize: return L.button_tokenize.string
            case .verify: return L.button_authorize.string
            case .proceed: return L.button_proceed.string
            case .tryAgain: return L.button_try_again.string
            case .done: return L.button_done.string
            case .close: return L.button_close.string
            }
        }
    }

    let style: Style

    var body: some View {
        switch style {
        case let .pay(amount, currency):
            let numberFormatter = { () -> NumberFormatter in
                let formatter = NumberFormatter()
                formatter.maximumFractionDigits = 2
                formatter.minimumFractionDigits = 2
                return formatter
            }()
            HStack(spacing: UIScheme.dimension.payButtonPayPriceSpacing) {
                plainText
                Text("\(currency) \(amount as NSDecimalNumber, formatter: numberFormatter)")
                    .font(UIScheme.font.commonBold(size: UIScheme.dimension.middleFont))
            }
        default:
            plainText
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
            PayButton(
                label: PayButtonLabel(style: .pay(amount: 100.50, currency: "RUB")),
                disabled: false
            ) {
                AudioServicesPlaySystemSound(1016)
            }
            .padding()
            PayButton(
                label: PayButtonLabel(style: .continue),
                disabled: true
            ) {
                AudioServicesPlaySystemSound(1016)
            }
            .padding()
        }
    }
}

#endif
