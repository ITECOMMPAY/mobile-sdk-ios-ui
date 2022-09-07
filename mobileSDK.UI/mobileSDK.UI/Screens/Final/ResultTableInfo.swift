//
//  ResultTableInfo.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 10.08.2022.
//

import SwiftUI

struct ResultTableInfo: View {
    let resultInfoKeyValuePairs: [(key: String?, value: String?)]
    var body: some View {
        VStack(spacing: UIScheme.dimension.middleSpacing) {
            ForEach(resultInfoKeyValuePairs, id: \.key) { pair in
                if let key = pair.key, let value = pair.value {
                    HStack(alignment: .firstTextBaseline) {
                        Text(TranslationsManager.shared.stringValue(for: key) ?? key)
                            .font(UIScheme.font.commonRegular(size: UIScheme.dimension.smallFont))
                            .foregroundColor(UIScheme.color.secondaryText)
                        Spacer()
                        Text(value)
                            .font(UIScheme.font.commonRegular(size: UIScheme.dimension.smallFont))
                            .foregroundColor(UIScheme.color.text)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding([.top, .horizontal], UIScheme.dimension.largeSpacing)
        .padding(.bottom, UIScheme.dimension.smallSpacing)
        .background(UIScheme.color.panelBackgroundColor)
        .cornerRadius(UIScheme.dimension.backgroundSheetCornerRadius, corners: .allCorners)
    }
}

#if DEBUG

struct ResultTableInfo_Previews: PreviewProvider {
    static var previews: some View {
        ResultTableInfo(resultInfoKeyValuePairs: [
            ("Label1", "Value1"),
            ("Label2", "Value2"),
            ("Label3", "Value3")
        ])
        .previewLayout(.sizeThatFits)
    }
}

#endif
