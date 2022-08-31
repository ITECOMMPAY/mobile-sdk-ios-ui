//
//  CoreErrorCode.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 07.07.2022.
//

import Foundation

public struct CoreError: Error {
    public init(code: CoreErrorCode, message: String) {
        self.code = code
        self.message = message
    }

    public let code: CoreErrorCode
    public let message: String
}

public enum CoreErrorCode: String {
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

extension CoreError {
    static let unknown = CoreError(code: .unknown, message: "unknown")
    static let methodsListEmpty = CoreError(code: .unknown, message: "Payment methods list is empty")
    static let failedToPresentApplePay  = CoreError(code: .unknown, message: "Failed to present ApplePay")
    static let failedApplePayRequestCreation = CoreError(code: .unknown, message: "Failed to create payment request to ApplePay")
    static let applePayUnsupported = CoreError(code: .unknown, message: "ApplePay is not supported on that device")
    static func unavailableMethod(for payment: Payment) -> CoreError {
        CoreError(code: .paymentMethodNotAvailable,
                  message: "Payment method \(String(describing: payment.method)) does not found")
    }
}
