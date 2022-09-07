//
//  Binding+didSet.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 09.08.2022.
//

import SwiftUI

extension Binding {
    func didSet(_ didSet: @escaping (Value) -> Void) -> Binding<Value> {
        Binding(
            get: { wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                didSet(newValue)
            }
        )
    }
}
