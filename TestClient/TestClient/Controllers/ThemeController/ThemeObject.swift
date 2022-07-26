//
//  ThemeObject.swift
//  TestClient
//
//  Created by Deniss Kaibagarovs on 29/05/2019.
//  Copyright © 2019 Ecommpay. All rights reserved.
//

import Foundation

public enum ThemeObjectConstNames: String {
    case overlayColor = "overlayColor"
    case backgroundColor = "backgroundColor"
    case headingTextColor = "headingTextColor"
    case menuTextColor = "menuTextColor"
    case fieldTextColor = "fieldTextColor"
    case supportiveTextColor = "supportiveTextColor"
    case fieldPlaceholderTextColor = "fieldPlaceholderTextColor"
    case fieldImageTintColor = "fieldImageTintColor"
    case fieldTextCorrectColor = "fieldTextCorrectColor"
    case fieldTextWrongColor = "fieldTextWrongColor"
    case fieldBackgroundColor = "fieldBackgroundColor"
    case selectorColor = "selectorColor"
    case selectorBackgroundColor = "selectorBackgroundColor"
    case primaryTintColor = "primaryTintColor"
    case secondaryTintColor = "secondaryTintColor"
    case separatorColor = "separatorColor"
    case actionButtonDisableBackgroundColor = "actionButtonDisableBackgroundColor"
    case actionButtonDisableTextColor = "actionButtonDisableTextColor"
    case actionButtonTextColor = "actionButtonTextColor"

    case showShadow = "showShadow"
    case showDarkKeyboard = "showDarkKeyboard"
    case showDarkNavigationBar = "showDarkNavigationBar"
    case showLightLogo = "showLightLogo"
    case apsLogoOnly = "apsLogoOnly"
    case showLightAPSLogos = "showLightAPSLogos"
}

class ThemeObject {

    var name: String = ""
    var boolValue: Bool = false
    var isBoolValue: Bool = false

    init(name: String, isBoolValue: Bool = false, boolValue: Bool = false) {
        self.name = name
        self.isBoolValue = isBoolValue
        self.boolValue = boolValue
    }
}
