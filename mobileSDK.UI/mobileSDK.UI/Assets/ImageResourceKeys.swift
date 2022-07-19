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
    case copyButton
    case chevron
    case infoButton

    // MARK: Placeholders

    // MARK: Basic payment methods
    case bankCard
    case applePayButtonLogo

    // MARK: Payment methods icons
    case alipay
    case eps
    case neteller
    case sepa
    case weChat
    case applePay
    case giroPay
    case payPal
    case skrill
    case eWallet
    case bancontact
    case googlePay
    case przelewy24
    case sofort
    case iDeal
    case blik
    case multibanco
    case safetyPay
    case unionPay

    // MARK: Card networks
    case visa

    var image: Image? {
        return UIImage.getImage(name: self.rawValue)
    }
}

extension UIImage {
    static func getImage(name: String) ->Image? {
        return Image(name, bundle: SDKBundle.get())
    }
}
