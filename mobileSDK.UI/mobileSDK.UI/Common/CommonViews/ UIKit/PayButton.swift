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
            label
                .frame(maxWidth: .infinity, alignment: .center)
                .foregroundColor(.black)
        }
        .overlay(
            HStack {
                Spacer()
                ZStack {
                    Circle()
                        .fill(UIScheme.color.brandPrimary)
                        .frame(width: 36, height: 36)
                    Image(systemName: "arrow.right")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(UIScheme.isDarkTheme ? .black : .white)
                }
            }
            .padding(.trailing, 4)
        )
        .frame(height: UIScheme.dimension.payButtonHeight)
        .background(UIScheme.color.brandSecondary)
        .clipShape(.capsule)
        .opacity(disabled ? 0.3 : 1)
        .disabled(disabled)
        Button(
            action: action,
            label: {
                label.frame(maxWidth: .infinity)
                    .frame(height: UIScheme.dimension.payButtonHeight)
                    .foregroundColor(.black)
                    .background(UIScheme.color.brandSecondary.opacity(disabled ? 0.3 : 1))
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
                    .font(.custom(.primary(size: .m, weight: .bold)))
            }
        default:
            plainText
        }
    }
    
    var plainText: some View {
        Text(style.title)
            .font(.custom(.primary(size: .m, weight: .regular)))
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
