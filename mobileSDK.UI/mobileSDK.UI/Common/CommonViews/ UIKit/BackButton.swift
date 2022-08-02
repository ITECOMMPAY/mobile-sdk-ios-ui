//
//  BackButton.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 02.08.2022.
//

import SwiftUI

// TODO: create base struct for this kind of buttons
struct BackButton: View {
    var foregroundColor: Color = UIScheme.color.brandColor
    var onTap: () -> Void = {}

    var body: some View {
        Button {
            onTap()
        } label: {
            IR.backButton.image?.renderingMode(.template)
                .foregroundColor(foregroundColor)
        }.contentShape(
            Rectangle()
                .scale(x: UIScheme.dimension.minimumTapAreaSize,
                       y: UIScheme.dimension.minimumTapAreaSize,
                       anchor: UnitPoint.center).offset(x: -10, y: 0)
        )
    }
}

#if DEBUG

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton()
    }
}

#endif
