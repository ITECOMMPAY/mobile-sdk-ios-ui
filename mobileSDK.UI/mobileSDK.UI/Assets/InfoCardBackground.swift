//
//  InfoCardBackground.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 06.07.2022.
//

import Foundation
import SwiftUI

public enum InfoCardBackground: String {
    case lines
    case waves

    internal var image: Image? {
        return Image.getImage(name: self.rawValue)
    }
}
