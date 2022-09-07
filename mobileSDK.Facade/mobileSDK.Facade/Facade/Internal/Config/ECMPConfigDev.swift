//
//  ECMPConfigDev.swift
//  ecommpaySDK
//
//  Created by Ivan Krapivtsev on 08.02.2022.
//  Copyright © 2022 Ecommpay. All rights reserved.
//

import Foundation

typealias NetworkConfigType = ECMPConfigDev

struct ECMPConfigDev: NetworkConfig {
    var apiHost: String {
        "sdk.ecommpay.com"
    }

    var socketHost: String {
        "paymentpage.ecommpay.com"
    }
}
