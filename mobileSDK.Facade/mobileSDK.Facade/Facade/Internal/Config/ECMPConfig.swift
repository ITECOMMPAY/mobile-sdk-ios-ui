//
//  ECMPConfig.swift
//  ecommpaySDK
//
//  Created by Виталий Морозов on 09.09.2021.
//  Copyright © 2021 Ecommpay. All rights reserved.
//

import Foundation

typealias NetworkConfigType = ECMPConfig

struct ECMPConfig: NetworkConfig {
    var apiHost: String {
        "sdk.ecommpay.com"
    }

    var socketHost: String {
        "paymentpage.ecommpay.com"
    }
}
