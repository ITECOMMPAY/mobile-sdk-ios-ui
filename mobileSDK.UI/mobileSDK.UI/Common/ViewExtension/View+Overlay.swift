//
//  View+Overlay.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 23.06.2022.
//

import SwiftUI

@available(iOS, deprecated: 15.0, message: "Use the built-in APIs instead")
extension View {
    func overlay<T: View>(
        alignment: Alignment = .center,
        @ViewBuilder content: () -> T
    ) -> some View {
        overlay(Group(content: content), alignment: alignment)
    }
}
