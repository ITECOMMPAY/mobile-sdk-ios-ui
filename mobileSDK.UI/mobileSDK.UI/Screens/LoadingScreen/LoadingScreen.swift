//
//  LoadingScreen.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 09.08.2022.
//

import Foundation
import SwiftUI

struct LoadingScreen: View {
    public var body: some View {
        VStack {
            Spacer()
            VStack(spacing: UIScheme.dimension.middleSpacing) {
                IR.loadingIcon.image.padding(.bottom, UIScheme.dimension.middleSpacing)
                Text(L.title_loading_screen.string)
                    .font(UIScheme.font.commonRegular(size: UIScheme.dimension.biggerFont))
                    .foregroundColor(UIScheme.color.text)
                Text(L.sub_title_loading_screen.string)
                    .font(UIScheme.font.commonRegular(size: UIScheme.dimension.smallFont))
                    .foregroundColor(UIScheme.color.text)
            }
            Spacer()
            FooterView().padding(.bottom, UIScheme.dimension.largeSpacing)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, UIScheme.dimension.largeSpacing)
    }
}
