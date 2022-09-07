//
//  Conditional.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 29.06.2022.
//

import SwiftUI

extension View {
    @ViewBuilder
    func applyIf<Content: View>(_ conditional: Bool, content: (Self) -> Content) -> some View {
        if conditional {
            content(self)
        } else {
            self
        }
    }

    @ViewBuilder
    func apply<Content: View>(content: (Self) -> Content) -> some View {
        content(self)
    }
}
