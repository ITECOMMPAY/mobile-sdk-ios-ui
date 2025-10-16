//
//  Utils.swift
//  TestClient
//
//  Created by Etoedto on 8/10/18.
//  Copyright © 2018 Etoedto. All rights reserved.
//

import UIKit

class Utils: NSObject {
    class func signature(paramsToSign: String, secret: String) -> String {
        return paramsToSign.sha512(secret: secret)!.base64EncodedString()
    }
}
