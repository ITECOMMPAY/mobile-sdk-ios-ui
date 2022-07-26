//
//  ThreeDSecureVO.swift
//  TestClient
//
//  Created by Виталий Морозов on 30.04.2020.
//  Copyright © 2020 Ecommpay. All rights reserved.
//

import Foundation

class ThreeDSecureVO: NSObject {
    var type: String = ""
    var json: String?
    var defaultJson: String = ""

    @objc(type:defaultJson:)
    public init(type: String, defaultJson: String) {
        self.type = type
        self.defaultJson = defaultJson
    }
}
