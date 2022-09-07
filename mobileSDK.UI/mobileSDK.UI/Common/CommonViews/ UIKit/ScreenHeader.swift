//
//  ScreenHeader.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 27.06.2022.
//

import SwiftUI

struct ScreenHeader: View {
    let text: String
    var body: some View {
        Text(text)
            .foregroundColor(UIScheme.color.screenHeader)
            .font(UIScheme.font.screenHeader)
            .frame(alignment: .leading)
    }
}

#if DEBUG

struct ScreenHeader_Previews: PreviewProvider {
    static var previews: some View {
        ScreenHeader(text: "Header")
    }
}

#endif
