//
//  NetworkConfig.swift
//  ecommpaySDK
//
//  Created by Ivan Krapivev on 08.02.2022.
//  Copyright © 2022 Ecommpay. All rights reserved.
//

import UIKit

protocol NetworkConfig {
    var apiHost: String { get }
    var socketHost: String { get }
}
