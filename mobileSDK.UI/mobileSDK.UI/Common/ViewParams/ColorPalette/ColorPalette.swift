//
//  ColorPalette.swift
//  mobileSDK.UI
//
//  Created by Artem Serebrennikov on 22.02.2023.
//

import SwiftUI

protocol ColorPalette {
    var background: Color { get }
    var cardBackground: Color { get }
    
    // Brand
    var brandPrimary: Color { get }
    var brandSecondary: Color { get }
    
    // Input
    var inputNeutral: Color { get }
    var inputErrorBackground: Color { get }
    var inputErrorBorder: Color { get }
    var inputDisabled: Color { get }
    
    // Input/Text
    var inputTextPrimary: Color { get }
    var inputTextAdditional: Color { get }
    
    // Button
    var buttonText: Color { get }
    var buttonArrow: Color { get }
    var buttonBackground: Color { get }
    var buttonCard: Color { get }
    
    // Checkbox
    var checkboxSelectedBackground: Color { get }
    var checkboxUnselectedBackground: Color { get }
    var checkboxForeground: Color { get }
}
