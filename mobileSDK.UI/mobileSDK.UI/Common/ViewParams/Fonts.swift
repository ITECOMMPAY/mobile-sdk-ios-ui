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
    
    init() {
        registerFonts()
    }
    
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


public let fontBundle = SDKBundle.get()

public func registerFonts() {
    UIFont.registerFont(bundle: fontBundle, fontName: "Inter-Regular", fontExtension: "ttf")
    UIFont.registerFont(bundle: fontBundle, fontName: "Inter-SemiBold", fontExtension: "ttf")
    UIFont.registerFont(bundle: fontBundle, fontName: "Inter-Bold", fontExtension: "ttf")
}

extension UIFont {
    static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) {

        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension) else {
            fatalError("Couldn't find font \(fontName)")
        }

        guard let fontDataProvider = CGDataProvider(url: fontURL as CFURL) else {
            fatalError("Couldn't load data from the font \(fontName)")
        }

        guard let font = CGFont(fontDataProvider) else {
            fatalError("Couldn't create font from data")
        }

        var error: Unmanaged<CFError>?
        CTFontManagerRegisterGraphicsFont(font, &error)
    }
}
