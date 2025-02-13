//
//  DarkPalette.swift
//  mobileSDK.UI
//
//  Created by Artem Serebrennikov on 22.02.2023.
//

import SwiftUI

protocol DarkPalette: ColorPalette { }

extension DarkPalette {
    var primary: Color {
        Color(hex: 0x4B007C)
    }

    var link: Color {
        Color(hex: 0x4299FF)
    }

    var neutral: Color {
        Color(hex: 0xFFFFFF)
    }

    var background: Color {
        Color(hex: 0x181826)
    }

    var container: Color {
        Color(hex: 0x27293D)
    }

    var accent: Color {
        Color(hex: 0x323757)
    }

    var highlight: Color {
        Color(hex: 0x3C3F5C)
    }

    var inputField: Color {
        Color(hex: 0x34374D)
    }

    var grey: Color {
        Color(hex: 0xA3A3A3)
    }

    var containerRed: Color {
        Color(hex: 0x4F1B21)
    }

    var red: Color {
        Color(hex: 0xDB1F35)
    }

    var mediumGrey: Color {
        Color(hex: 0x666980)
    }

    var containerGreen: Color {
        Color(hex: 0x003B0A)
    }

    var green: Color {
        Color(hex: 0x00CC24)
    }
}
