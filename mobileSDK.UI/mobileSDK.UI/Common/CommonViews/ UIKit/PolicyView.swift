//
//  PolicyView.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 15.07.2022.
//

import SwiftUI

struct PolicyView: View {
    var privacyPolicyLink = L.footer_privacy_policy.translationWithLink
    var cookiePolicyLink = L.footer_cookie_policy.translationWithLink

    var body: some View {
        HStack(spacing: UIScheme.dimension.middleSpacing) {
            LinkButton(text: privacyPolicyLink?.message ?? L.footer_privacy_policy.rawValue,
                       fontSize: UIScheme.dimension.tinyFont) {
                guard let urlStr = privacyPolicyLink?.links?.first?.url,
                      let url = URL(string: urlStr)
                else { return }
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
            Circle().frame(width: 3, height: 3)
                .foregroundColor(UIScheme.color.minorShapesColor)
            LinkButton(text: cookiePolicyLink?.message ?? L.footer_cookie_policy.rawValue,
                       fontSize: UIScheme.dimension.tinyFont) {
                guard let urlStr = cookiePolicyLink?.links?.first?.url,
                      let url = URL(string: urlStr)
                else { return }
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
}

#if DEBUG

struct PolicyView_Previews: PreviewProvider {
    static var previews: some View {
        PolicyView().previewLayout(.sizeThatFits)
    }
}

#endif
