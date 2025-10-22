//
//  UIScheme.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 14.06.2022.
//

import Foundation

class UIScheme {
    static let underlinedLinks: Bool = true
    static let countOfVisibleCustomerFields = 3
    static let dimension: DimensionScheme = DefaultDimensionScheme()
    static var color: ColorPalette = LightPalette()
    static var isDarkTheme: Bool {
        color is DarkPalette
    }
}
