//
//  CloseButton.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 27.06.2022.
//

import SwiftUI

struct CloseButton: View {
    var foregroundColor: Color = UIScheme.color.inputTextPrimary
    var onTap: () -> Void = {}

    var body: some View {
        Button {
            onTap()
        } label: {
            IR.closeButton.image?.renderingMode(.template)
                .foregroundColor(foregroundColor)
        }
        .accessibilityLabel(Text("Close"))
    }
}

#if DEBUG

struct CloseButton_Previews: PreviewProvider {
    static var previews: some View {
        CloseButton()
    }
}

#endif
