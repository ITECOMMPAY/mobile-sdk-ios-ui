//
//  ImageResourceKeys.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 16.06.2022.
//

import SwiftUI

typealias IR = ImageResourceKeys

enum ImageResourceKeys: String {
    // Common
    case ecommpayLogo
    case poweredByLogo
    case closeButton
    case infoButton
    case scanButton
    case backButton
    case loadingLogo
    case successLogo
    case errorLogo
    case cardBackgroundPattern

    // Basic payment methods
    case bankCard
    case applePayButtonLogo
    case applePay
    case defaultApsLogo
    
    // Flags
    case flag

    var image: Image? {
        if self == .flag {
            return Image.getImage(name: "flags/\(Locale.current.languageCode ?? "en")")
        }
        
        return Image.getImage(name: self.rawValue)
    }

    var uiImage: UIImage? {
        if self == .flag {
            return UIImage(
                named: "flags/\(Locale.current.languageCode ?? "en")",
                in: SDKBundle.get(),
                compatibleWith: nil
            )
        }
        
        return UIImage(
            named: self.rawValue,
            in: SDKBundle.get(),
            compatibleWith: nil
        )
    }
}

extension Image {
    static func getImage(name: String) -> Image? {
        if UIScheme.color.isDarkTheme,
           let uiImage = UIImage(named: name + "Dark", in: SDKBundle.get(), compatibleWith: nil) {
            return Image(uiImage: uiImage)
        }
        
        if let uiImage = UIImage(named: name, in: SDKBundle.get(), compatibleWith: nil) {
            return Image(uiImage: uiImage)
        }
        
        return nil
    }
}
