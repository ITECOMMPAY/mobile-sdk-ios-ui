//
//  View+BackgroundOverlay.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 23.06.2022.
//

import SwiftUI

@available(iOS, deprecated: 15.0, message: "Use the built-in APIs instead")
extension View {
    func background<T: View>(
        alignment: Alignment = .center,
        @ViewBuilder content: () -> T
    ) -> some View {
        background(Group(content: content), alignment: alignment)
    }
}
