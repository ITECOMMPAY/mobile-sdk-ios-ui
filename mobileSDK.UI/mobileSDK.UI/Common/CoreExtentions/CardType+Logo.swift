//
//  CardType+Logo.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 22.08.2022.
//

import SwiftUI

extension CardType {
    var localLogo: Image? {
        Image.getImage(name: "card_\(rawValue)")
    }
}
