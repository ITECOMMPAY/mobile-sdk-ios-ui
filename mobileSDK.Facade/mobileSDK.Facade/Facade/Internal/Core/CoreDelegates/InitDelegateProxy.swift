//
//  InitDelegateProxy.swift
//  ecommpaySDK
//
//  Created by Ivan Krapivtsev on 11.07.2022.
//

import MsdkCore
import Combine
import mobileSDK_UI
import SwiftUI

class InitDelegateProxy: BaseFutureDelegateProxy<InitDelegate, InitEvent, CoreError> {
    override var delegate: InitDelegate { self }
}

extension InitDelegateProxy: InitDelegate {
    
    func onPaymentRestored(payment: MsdkCore.Payment) {
        promise?(.success(.onPaymentRestored(payment)))
    }

    func onError(code: ErrorCode, message: String) {
        promise?(.failure(CoreError(code: CoreErrorCode.createFrom(code: code), message: message)))
    }

    func onInitReceived(paymentMethods: [MsdkCore.PaymentMethod], savedAccounts: [MsdkCore.SavedAccount]) {
        promise?(.success(.onInitReceived(paymentMethods: paymentMethods, savedAccounts: savedAccounts)))
    }

}
