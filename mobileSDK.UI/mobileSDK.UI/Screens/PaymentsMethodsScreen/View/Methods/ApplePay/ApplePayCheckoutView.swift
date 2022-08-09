//
//  ApplePayCheckoutView.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 18.07.2022.
//

import SwiftUI

struct ApplePayCheckoutView: View {
    // let additionalFieldsView: EmbeddedCustomerFieldsView?

    var body: some View {
        VStack(spacing: 0) {
            // TODO: embed additional fields
            /*
             additionalFieldsView
            .padding(.top, UIScheme.dimension.formSmallSpacing)
             */
            ApplePayButton()
                .padding(.vertical, UIScheme.dimension.formLargeVerticalSpacing)
        }.padding([.leading, .trailing], UIScheme.dimension.middleSpacing)
    }
}

#if DEBUG

struct ApplePayCheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        ApplePayCheckoutView()
    }
}

#endif
