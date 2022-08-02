//
//  ApplePayCheckoutView.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 18.07.2022.
//

import SwiftUI

struct ApplePayCheckoutView: View {
    let additionalFieldsView: EmbeddedFieldView?

    var body: some View {
        VStack(spacing: 0) {
            additionalFieldsView
            .padding(.top, UIScheme.dimension.formSmallSpacing)
            .padding(.bottom, UIScheme.dimension.formLargeVerticalSpacing)

            ApplePayButton()
                .padding(.bottom, UIScheme.dimension.formLargeVerticalSpacing)
        }.padding([.leading, .trailing], UIScheme.dimension.middleSpacing)
    }
}

#if DEBUG

struct ApplePayCheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        ApplePayCheckoutView(additionalFieldsView: nil)
    }
}

#endif
