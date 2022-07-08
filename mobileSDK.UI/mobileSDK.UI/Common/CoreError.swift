//
//  CoreErrorCode.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 07.07.2022.
//

import Foundation

public struct CoreError: Error {
    public init(code: CoreErrorCode, message: String) {
        self.code = code
        self.message = message
    }

    let code: CoreErrorCode
    let message: String
}

public enum CoreErrorCode {
    case interactorNotRunning
    case serverUnauthorized
    case serverMethodNotFound
    case serverApiError
    case serverContentParsingError
    case networkError
    case networkIsNotAvailable
    case networkTimeout
    case paymentRequestTypeNotExist
    case paymentAlreadyExist
    case paymentHasFinalStatus
    case paymentNotFound
    case paymentTokenNotExist
    case customerIdNotExist
    case clarificationFieldsError
    case sessionNotInitialized
    case illegalArguments
    case unknown
}
