//
//  LightPalette.swift
//  mobileSDK.UI
//
//  Created by Artem Serebrennikov on 22.02.2023.
//

import SwiftUI

struct LightPalette: ColorPalette {
    var background: Color
    var cardBackground: Color
    var brandPrimary: Color
    var brandSecondary: Color
    var inputNeutral: Color
    var inputErrorBackground: Color
    var inputErrorBorder: Color
    var inputDisabled: Color
    var inputTextPrimary: Color
    var inputTextAdditional: Color
    var buttonText: Color
    var buttonArrow: Color
    var buttonBackground: Color
    var buttonCard: Color
    var checkboxSelectedBackground: Color
    var checkboxUnselectedBackground: Color
    var checkboxForeground: Color
    
    init(brandPrimary: Color? = nil, brandSecondary: Color? = nil) {
        self.background = Color(hex: 0xF0F1F3)
        self.cardBackground = Color(hex: 0xFFFFFF)
        self.brandPrimary = brandPrimary ?? Color(hex: 0x4B007C)
        self.brandSecondary = brandSecondary ?? Color(hex: 0xCAB2FF)
        self.inputNeutral = Color(hex: 0xEEEEEE)
        self.inputErrorBackground = Color(hex: 0xFFE4E1)
        self.inputErrorBorder = Color(hex: 0xCF0022)
        self.inputDisabled = Color(hex: 0x000000).opacity(0.04)
        self.inputTextPrimary = Color(hex: 0x000000)
        self.inputTextAdditional = Color(hex: 0x666666)
        self.buttonText = Color(hex: 0x000000)
        self.buttonArrow = Color(hex: 0xFFFFFF)
        self.buttonBackground = Color(hex: 0xCAB2FF)
        self.buttonCard = Color(hex: 0xFFFFFF)
        self.checkboxSelectedBackground = brandPrimary ?? Color(hex: 0x4B007C)
        self.checkboxUnselectedBackground = Color(hex: 0xF7F7F7)
        self.checkboxForeground = Color(hex: 0xFFFFFF)
    }
}
