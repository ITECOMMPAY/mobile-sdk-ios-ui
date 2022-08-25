//
//  MobileSDK.swift
//  mobilesdk-ios
//
//  Created by Ecommpay on 10/31/17.
//  Copyright © 2017 Ecommpay. All rights reserved.
//

import UIKit
import SwiftUI
import mobileSDK_UI
import MsdkCore
import Combine
import PassKit

class SDKInteractor {
    typealias PaymentCompletion = (_ result: PaymentResult) -> Void

    // MARK: - Private variables
    /// session identifier
    private var msdkSession: MSDKCoreSession {
        didSet {
            setupDependecy()
        }
    }

    private var msdkConfig: MSDKCoreSessionConfig {
        didSet {
            msdkSession = MSDKCoreSession(config: msdkConfig)
        }
    }

    /// completion that would be executed in merchant app on mSDK finish
    internal var completionHandler: PaymentCompletion?

    // MARK: - Init
    init() {
        msdkConfig = MSDKCoreSessionConfig.companion.release(apiHost: NetworkConfigType().apiHost,
                                                                 wsApiHost: NetworkConfigType().socketHost)
        msdkSession = MSDKCoreSession(config: msdkConfig)
    }

    #if DEVELOPMENT

    /// DEVELOPMENT initializer, should not be present in release version!
    public init(apiUrlString: String, socketUrlString: String) {
        msdkConfig = MSDKCoreSessionConfig.companion.debug(apiHost: apiUrlString,
                                                               wsApiHost: socketUrlString)
        msdkSession = MSDKCoreSession(config: msdkConfig)
    }

    #endif

    /// Presents UI to begin payment flow
    ///
    /// - Parameters:
    ///   - viewController: controller from what you would like to present payment UI
    ///   - paymentOptions: info that is needed to perform payment (merchant_id, proeject_id, etc)
    ///   - completion: result of payment flow
    func presentPayment(at viewController: UIViewController,
                               paymentOptions: PaymentOptions,
                               completion: PaymentCompletion?) {

        if paymentOptions.mockModeType == .success {
            msdkConfig = MSDKCoreSessionConfig.companion.mockFullSuccessFlow()
        } else if paymentOptions.mockModeType == .decline {
            msdkConfig = MSDKCoreSessionConfig.companion.mockFullDeclineFlow()
        } else {
            msdkSession = MSDKCoreSession(config: msdkConfig)
        }

        self.completionHandler = completion

        let delegateProxy = InitDelegateProxy()

        let view = ViewFactory.assembleRootView(paymentOptions: paymentOptions, initPublisher: delegateProxy.createPublisher(with: { delegate in
            let initRequest =  InitRequest(paymentInfo: paymentOptions.paymentInfo,
                                           recurrentInfo: paymentOptions.recurrentInfo,
                                           threeDSecureInfo: paymentOptions.threeDSecureInfo)
            self.msdkSession.getInitInteractor().execute(request: initRequest, callback: delegate)
        })) { reason in
            viewController.dismiss(animated: true) { [weak self] in
                switch reason {
                case .byUser:
                    self?.completionHandler?(PaymentResult(status: .Cancelled, error: nil))
                case .withError:
                    self?.completionHandler?(PaymentResult(status: .Error, error: nil))
                case .success:
                    self?.completionHandler?(PaymentResult(status: .Success, error: nil))
                case .decline:
                    self?.completionHandler?(PaymentResult(status: .Decline, error: nil))
                }
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

    internal static func getBundleVersion(for aClass: AnyClass) -> String {
        return Bundle(for: aClass).infoDictionary?["CFBundleShortVersionString"] as! String
    }

    internal static func getBuildNumberOfBundle(for aClass: AnyClass) -> String {
        return Bundle(for: aClass).infoDictionary?["CFBundleVersion"] as! String
    }
}

extension PaymentOptions: mobileSDK_UI.PaymentOptions {
    public var applePayMerchantID: String? {
        applePayOptions?.applePayMerchantID
    }

    public var applePayDescription: String? {
        applePayOptions?.applePayDescription
    }

    public var pkPaymentRequest: PKPaymentRequest? {
        applePayOptions?.pkPaymentRequest
    }

    public var appleCountryCode: String? {
        applePayOptions?.countryCode
    }

    public var brandColorOverride: Color? {
        get {
            if let uiColor = brandColor {
                return Color(uiColor)
            } else {
                return nil
            }
        }
        set {
            if let value = newValue {
                brandColor = UIColor(value)
            } else {
                brandColor = nil
            }
        }
    }

    public var isMockModeEnabled: Bool {
        mockModeType != .disabled
    }

    public var uiAdditionalFields: [mobileSDK_UI.AdditionalField] {
        additionalFields ?? [] as [mobileSDK_UI.AdditionalField]
    }

    public var summary: PaymentSummaryData {
        return PaymentSummaryData(logo: logoImage.map({ Image(uiImage: $0)}),
                                                currency: paymentInfo.paymentCurrency,
                                                value: Decimal(paymentInfo.paymentAmount) / 100)
    }

    public var details: [PaymentDetailData] {
        var paymentDetails = [
            PaymentDetailData(title: L.title_payment_id, description: self.paymentInfo.paymentId, canBeCopied: true)
        ]
        if let description = self.paymentInfo.paymentDescription {
            paymentDetails += [PaymentDetailData(title: L.title_payment_information_description, description: description, canBeCopied: false)]
        }
        return paymentDetails
    }

    public var paymentID: String {
        paymentInfo.paymentId
    }
}
