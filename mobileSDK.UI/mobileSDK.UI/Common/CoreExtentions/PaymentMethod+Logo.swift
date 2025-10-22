//
//  PaymentMethod+Logo.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 03.08.2022.
//

import SwiftUI

extension PaymentMethod {
    var localLogo: Image? {
        switch self.methodType {
        case .card:
            return IR.card.image?
                .renderingMode(.template)
        case .applePay:
            return IR.applePay.image?
                .renderingMode(.original)
        default:
            return Image.getImage(name: self.code)?
                .renderingMode(.original)
        }
    }
}
