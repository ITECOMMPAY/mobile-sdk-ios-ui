//
//  NativePaymentMethodView.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 01.07.2022.
//

import SwiftUI

struct ApplePayButton: View {
    var onTap: () -> Void = {}

    var body: some View {
        Button {
            onTap()
        } label: {
            ZStack {
                Rectangle().cornerRadius(UIScheme.dimension.buttonCornerRadius, corners: .allCorners).foregroundColor(.black)
                IR.applePayButtonLogo.image
            }.frame(height: UIScheme.dimension.paymentMethodButtonHeight)
        }
    }
}

#if DEBUG
struct NativePaymentMethodView_Previews: PreviewProvider {
    static var previews: some View {
        ApplePayButton()
    }
}
#endif
