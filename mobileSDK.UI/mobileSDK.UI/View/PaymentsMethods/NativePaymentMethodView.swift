//
//  NativePaymentMethodView.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 01.07.2022.
//

import SwiftUI

struct ApplePayButton: View {
    var body: some View {
        ZStack {
            Rectangle().cornerRadius(UIScheme.dimension.buttonCornerRadius, corners: .allCorners).foregroundColor(.black)
            IR.applePayButtonLogo.image
        }.frame(height: UIScheme.dimension.paymentMethodButtonHeight)
    }
}

struct NativePaymentMethodView_Previews: PreviewProvider {
    static var previews: some View {
        ApplePayButton()
    }
}

