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
    var onTap: () -> Void = {}

    var body: some View {
        iPaymentButton(type: .plain, style: .black) {
            onTap()
        }.cornerRadius(UIScheme.dimension.buttonCornerRadius)
    }
}

#if DEBUG
struct NativePaymentMethodView_Previews: PreviewProvider {
    static var previews: some View {
        ApplePayButton()
    }
}
#endif

/// A **payment button** 💵 wrapper view around Apple's PassKit `PKPaymentButton` ☑️
/// which allows the button to be drawn and rendered complely using SwiftUI. 🙌
public struct iPaymentButton: View {

    private var type: PKPaymentButtonType
    private var style: PKPaymentButtonStyle
    private var cornerRadius: CGFloat = 4.0
    private var action: () -> Void

    /// Creates a new payment button. 🏗👷‍♀️💰
    /// - Parameters:
    ///   - type: The **text** written on the button 🆒
    ///   - style: The **color** that the button should be 🎨
    ///   - action: The **action** to be performed when the user taps the button 🎬▶️
    public init(type: PKPaymentButtonType = .buy,
                style: PKPaymentButtonStyle = .black,
                action: @escaping () -> Void) {
        self.type = type
        self.style = style
        self.action = action
    }

    public var body: some View {
        Button(action: action, label: { EmptyView() })
            .buttonStyle(iPaymentButtonStyle(type: type, style: style, cornerRadius: cornerRadius))
    }
}

public extension iPaymentButton {
    /// Modifies the **corner radius** of the payment button. ⬛️⚫️
    ///
    /// To remove the rounded courners, set this value to 0.0. 0️⃣👌
    ///
    /// The default value is set to 4.0 🍀4️⃣
    /// - Parameter radius: The desired corner radius in points ⬜️⚪️
    /// - Returns: A payment button with the desired corner radius 📄
    func cornerRadius(_ radius: CGFloat) -> iPaymentButton {
        var view = self
        view.cornerRadius = radius
        return view
    }
}

private struct iPaymentButtonStyle: ButtonStyle {
    var type: PKPaymentButtonType
    var style: PKPaymentButtonStyle
    var cornerRadius: CGFloat
    func makeBody(configuration: Self.Configuration) -> some View {
        return iPaymentButtonHelper(type: type, style: style, cornerRadius: cornerRadius)
    }
}

private struct iPaymentButtonHelper: View {
    var type: PKPaymentButtonType
    var style: PKPaymentButtonStyle
    var cornerRadius: CGFloat
    var body: some View {
        iPaymentButtonRepresentable(type: type, style: style, cornerRadius: cornerRadius)
            .frame(height: UIScheme.dimension.applePayButtonHeight)
            .frame(maxWidth: .infinity)
    }
}

extension iPaymentButtonHelper {
    struct iPaymentButtonRepresentable: UIViewRepresentable {
        var type: PKPaymentButtonType
        var style: PKPaymentButtonStyle
        var cornerRadius: CGFloat

        var button: PKPaymentButton {
            let button = PKPaymentButton(paymentButtonType: type, paymentButtonStyle: style)
            button.cornerRadius = cornerRadius
            return button
        }

        func makeUIView(context: Context) -> PKPaymentButton {
            return button
        }
        func updateUIView(_ uiView: PKPaymentButton, context: Context) { }
    }
}
