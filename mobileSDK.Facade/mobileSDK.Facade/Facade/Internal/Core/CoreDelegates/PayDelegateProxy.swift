//
//  PayDelegateProxy.swift
//  mglwalletSDK
//
//  Created by Ivan Krapivtsev on 21.07.2022.
//

#if !DEVELOPMENT
@_implementationOnly import MsdkCore
@_implementationOnly import mobileSDK_UI
#else
import MsdkCore
import mobileSDK_UI
#endif
import SwiftUI

class PayDelegateProxy: BasePassthroughDelegateProxy<PayDelegate, PayEvent, CoreError> {
    override var delegate: PayDelegate { self }
}

extension PayDelegateProxy: PayDelegate {
    func onThreeDSecureRedirectComplete() {
        send(.success(.onThreeDSecureRedirectComplete))
    }

    func onCustomerFields(customerFields: [MsdkCore.CustomerField]) {
        send(.success(.onCustomerFields(customerFields: customerFields.map(\.wrapper))))
    }

    func onPaymentCreated() {
        send(.success(.onPaymentCreated))
    }

    func onClarificationFields(clarificationFields: [MsdkCore.ClarificationField], payment: MsdkCore.Payment) {
        send(.success(.onClarificationFields(clarificationFields: clarificationFields.map(\.wrapper), payment: payment.wrapper)))
    }

    func onCompleteWithDecline(isTryAgain: Bool, paymentMessage: String?, payment: MsdkCore.Payment) {
        send(.success(.onCompleteWithDecline(isTryAgain: isTryAgain, paymentMessage: paymentMessage, payment: payment.wrapper)))
    }

    func onCompleteWithSuccess(payment: MsdkCore.Payment) {
        send(.success(.onCompleteWithSuccess(payment: payment.wrapper)))
    }

    func onError(code: ErrorCode, message: String) {
        send(.failure(CoreError(code: CoreErrorCode.createFrom(code: code), message: message)))
    }

    func onStatusChanged(status: MsdkCore.PaymentStatus, payment: MsdkCore.Payment) {
        send(.success(.onStatusChanged(status: status.wrapper, payment: payment.wrapper)))
    }

    func onThreeDSecure(threeDSecurePage: MsdkCore.ThreeDSecurePage, isCascading: Bool, payment: MsdkCore.Payment) {
        send(.success(.onThreeDSecure(page: threeDSecurePage.wrapper, isCascading: isCascading, payment: payment.wrapper)))
    }
}
