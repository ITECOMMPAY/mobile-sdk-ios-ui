//
//  ThemeSetup.swift
//  TestClient
//
//  Created by Deniss Kaibagarovs on 28/05/2019.
//  Copyright © 2019 Ecommpay. All rights reserved.
//

import Foundation
import ecommpaySDK

@objc
class ThemeSetup: NSObject {
    
 @objc static let shared = ThemeSetup()
 @objc var theme:ECPTheme
 @objc var isDarkThemeOn:Bool = false
    
    private override init() {
        theme = ECPTheme.getLightTheme()
        super.init()
    }
}
