//
//  PayDelegateProxy.swift
//  ecommpaySDK
//
//  Created by Ivan Krapivtsev on 21.07.2022.
//

import MsdkCore
import mobileSDK_UI
import SwiftUI

class PayDelegateProxy: BasePassthroughDelegateProxy<PayDelegate, PayEvent, CoreError> {
    override var delegate: PayDelegate {
        return self
    }
}

extension PayDelegateProxy: PayDelegate {

    func onCustomerFields(customerFields: [MsdkCore.CustomerField]) {
        send(.success(.onCustomerFields(customerFields: customerFields)))
    }

    func onPaymentCreated() {
        send(.success(.onPaymentCreated))
    }

    func onClarificationFields(clarificationFields: [MsdkCore.ClarificationField], payment: MsdkCore.Payment) {
        send(.success(.onClarificationFields(clarificationFields: clarificationFields, payment: payment)))
    }

    func onCompleteWithDecline(paymentMessage: String?, payment: MsdkCore.Payment) {
        send(.success(.onCompleteWithDecline(paymentMessage: paymentMessage, payment: payment)))
    }

    func onCompleteWithFail(isTryAgain: Bool, paymentMessage: String?, payment: MsdkCore.Payment) {
        send(.success(.onCompleteWithFail(isTryAgain: isTryAgain, paymentMessage: paymentMessage, payment: payment)))
    }

    func onCompleteWithSuccess(payment: MsdkCore.Payment) {
        send(.success(.onCompleteWithSuccess(payment: payment)))
    }

    func onError(code: ErrorCode, message: String) {
        send(.failure(CoreError(code: CoreErrorCode.createFrom(code: code), message: message)))
    }

    func onStatusChanged(status: MsdkCore.PaymentStatus, payment: MsdkCore.Payment) {
        send(.success(.onStatusChanged(status: status, payment: payment)))
    }

    func onThreeDSecure(acsPage: MsdkCore.AcsPage, isCascading: Bool, payment: MsdkCore.Payment) {
        send(.success(.onThreeDSecure(acsPage: acsPage, isCascading: isCascading, payment: payment)))
    }
}
