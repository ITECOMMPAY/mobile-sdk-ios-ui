//
//  NativePaymentMethodView.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 01.07.2022.
//

import UIKit
import PassKit
import SwiftUI

struct ApplePayButton: View {
    let onTap: () -> Void

    var body: some View {
        if #available(iOS 18.0, *) {
            createApplePayButton(onTap)
        } else {
            Button {
                onTap()
            } label: {
                createApplePayButton()
            }
        }
    }

    func createApplePayButton(_ action: (() -> Void)? = nil) -> some View {
        iPaymentButtonRepresentable(
            type: .plain,
            style: UIScheme.color.applePayButtonStyle,
            cornerRadius: UIScheme.dimension.buttonCornerRadius,
            action: action
        )
        .frame(height: UIScheme.dimension.applePayButtonHeight)
        .frame(maxWidth: .infinity)
    }
}

#if DEBUG
struct NativePaymentMethodView_Previews: PreviewProvider {
    static var previews: some View {
        ApplePayButton(onTap: {})
    }
}
#endif

struct iPaymentButtonRepresentable: UIViewRepresentable {
    var type: PKPaymentButtonType
    var style: PKPaymentButtonStyle
    var cornerRadius: CGFloat
    var action: (() -> Void)?

    func makeUIView(context: Context) -> PKPaymentButton {
        let button = PKPaymentButton(paymentButtonType: type, paymentButtonStyle: style)
        button.cornerRadius = cornerRadius
        if let action {
            button.addAction(UIAction(handler: { _ in action() }), for: .touchUpInside)
        }
        return button
    }

    func updateUIView(_ button: PKPaymentButton, context: Context) {}
}
