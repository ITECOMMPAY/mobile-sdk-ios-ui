//
//  PaymentResult.swift
//  ecommpaySDK
//
//  Created by Ivan Krapivtsev on 25.01.2022.
//  Copyright © 2022 Ecommpay. All rights reserved.
//

import Foundation
import mobileSDK_UI
import MsdkCore

@objcMembers public class PaymentResult: NSObject {
    public let status: PaymentStatus
    public let error: mobileSDK_UI.CoreError?
    public let payment: MsdkCore.Payment?

    init(status: PaymentStatus, error: CoreError? = nil, payment: MsdkCore.Payment? = nil) {
        self.status = status
        self.error = error
        self.payment = payment
    }
}

@objc public enum PaymentStatus: Int {
    case Success = 0
    case Decline = 100
    case Cancelled = 200
    case Error = 500
    case Failed = 300
}
