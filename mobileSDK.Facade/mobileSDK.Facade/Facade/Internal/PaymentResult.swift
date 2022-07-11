//
//  PaymentResult.swift
//  ecommpaySDK
//
//  Created by Ivan Krapivev on 25.01.2022.
//  Copyright © 2022 Ecommpay. All rights reserved.
//

import Foundation

class PaymentResult {
    public let status: PaymentStatus
    public let error: Error?
    public let token: String?

    public init(status: PaymentStatus, error: Error?, token: String?) {
        self.status = status
        self.error = error
        self.token = token
    }

    public init(status: PaymentStatus, error: Error?) {
        self.status = status
        self.error = error
        self.token = nil
    }
}

enum PaymentStatus: Int {
    case Success = 0
    case Decline = 100
    case Cancelled = 200
    case Error = 500
    case Failed = 300
}
