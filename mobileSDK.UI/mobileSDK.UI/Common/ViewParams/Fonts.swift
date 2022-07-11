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
    /// Шрифт основного размера и обычного начертания
    var commonRegular: Font { get }
    /// Шрифт основного размера и полужирного начертания
    var commonSemiBold: Font { get }
    /// 28 pt Bold
    var priceValueFont: Font { get }
    /// 16 pt Regular
    var priceCurrencyFont: Font { get }
}

struct DefaultFontLibrary: FontLibrary {
    let screenHeader: Font = Font.system(size: 22, weight: .bold, design: .default)
    let commonRegular: Font = Font.system(size: 14, weight: .regular, design: .default)
    let commonSemiBold: Font = Font.system(size: 14, weight: .semibold, design: .default)
    let priceValueFont: Font = Font.system(size: 28, weight: .bold, design: .default)
    let priceCurrencyFont: Font = Font.system(size: 16, weight: .regular, design: .default)
}
