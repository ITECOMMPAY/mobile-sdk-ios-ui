//
//  Fonts.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 15.06.2022.
//

import SwiftUI

protocol FontLibrary {
    /// Шрифт заголовка экрана
    var screenHeader: Font { get }

    func commonRegular(size: CGFloat) -> Font
    func commonBold(size: CGFloat) -> Font
    func commonSemiBold(size: CGFloat) -> Font
}

struct DefaultFontLibrary: FontLibrary {
    let screenHeader: Font = Font.system(size: 22, weight: .bold, design: .default)

    func commonRegular(size: CGFloat) -> Font {
        return Font.system(size: size, weight: .regular, design: .default)
    }

    func commonBold(size: CGFloat) -> Font {
        return Font.system(size: size, weight: .bold, design: .default)
    }

    func commonSemiBold(size: CGFloat) -> Font {
        return Font.system(size: size, weight: .semibold, design: .default)
    }
}
