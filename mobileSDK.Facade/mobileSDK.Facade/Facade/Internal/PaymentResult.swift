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
