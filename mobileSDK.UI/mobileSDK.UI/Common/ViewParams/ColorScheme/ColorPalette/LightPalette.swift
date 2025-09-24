//
//  LightPalette.swift
//  mobileSDK.UI
//
//  Created by Artem Serebrennikov on 22.02.2023.
//

import SwiftUI

protocol LightPalette: ColorPalette { }

extension LightPalette {
    var primary: Color {
        Color(hex: 0x4B007C)
    }
    
    var secondary: Color {
        Color(hex: 0xCAB2FF)
    }

    var link: Color {
        Color(hex: 0x00579E)
    }

    var neutral: Color {
        Color(hex: 0x000000)
    }

    var background: Color {
        Color(hex: 0xF0F1F3)
    }

    var container: Color {
        Color(hex: 0xE0E0E0)
    }

    var accent: Color {
        Color(hex: 0xF2F6FA)
    }

    var highlight: Color {
        Color(hex: 0xEBEBEE)
    }

    var inputField: Color {
        Color(hex: 0xF6F7F9)
    }

    var grey: Color {
        Color(hex: 0x666666)
    }

    var containerRed: Color {
        Color(hex: 0xF8EAEA)
    }

    var red: Color {
        Color(hex: 0xC03230)
    }

    var mediumGrey: Color {
        Color(hex: 0xBCBDBE)
    }

    var containerGreen: Color {
        Color(hex: 0xEBFBEE)
    }

    var green: Color {
        Color(hex: 0x00CC24)
    }
}
