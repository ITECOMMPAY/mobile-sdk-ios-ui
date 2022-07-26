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
    case Cancelled = 200
    case Error = 500
    case Failed = 300
}

internal extension PaymentStatus {
    var publicStatus: ECPPaymentStatus {
        switch self {
        case .Success:
            return .Success
        case .Decline:
            return .Decline
        case .Cancelled:
            return .Cancelled
        case .Error:
            return .Error
        case .Failed:
            return .Failed
        }
    }
}

internal extension ECPPaymentStatus {
    var internalStatus: PaymentStatus {
        switch self {
        case .Success:
            return .Success
        case .Decline:
            return .Decline
        case .Cancelled:
            return .Cancelled
        case .Error:
            return .Error
        case .Failed:
            return .Failed
        }
    }
}
