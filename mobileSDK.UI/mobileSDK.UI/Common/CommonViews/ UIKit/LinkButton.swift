//
//  LinkButton.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 15.07.2022.
//

import SwiftUI

struct LinkButton: View {
    let text: String
    var fontSize: CGFloat = UIScheme.dimension.tinyFont
    var foregroundColor: Color = UIScheme.color.primaryBrandColor
    var onTap: () -> Void = {}

    var body: some View {
        Button {
            onTap()
        } label: {
            Text(text)
                .font(UIScheme.font.commonRegular(size: fontSize))
                .underline()
                .foregroundColor(foregroundColor)
        }
    }
}

#if DEBUG

struct LinkButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LinkButton(text: "Blue", fontSize: UIScheme.dimension.tinyFont)
            LinkButton(text: "Red", fontSize: 22, foregroundColor: .red)
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}

#endif
