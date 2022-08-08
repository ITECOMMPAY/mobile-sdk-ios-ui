//
//  View+Keyboard.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 03.08.2022.
//

import SwiftUI
import Combine

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
