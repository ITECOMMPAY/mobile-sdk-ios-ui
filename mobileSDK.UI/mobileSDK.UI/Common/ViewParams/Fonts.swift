//
//  Fonts.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 15.06.2022.
//

import SwiftUI

protocol FontLibrary {
    /// Шрифт заголовка экрана
    var screenHeader: Font { get }

    func commonRegular(size: CGFloat) -> Font
    func commonBold(size: CGFloat) -> Font
    func commonSemiBold(size: CGFloat) -> Font

    func commonRegular(size: CGFloat) -> UIFont
}

struct DefaultFontLibrary: FontLibrary {
    let screenHeader: Font = Font.custom("Inter-Bold", size: 22)

    func commonRegular(size: CGFloat) -> Font {
        return Font.custom("Inter-Regular", size: size)
    }

    func commonBold(size: CGFloat) -> Font {
        return Font.custom("Inter-Bold", size: size)
    }

    func commonSemiBold(size: CGFloat) -> Font {
        print("AAA: \(UIFont.familyNames)")
        return Font.custom("Inter-SemiBold", size: size)
    }

    func commonRegular(size: CGFloat) -> UIFont {
        return UIFont(name: "Inter-Regular", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
}

