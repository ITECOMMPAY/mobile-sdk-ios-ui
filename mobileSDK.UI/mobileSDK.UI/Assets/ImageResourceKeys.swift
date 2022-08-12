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
    case poweredByLogo
    case closeButton
    case copyButton
    case chevron
    case infoButton
    case backButton
    case loadingLogo
    case successLogo
    case errorLogo

    // MARK: Basic payment methods
    case bankCard
    case applePayButtonLogo
    case applePay

    var image: Image? {
        return Image.getImage(name: self.rawValue)
    }
}

extension Image {
    static func getImage(name: String) -> Image? {
        return Image(name, bundle: SDKBundle.get())
    }
}
