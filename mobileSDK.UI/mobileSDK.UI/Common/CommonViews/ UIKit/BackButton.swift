//
//  BackButton.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 02.08.2022.
//

import SwiftUI

struct BackButton: View {
    var foregroundColor: Color = UIScheme.color.navigationButtonColor
    var onTap: () -> Void = {}

    var body: some View {
        Button {
            onTap()
        } label: {
            IR.backButton.image?.renderingMode(.template)
                .foregroundColor(foregroundColor)
        }
        .accessibilityLabel(Text("Back"))
    }
}

#if DEBUG

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton()
    }
}

#endif
