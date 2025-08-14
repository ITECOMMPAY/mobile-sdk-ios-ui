//
//  ImageResourceKeys.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 16.06.2022.
//

import SwiftUI

typealias IR = ImageResourceKeys

enum ImageResourceKeys: String {
    // MARK: Common
    case ecommpayLogo
    case poweredByLogo
    case closeButton
    case copyButton
    case chevron
    case infoButton
    case scanButton
    case backButton
    case loadingLogo
    case successLogo
    case errorLogo

    // MARK: Basic payment methods
    case bankCard
    case applePayButtonLogo
    case applePay
    case defaultApsLogo

    var image: Image? {
        return Image.getImage(name: self.rawValue)
    }

    var uiImage: UIImage? {
        UIImage(named: self.rawValue, in: SDKBundle.get(), compatibleWith: nil)
    }
}

extension Image {
    static func getImage(name: String) -> Image? {
        if UIScheme.color.isDarkTheme, let uiImage = UIImage(named: name + "Dark", in: SDKBundle.get(), compatibleWith: nil) {
            return Image(uiImage: uiImage)
        }
        
        if let uiImage = UIImage(named: name, in: SDKBundle.get(), compatibleWith: nil) {
            return Image(uiImage: uiImage)
        }
        return nil
    }
}
