//
//  ECPPaymentStatus.swift
//  ecommpaySDK
//
//  Created by Ivan Krapivev on 25.01.2022.
//  Copyright © 2022 Ecommpay. All rights reserved.
//

import Foundation

@objc public enum ECPPaymentStatus: Int {
    case Success = 0
    case Decline = 100
    case Cancelled = 301
    case Error = 501
    case Unknown = 20000
}

internal extension PaymentStatus {
    var publicStatus: ECPPaymentStatus {
        switch(self) {
        case .Success:
            return .Success
        case .Decline:
            return .Decline
        case .Cancelled:
            return .Cancelled
        case .Error:
            return .Error
        case .Unknown:
            return .Unknown
        }
    }
}

internal extension ECPPaymentStatus {
    var internalStatus: PaymentStatus {
        switch(self) {
        case .Success:
            return .Success
        case .Decline:
            return .Decline
        case .Cancelled:
            return .Cancelled
        case .Error:
            return .Error
        case .Unknown:
            return .Unknown
        }
    }
}
