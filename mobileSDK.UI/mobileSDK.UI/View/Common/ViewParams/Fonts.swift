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
}

struct DefaultFontLibrary: FontLibrary {
    let screenHeader: Font = Font.system(size: 22, weight: .bold, design: .default)
}
