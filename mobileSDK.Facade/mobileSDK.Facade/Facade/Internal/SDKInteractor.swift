//
//  MobileSDK.swift
//  mobilesdk-ios
//
//  Created by Ecommpay on 10/31/17.
//  Copyright © 2017 Ecommpay. All rights reserved.
//

import UIKit
import PassKit
import SwiftUI
import mobileSDK_UI
import EcmpMsdkCore
import Combine

class SDKInteractor {
    typealias PaymentCompletion = (_ result: PaymentResult) -> Void
    typealias OnPaymentResult = (Payment?) -> Void

    // MARK: - Private variables
    /// session identifier
    private var msdkSession: MSDKCoreSession
    private(set) var pkPaymentRequest: PKPaymentRequest?

    // MARK: - Init
    public init(callback: OnPaymentResult? = nil) {
        let msdkConfig = MSDKCoreSessionConfig.companion.nl3WithDebug()
        msdkSession = MSDKCoreSession(config: msdkConfig)
    }

    #if DEVELOPMENT

    /// DEVELOPMENT initializer, should not be present in release version!
    public init(apiUrlString: String, socketUrlString: String, callback: OnPaymentResult? = nil) {
        let msdkConfig = MSDKCoreSessionConfig.companion.debug(apiHost: apiUrlString, wsApiHost: socketUrlString)
        msdkSession = MSDKCoreSession(config: msdkConfig)
    }

    #endif

    // MARK: - Public methods
    /// Set a custom theme to payment form
    ///
    /// - Parameter theme: theme to use in payment form
    public func setTheme(theme: ColorTheme) {
    }

    /// Set a PKPaymentRequest
    ///
    /// - Parameter request: PKPaymentRequest to use with ApplePay
    public func setPKPaymentRequest(request: PKPaymentRequest) {
        pkPaymentRequest = request
    }

    /// Presents UI to begin payment flow
    ///
    /// - Parameters:
    ///   - viewController: controller from what you would like to present payment UI
    ///   - paymentOptions: info that is needed to perform payment (merchant_id, proeject_id, etc)
    ///   - completion: result of payment flow
    public func presentPayment(at viewController: UIViewController,
                               paymentOptions: PaymentOptions,
                               completion: PaymentCompletion?) {
        let delegateProxy = InitDelegateProxy(paymentOptions: paymentOptions, msdkSession: msdkSession)

        let view = ViewFactory.assemblePaymentMethodsView(futureData: delegateProxy.requestInit(),
                                                          onDismiss: { viewController.dismiss(animated: true) })

        let vc = UIHostingController(rootView: view)
        vc.view.backgroundColor = .clear
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overFullScreen

        viewController.present(vc, animated: true)

    }


}

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
        let paymentMethodsData = PaymentMethodsData(paymentDetails: paymentDetails,
                                                    paymentSummary: paymentSummary,
                                                    availablePaymentMethods: [])
        promise?(.success(paymentMethodsData))
    }

}
