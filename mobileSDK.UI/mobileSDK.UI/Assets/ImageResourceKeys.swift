//
//  ImageResourceKeys.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 16.06.2022.
//

import SwiftUI

typealias IR = ImageResourceKeys

enum ImageResourceKeys: String {

    // MARK: Common
    case poweredByLogo
    case closeButton

    var image: Image? {
        return UIImage.getImage(name: self.rawValue)
    }
}

extension UIImage {
    static func getImage(name: String) ->Image? {
        return Image(name, bundle: SDKBundle.get())
    }
}
