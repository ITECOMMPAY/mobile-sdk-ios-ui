//
//  Fonts.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 15.06.2022.
//

import SwiftUI

enum AppFont {
    enum Size: CGFloat {
        /// **12**
        case xs = 12
        /// **14**
        case s = 14
        /// **16**
        case m = 18
        /// **22**
        case l = 22
        /// **24**
        case xl = 24
        /// **28**
        case xxl = 34
    }
    
    enum PrimaryFontWeight {
        case regular
        case semiBold
        case bold
        
        var fontName: String {
            switch self {
            case .regular: 
                return "Inter-Regular"
            case .semiBold: 
                return "Inter-SemiBold"
            case .bold:
                return "Inter-Bold"
            }
        }
    }
    
    enum SecondaryFontWeight {
        case bold
        
        var fontName: String {
            switch self {
            case .bold:
                return "SohneBreit-Kraftig"
            }
        }
    }
    
    case primary(size: Size, weight: PrimaryFontWeight)
    case secondary(size: Size, weight: SecondaryFontWeight)
    
    static func registerIfNeeded() {
        let bundle = SDKBundle.get()
        print(UIFont.familyNames.sorted())
        UIFont.registerFontIfNeeded(bundle: bundle, fontName: "Inter-Regular", fontExtension: "ttf")
        UIFont.registerFontIfNeeded(bundle: bundle, fontName: "Inter-SemiBold", fontExtension: "ttf")
        UIFont.registerFontIfNeeded(bundle: bundle, fontName: "Inter-Bold", fontExtension: "ttf")
        UIFont.registerFontIfNeeded(bundle: bundle, fontName: "SohneBreit-Kraftig", fontExtension: "otf")
    }
}

extension Font {
    static func custom(_ font: AppFont) -> Font {
        AppFont.registerIfNeeded()
        
        switch font {
        case let .primary(size, weight):
            return .custom(weight.fontName, size: size.rawValue)
        case let .secondary(size, weight):
            return .custom(weight.fontName, size: size.rawValue)
        }
    }
}

extension UIFont {
    static func custom(_ font: AppFont) -> UIFont {
        AppFont.registerIfNeeded()
        
        switch font {
        case let .primary(size, weight):
            return UIFont(name: weight.fontName, size: size.rawValue) ?? .systemFont(ofSize: size.rawValue)
        case let .secondary(size, weight):
            return UIFont(name: weight.fontName, size: size.rawValue) ?? .systemFont(ofSize: size.rawValue)
        }
    }
}

private extension UIFont {
    static func registerFontIfNeeded(bundle: Bundle, fontName: String, fontExtension: String) {
        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
              let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(fontDataProvider),
              !isFontRegistered(fontName)
        else {
            return
        }
        
        var error: Unmanaged<CFError>?
        CTFontManagerRegisterGraphicsFont(font, &error)
    }
    
    private static func isFontRegistered(_ fontName: String) -> Bool {
        let font = CTFontCreateWithName(fontName as CFString, 12, nil)
        let registeredFontName = CTFontCopyPostScriptName(font) as String
        return registeredFontName == fontName
    }
}
