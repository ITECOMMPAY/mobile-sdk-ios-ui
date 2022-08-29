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
    static var unknown: CoreError {
        CoreError(code: .unknown, message: "unknown")
    }
}
