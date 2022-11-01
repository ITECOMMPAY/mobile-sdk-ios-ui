//
//  CoreErrorCode.swift
//  ecommpaySDK
//
//  Created by Ivan Krapivtsev on 07.07.2022.
//

@_implementationOnly import MsdkCore
@_implementationOnly import mobileSDK_UI

extension CoreErrorCode {
    static func createFrom(code: MsdkCore.ErrorCode) -> CoreErrorCode {
        if code == MsdkCore.ErrorCode.serverUnauthorized { return .serverUnauthorized }
        if code == MsdkCore.ErrorCode.serverMethodNotFound { return .serverMethodNotFound }
        if code == MsdkCore.ErrorCode.serverApiError { return .serverApiError }
        if code == MsdkCore.ErrorCode.serverContentParsingError { return .serverContentParsingError }
        if code == MsdkCore.ErrorCode.networkError { return .networkError }
        if code == MsdkCore.ErrorCode.networkIsNotAvailable { return .networkIsNotAvailable }
        if code == MsdkCore.ErrorCode.networkTimeout { return .networkTimeout }
        if code == MsdkCore.ErrorCode.paymentRequestTypeNotExist { return .paymentRequestTypeNotExist }
        if code == MsdkCore.ErrorCode.paymentMethodNotAvailable { return .paymentMethodNotAvailable }
        if code == MsdkCore.ErrorCode.paymentAlreadyExist { return .paymentAlreadyExist }
        if code == MsdkCore.ErrorCode.paymentHasFinalStatus { return .paymentHasFinalStatus }
        if code == MsdkCore.ErrorCode.paymentNotFound { return .paymentNotFound }
        if code == MsdkCore.ErrorCode.paymentTokenNotExist { return .paymentTokenNotExist }
        if code == MsdkCore.ErrorCode.customerIdNotExist { return .customerIdNotExist }
        if code == MsdkCore.ErrorCode.clarificationFieldsError { return .clarificationFieldsError }
        if code == MsdkCore.ErrorCode.sessionNotInitialized { return .sessionNotInitialized }
        if code == MsdkCore.ErrorCode.illegalArguments { return .illegalArguments }
        if code == MsdkCore.ErrorCode.illegalState { return .illegalState }
        if code == MsdkCore.ErrorCode.unknown { return .unknown}
        return .unknown
    }
}
