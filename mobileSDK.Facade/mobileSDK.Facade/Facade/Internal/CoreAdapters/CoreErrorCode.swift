//
//  CoreErrorCode.swift
//  ecommpaySDK
//
//  Created by Ivan Krapivev on 07.07.2022.
//

import EcmpMsdkCore
import mobileSDK_UI
 
extension CoreErrorCode {
    static func createFrom(code: EcmpMsdkCore.ErrorCode) -> CoreErrorCode {
        if code == EcmpMsdkCore.ErrorCode.interactorNotRunning { return .interactorNotRunning}
        if code == EcmpMsdkCore.ErrorCode.serverUnauthorized { return .serverUnauthorized}
        if code == EcmpMsdkCore.ErrorCode.serverMethodNotFound { return .serverMethodNotFound}
        if code == EcmpMsdkCore.ErrorCode.serverApiError { return .serverApiError}
        if code == EcmpMsdkCore.ErrorCode.serverContentParsingError { return .serverContentParsingError}
        if code == EcmpMsdkCore.ErrorCode.networkError { return .networkError}
        if code == EcmpMsdkCore.ErrorCode.networkIsNotAvailable { return .networkIsNotAvailable}
        if code == EcmpMsdkCore.ErrorCode.networkTimeout { return .networkTimeout}
        if code == EcmpMsdkCore.ErrorCode.paymentRequestTypeNotExist { return .paymentRequestTypeNotExist}
        if code == EcmpMsdkCore.ErrorCode.paymentAlreadyExist { return .paymentAlreadyExist}
        if code == EcmpMsdkCore.ErrorCode.paymentHasFinalStatus { return .paymentHasFinalStatus}
        if code == EcmpMsdkCore.ErrorCode.paymentNotFound { return .paymentNotFound}
        if code == EcmpMsdkCore.ErrorCode.paymentTokenNotExist { return .paymentTokenNotExist}
        if code == EcmpMsdkCore.ErrorCode.customerIdNotExist { return .customerIdNotExist}
        if code == EcmpMsdkCore.ErrorCode.clarificationFieldsError { return .clarificationFieldsError}
        if code == EcmpMsdkCore.ErrorCode.sessionNotInitialized { return .sessionNotInitialized}
        if code == EcmpMsdkCore.ErrorCode.illegalArguments { return .illegalArguments}
        if code == EcmpMsdkCore.ErrorCode.unknown { return .unknown}
        return .unknown
    }
}
