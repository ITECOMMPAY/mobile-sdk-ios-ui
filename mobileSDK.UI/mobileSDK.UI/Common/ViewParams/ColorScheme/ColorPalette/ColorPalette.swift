//
//  ColorPalette.swift
//  mobileSDK.UI
//
//  Created by Artem Serebrennikov on 22.02.2023.
//

import SwiftUI

protocol ColorPalette {
    /// Color as they are marked in Figma
    var primary: Color { get }
    var link: Color { get }
    var neutral: Color { get }

    var background: Color { get }
    var container: Color { get }
    var accent: Color { get }
    var highlight: Color { get }
    var inputField: Color { get }
    var grey: Color { get }

    var containerRed: Color { get }
    var red: Color { get }
    var mediumGrey: Color { get }

    var containerGreen: Color { get }
    var green: Color { get }

    /// Global colors
    var globalWhite: Color { get }
    var globalWhite60: Color { get }
    var globalWhite10: Color { get }

    var globalBlack: Color { get }
    var globalBlack80: Color { get }
    var globalBlack30: Color { get }
}

extension ColorPalette {
    var globalWhite: Color {
        .white
    }

    var globalWhite60: Color {
        .white.opacity(0.6)
    }

    var globalWhite10: Color {
        .white.opacity(0.1)
    }

    var globalBlack: Color {
        .black
    }

    var globalBlack80: Color {
        .black.opacity(0.8)
    }

    var globalBlack30: Color {
        .black.opacity(0.3)
    }
}
