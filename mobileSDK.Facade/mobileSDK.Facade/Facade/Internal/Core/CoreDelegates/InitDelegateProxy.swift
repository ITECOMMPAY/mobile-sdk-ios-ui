//
//  InitDelegateProxy.swift
//  ecommpaySDK
//
//  Created by Ivan Krapivtsev on 11.07.2022.
//

@_implementationOnly import MsdkCore
import Combine
@_implementationOnly import mobileSDK_UI
import SwiftUI

class InitDelegateProxy: BasePassthroughDelegateProxy<InitDelegate, InitEvent, CoreError> {
    override var delegate: InitDelegate { self }
}

extension InitDelegateProxy: InitDelegate {

    func onPaymentRestored(payment: MsdkCore.Payment) {
        send(.success(.onPaymentRestored(payment.wrapper)))
    }

    func onError(code: ErrorCode, message: String) {
        send(.failure(CoreError(code: CoreErrorCode.createFrom(code: code), message: message)))
    }

    func onInitReceived(paymentMethods: [MsdkCore.PaymentMethod], savedAccounts: [MsdkCore.SavedAccount]) {
        send(.success(.onInitReceived(paymentMethods: paymentMethods.map(\.wrapper), savedAccounts: savedAccounts.map(\.wrapper))))
    }

}
