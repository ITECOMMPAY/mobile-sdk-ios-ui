//
//  InfoButton.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 18.07.2022.
//

import SwiftUI

struct InfoButton: View {
    var foregroundColor: Color = UIScheme.color.brandColor
    var onTap: () -> Void = {}

    var body: some View {
        Button {
            onTap()
        } label: {
            IR.infoButton.image
        }.contentShape(Rectangle())
    }
}

#if DEBUG

struct InfoButton_Previews: PreviewProvider {
    static var previews: some View {
        InfoButton()
    }
}

#endif
