//
//  FooterView.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 27.06.2022.
//

import SwiftUI

struct FooterView: View {
    
    let footerImage: Image?
    
    var body: some View {
        if (footerImage != nil) {
            footerImage.frame(height: UIScheme.dimension.paymentOverviewSpacing)
                .accessibilityHidden(true)
        } else {
            IR.poweredByLogo.image?
                .frame(height: UIScheme.dimension.paymentOverviewSpacing)
                .accessibilityHidden(true)
        }
        
    }
}

#if DEBUG

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView(footerImage: nil).previewLayout(.sizeThatFits)
    }
}

#endif
