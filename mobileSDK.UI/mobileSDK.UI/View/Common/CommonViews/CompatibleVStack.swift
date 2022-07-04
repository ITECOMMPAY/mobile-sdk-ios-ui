//
//  CompatibleVStack.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 01.07.2022.
//

import SwiftUI

struct CompatibleVStack<Content> : View where Content : View {
    let alignment: HorizontalAlignment
    let spacing: CGFloat?
    let content: () -> Content

    init(alignment: HorizontalAlignment = .center, spacing: CGFloat? = nil,
         @ViewBuilder content: @escaping () -> Content) {
        self.alignment = alignment
        self.spacing = spacing
        self.content = content
    }

    var body: some View {
        Group {
            if #available(iOS 14, *) { // << add more platforms if needed
                LazyVStack(alignment: alignment, spacing: spacing, pinnedViews: [], content:content)
            } else {
                VStack(alignment: alignment, spacing: spacing, content:content)
            }
        }
    }
}
