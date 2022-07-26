//
//  ECPPaymentResult.swift
//  ecommpaySDK
//
//  Created by Ecommpay on 12/04/2019.
//  Copyright © 2019 Ecommpay. All rights reserved.
//

import Foundation

public class ECPPaymentResult: NSObject {
    @objc public let status: ECPPaymentStatus
    @objc public let error: Error?
    @objc public let token: String?

    public init(status: ECPPaymentStatus, error: Error?, token: String?) {
        self.status = status
        self.error = error
        self.token = token

        super.init()
    }

    public init(status: ECPPaymentStatus, error: Error?) {
        self.status = status
        self.error = error
        self.token = nil

        super.init()
    }
}

internal extension ECPPaymentResult {
    convenience init(internalResult: PaymentResult) {
        self.init(status: internalResult.status.publicStatus,
                  error: internalResult.error,
                  token: internalResult.token)
    }
}
