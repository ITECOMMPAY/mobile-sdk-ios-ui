//
//  ScreenDisplayMode.swift
//  ecommpaySDK
//
//  Created by Ivan Krapivtsev on 02.03.2022.
//  Copyright © 2022 Ecommpay. All rights reserved.
//

import Foundation

internal protocol ScreenDisplayModeConvertable {
    var internalScreenDisplayMode: ScreenDisplayMode { get }
}

enum ScreenDisplayMode: Int {
    case hideSuccessFinalPage
    case hideDeclineFinalPage
}
