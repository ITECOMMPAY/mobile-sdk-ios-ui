//
//  PayDelegateProxy.swift
//  ecommpaySDK
//
//  Created by Ivan Krapivev on 21.07.2022.
//

import MsdkCore
import mobileSDK_UI
import SwiftUI

class PayDelegateProxy: BaseDelegateProxy<PayDelegate, PayEvent, CoreError>, PayDelegate {
    func onCustomerFields(customerFields: [MsdkCore.CustomerField]) {
        promise?(.success(.onCustomerFields(customerFields: customerFields)))
    }

    func onPaymentCreated() {
        promise?(.success(.onPaymentCreated))
    }

    func onClarificationFields(clarificationFields: [MsdkCore.ClarificationField], payment: MsdkCore.Payment) {
        promise?(.success(.onClarificationFields(clarificationFields: clarificationFields, payment: payment)))
    }

    func onCompleteWithDecline(payment: MsdkCore.Payment) {
        promise?(.success(.onCompleteWithDecline(payment: payment)))
    }

    func onCompleteWithFail(status: String?, payment: MsdkCore.Payment) {
        promise?(.success(.onCompleteWithFail(status: status, payment: payment)))
    }

    func onCompleteWithSuccess(payment: MsdkCore.Payment) {
      promise?(.success(.onPaymentCreated))
    }

    func onError(code: ErrorCode, message: String) {
        promise?(.failure(CoreError(code: CoreErrorCode.createFrom(code: code), message: message)))
    }

    func onStatusChanged(status: MsdkCore.PaymentStatus, payment: MsdkCore.Payment) {
        promise?(.success(.onStatusChanged(status: status, payment: payment)))
    }

    func onThreeDSecure(acsPage: MsdkCore.AcsPage, isCascading: Bool, payment: MsdkCore.Payment) {
        promise?(.success(.onThreeDSecure(acsPage: acsPage, isCascading: isCascading, payment: payment)))
    }
}

