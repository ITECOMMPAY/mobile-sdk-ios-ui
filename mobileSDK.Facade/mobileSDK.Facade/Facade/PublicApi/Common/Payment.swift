//
//  Payment.swift
//  ecommpaySDK
//
//  Created by Ivan Krapivev on 28.01.2022.
//  Copyright © 2022 Ecommpay. All rights reserved.
//

import Foundation

@objcMembers public class Payment: NSObject, Codable {
    public var status: String?
    public var type: String?
    public var id: String?
    public var date: String?
    public var method: String?
    public var sum: String?
    public var currency: String?
}
