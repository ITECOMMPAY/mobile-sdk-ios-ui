//
//  PaymentResult.swift
//  mglwalletSDK
//
//  Created by Ivan Krapivtsev on 25.01.2022.
//  Copyright © 2022 Mglwallet. All rights reserved.
//

import Foundation

#if !DEVELOPMENT
@_implementationOnly import mobileSDK_UI
@_implementationOnly import MsdkCore
#else
import mobileSDK_UI
import MsdkCore
#endif

@objcMembers public class PaymentResult: NSObject {
    public let status: PaymentStatus
    public let error: PaymentError?
    public let payment: Payment?

    internal init(status: PaymentStatus, error: CoreError? = nil, payment: MsdkCore.Payment? = nil) {
        self.status = status
        self.error = error.map({ coreError in
            PaymentError(coreError: coreError)
        })
        self.payment = payment.map({ corePayment in
            Payment(from: corePayment)
        })
        super.init()
    }

}

@objc public enum PaymentStatus: Int {
    case Success = 0
    case Decline = 100
    case Cancelled = 200
    case Error = 500
}

@objc public class PaymentError: NSObject {
    private var coreError: CoreError

    internal init(coreError: CoreError) {
        self.coreError = coreError
        super.init()
    }

    @objc public var codeString: String {
        coreError.code.rawValue
    }

    @objc public var code: PaymentErrorCode {
        switch coreError.code {
        case .serverUnauthorized: return .serverUnauthorized
        case .serverMethodNotFound: return .serverMethodNotFound
        case .serverApiError: return .serverApiError
        case .serverContentParsingError: return .serverContentParsingError
        case .networkError: return .networkError
        case .networkIsNotAvailable: return .networkIsNotAvailable
        case .networkTimeout: return .networkTimeout
        case .paymentRequestTypeNotExist: return .paymentRequestTypeNotExist
        case .paymentMethodNotAvailable: return .paymentMethodNotAvailable
        case .paymentAlreadyExist: return .paymentAlreadyExist
        case .paymentHasFinalStatus: return .paymentHasFinalStatus
        case .paymentNotFound: return .paymentNotFound
        case .paymentTokenNotExist: return .paymentTokenNotExist
        case .customerIdNotExist: return .customerIdNotExist
        case .clarificationFieldsError: return .clarificationFieldsError
        case .sessionNotInitialized: return .sessionNotInitialized
        case .illegalArguments: return .illegalArguments
        case .illegalState: return .illegalState
        case .unknown: return .unknown
        }
    }

    @objc public var message: String {
        coreError.message
    }
}

@objc public enum PaymentErrorCode: Int {
    case serverUnauthorized
    case serverMethodNotFound
    case serverApiError
    case serverContentParsingError
    case networkError
    case networkIsNotAvailable
    case networkTimeout
    case paymentRequestTypeNotExist
    case paymentMethodNotAvailable
    case paymentAlreadyExist
    case paymentHasFinalStatus
    case paymentNotFound
    case paymentTokenNotExist
    case customerIdNotExist
    case clarificationFieldsError
    case sessionNotInitialized
    case illegalArguments
    case illegalState
    case unknown
}
