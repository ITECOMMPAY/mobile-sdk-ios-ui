//
//  LinkButton.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 15.07.2022.
//

import SwiftUI

struct LinkButton: View {
    let text: String
    var fontSize: AppFont.Size = .xs
    var foregroundColor: Color = UIScheme.color.brandPrimary
    var onTap: () -> Void = {}

    var body: some View {
        Button {
            onTap()
        } label: {
            Text(text)
                .font(.custom(.primary(size: fontSize, weight: .regular)))
                .underline()
                .foregroundColor(foregroundColor)
        }
    }
}

#if DEBUG

struct LinkButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LinkButton(text: "Blue", fontSize: .xs)
            LinkButton(text: "Red", fontSize: .l, foregroundColor: .red)
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}

#endif
