//
//  PaymentMethod+Logo.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 03.08.2022.
//

import SwiftUI

extension PaymentMethod {
    var localLogo: Image? {
        switch self.methodType {
        case .card:
            return IR.bankCard.image
        case .applePay:
            return IR.applePay.image
        default:
            return IR(rawValue: self.code)?.image
        }
    }

    var serverLogo: AsyncImage<Image> {
        AsyncImage(url: self.iconUrl.flatMap { URL(string: $0) })
    }
}
