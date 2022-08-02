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
import MsdkCore
import Combine

class SDKInteractor {
    typealias PaymentCompletion = (_ result: PaymentResult) -> Void
    typealias OnPaymentResult = (Payment?) -> Void

    // MARK: - Private variables
    /// session identifier
    private var msdkSession: MSDKCoreSession
    private(set) var pkPaymentRequest: PKPaymentRequest?
    /// completion that would be executed in merchant app on mSDK finish
    internal var completionHandler: PaymentCompletion?

    // MARK: - Init
    public init(callback: OnPaymentResult? = nil) {
        let msdkConfig = MSDKCoreSessionConfig.companion.release(apiHost: NetworkConfigType().apiHost,
                                                                 wsApiHost: NetworkConfigType().socketHost)
        msdkSession = MSDKCoreSession(config: msdkConfig)
        setupDependecy()
    }

    #if DEVELOPMENT

    /// DEVELOPMENT initializer, should not be present in release version!
    public init(apiUrlString: String, socketUrlString: String, callback: OnPaymentResult? = nil) {
        #if DEBUG
        let msdkConfig = MSDKCoreSessionConfig.companion.mockFullSuccessFlow()
        #else
        let msdkConfig = MSDKCoreSessionConfig.companion.debug(apiHost: apiUrlString,
                                                               wsApiHost: socketUrlString)
        #endif
        msdkSession = MSDKCoreSession(config: msdkConfig)
        setupDependecy()
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
        self.completionHandler = completion

        let delegateProxy = InitDelegateProxy()

        let paymentSummary = PaymentSummaryData(logo: paymentOptions.logoImage.map({ Image(uiImage: $0)}),
                                                currency: paymentOptions.paymentInfo.paymentCurrency,
                                                value: Decimal(paymentOptions.paymentInfo.paymentAmount) / 100,
                                                isVatIncluded: false)

        var paymentDetails = [
            PaymentDetailData(title: L.title_payment_id, description: paymentOptions.paymentInfo.paymentId, canBeCopied: true)
        ]
        if let description = paymentOptions.paymentInfo.paymentDescription {
            paymentDetails += [PaymentDetailData(title: L.title_payment_information_description, description: description, canBeCopied: false)]
        }

        let view = ViewFactory.assembleRootView(staticData: (summary: paymentSummary, details: paymentDetails), initPublisher: delegateProxy.createPublisher(with: { delegate in
            let initRequest =  InitRequest(paymentInfo: paymentOptions.paymentInfo,
                                           recurrentInfo: nil, // TODO: fill that parameter from paymentOptions.recurrentInfo,
                                           threeDSecureInfo: nil) // TODO: fill that parameter too
            self.msdkSession.getInitInteractor().execute(request: initRequest, callback: delegate)
        })) {
            viewController.dismiss(animated: true) { [weak self] in
                #warning("TODO: return proper status")
                self?.completionHandler?(PaymentResult(status: .Cancelled, error: nil))
            }
        }

        let vc = UIHostingController(rootView: view)
        vc.view.backgroundColor = .clear
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overFullScreen

        viewController.present(vc, animated: true)

    }

    private func setupDependecy() {
        serviceLocator.addService(instance: CoreValidationService() as ValidationService)
        serviceLocator.addService(instance: SdkExpiry.init(text: "") as CardExpiryFabric)
        serviceLocator.addService(instance: PayInteractorWrapper(msdkSession: self.msdkSession) as mobileSDK_UI.PayInteractor)
        serviceLocator.addService(instance: PayRequestFactory() as mobileSDK_UI.PayRequestFactory)
        serviceLocator.addService(instance: StringResourceManagerAdapter(manger: msdkSession.getStringResourceManager()) as mobileSDK_UI.StringResourceManager)
    }
}
