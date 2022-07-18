//
//  InitDelegateProxy.swift
//  ecommpaySDK
//
//  Created by Ivan Krapivev on 11.07.2022.
//

import EcmpMsdkCore
import Combine
import mobileSDK_UI
import SwiftUI

class InitDelegateProxy: NSObject {
    internal init(paymentOptions: PaymentOptions, msdkSession: MSDKCoreSession) {
        self.paymentOptions = paymentOptions
        self.msdkSession = msdkSession
    }

    let paymentOptions: PaymentOptions
    let msdkSession: MSDKCoreSession

    private var initRequest: InitRequest {
        InitRequest(paymentInfo: paymentOptions.paymentInfo,
                    recurrentInfo: nil, // TODO: fill that parameter from paymentOptions.recurrentInfo,
                    threeDSecureInfo: nil) // TODO: fill that parameter too
    }

    private var promise: Future<PaymentMethodsData, CoreError>.Promise? = nil

    func requestInit() -> Future<PaymentMethodsData, CoreError> {

        return Future { promise in
            self.promise = promise
            self.msdkSession.getInitInteractor().execute(request: self.initRequest, callback: self)
        }
    }
}

extension InitDelegateProxy: InitDelegate {
    func onPaymentRestored(payment: EcmpMsdkCore.Payment) {
        // TODO: implement restore flow
    }

    func onError(code: ErrorCode, message: String) {
        promise?(.failure(CoreError(code: CoreErrorCode.createFrom(code: code), message: message)))
    }

    func onInitReceived(paymentMethods: [EcmpMsdkCore.PaymentMethod], savedAccounts: [SavedAccount]) {
        var paymentDetails = [
            PaymentDetailData(title: "Payment ID", description: paymentOptions.paymentInfo.paymentId, canBeCopied: true)
        ]
        if let description = paymentOptions.paymentInfo.paymentDescription {
            paymentDetails += [PaymentDetailData(title: "Description", description: description, canBeCopied: false)]
        }
        let paymentSummary = PaymentSummaryData(logo: paymentOptions.logoImage.map({ Image(uiImage: $0)}),
                                                currency: paymentOptions.paymentInfo.paymentCurrency,
                                                value: Decimal(paymentOptions.paymentInfo.paymentAmount) / 100,
                                                isVatIncluded: false)
        let availablePaymentMethods = savedAccounts.map { savedAccount in
            mobileSDK_UI.PaymentMethod(id: savedAccount.id,
                                       name: savedAccount.number ?? "",
                                       type: .SavedCard)
        }
        let paymentMethodsData = PaymentMethodsData(paymentDetails: paymentDetails,
                                                    paymentSummary: paymentSummary,
                                                    availablePaymentMethods: availablePaymentMethods)
        promise?(.success(paymentMethodsData))
    }

}
