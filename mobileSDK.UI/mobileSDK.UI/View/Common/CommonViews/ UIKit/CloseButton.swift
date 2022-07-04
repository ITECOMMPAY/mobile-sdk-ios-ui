//
//  CloseButton.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 27.06.2022.
//

import SwiftUI

struct CloseButton: View {
    var foregroundColor: Color = UIScheme.color.brandColor
    var onTap: () -> Void = {}

    var body: some View {
        Button {
            onTap()
        } label: {
            IR.closeButton.image?.renderingMode(.template)
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

struct CloseButton_Previews: PreviewProvider {
    static var previews: some View {
        CloseButton()
    }
}

#endif
