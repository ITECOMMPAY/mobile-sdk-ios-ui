//
//  MobileSDK.swift
//  mobilesdk-ios
//
//  Created by Ecommpay on 10/31/17.
//  Copyright © 2017 Ecommpay. All rights reserved.
//

import UIKit
import SwiftUI

#if !DEVELOPMENT
@_implementationOnly import mobileSDK_UI
@_implementationOnly import MsdkCore
#else
import mobileSDK_UI
import MsdkCore
#endif
import Combine
import PassKit

class SDKInteractor {
    typealias PaymentCompletion = (_ result: PaymentResult) -> Void

    // MARK: - Private variables

    private var msdkConfig: MSDKCoreSessionConfig

    /// completion that would be executed in merchant app on mSDK finish
    internal var completionHandler: PaymentCompletion?

    // MARK: - Init
    init() {
        msdkConfig = MSDKCoreSessionConfig.companion.release(apiHost: NetworkConfigType().apiHost,
                                                           wsApiHost: NetworkConfigType().socketHost)
    }

    public init(apiUrlString: String, socketUrlString: String) {
#if DEVELOPMENT
        msdkConfig = MSDKCoreSessionConfig.companion.debug(apiHost: apiUrlString,
                                                           wsApiHost: socketUrlString)
#else
        msdkConfig = MSDKCoreSessionConfig.companion.release(apiHost: apiUrlString,
                                                             wsApiHost: socketUrlString)
#endif
    }

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
        }

        msdkConfig.userAgentData = UserAgentData(
            screenInfo: .init(width: Int32(UIScreen.main.bounds.width),
                              height: Int32(UIScreen.main.bounds.height)),
            applicationInfo: .init(version: EcommpaySDK.sdkVersion,
                                   bundleId: Bundle.main.bundleIdentifier,
                                   appName: Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String))

        let msdkSession = MSDKCoreSession(config: msdkConfig)
        setupDependency(with: msdkSession)

        self.completionHandler = completion

        let delegateProxy = InitDelegateProxy()

        let view = ViewFactory.assembleRootView(
            paymentOptions: paymentOptions.uiPaymentOptions,
            initPublisher: delegateProxy.createPublisher(with: { delegate in
                let initRequest =  InitRequest(paymentInfo: paymentOptions.paymentInfo,
                                               recurrentInfo: paymentOptions.recurrentInfo?.coreRecurrentInfo)
                msdkSession.getInitInteractor().execute(request: initRequest, callback: delegate)
            })
        ) { reason in
            viewController.dismiss(animated: true) { [weak self] in
                switch reason {
                case .byUser:
                    self?.completionHandler?(PaymentResult(status: .Cancelled, error: nil))
                case .withError(let coreError):
                    self?.completionHandler?(PaymentResult(status: .Error, error: coreError))
                case .success(let payment):
                    self?.completionHandler?(
                        PaymentResult(
                            status: .Success,
                            payment: (payment as? MsdkCorePaymentWrapper)?.coreType
                        )
                    )
                case .decline(let payment):
                    self?.completionHandler?(
                        PaymentResult(
                            status: .Decline,
                            payment: (payment as? MsdkCorePaymentWrapper)?.coreType
                        )
                    )
                }
            }
        }

        let vc = ContainerViewController(rootView: view)
        vc.view.backgroundColor = .clear
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overFullScreen

        viewController.present(vc, animated: true)
    }

    private func setupDependency(with session: MSDKCoreSession) {
        serviceLocator.addService(instance: CoreValidationService() as ValidationService)
        serviceLocator.addService(instance: CardExpiryFabric() as mobileSDK_UI.CardExpiryFabric)
        serviceLocator.addService(instance: PayInteractorWrapper(msdkSession: session) as mobileSDK_UI.PayInteractor)
        serviceLocator.addService(instance: PayRequestFactory() as mobileSDK_UI.PayRequestFactory)
        serviceLocator.addService(instance: StringResourceManagerAdapter(manager: session.getStringResourceManager()) as mobileSDK_UI.StringResourceManager)
        serviceLocator.addService(
            instance: CardRemoveInteractorWrapper(msdkSession: session) as mobileSDK_UI.CardRemoveInteractor
        )
    }

    internal static func getBundleVersion(for aClass: AnyClass) -> String {
        return Bundle(for: aClass).infoDictionary?["CFBundleShortVersionString"] as! String
    }

    internal static func getBuildNumberOfBundle(for aClass: AnyClass) -> String {
        return Bundle(for: aClass).infoDictionary?["CFBundleVersion"] as! String
    }

    internal static func getCoreVersion() -> String {
        return MSDKCoreSession.companion.metadata.version
    }
}

fileprivate extension PaymentOptions {
    var uiPaymentOptions: some mobileSDK_UI.PaymentOptions {
        PaymentOptionsWrapper(publicType: self)
    }
}

private struct PaymentOptionsWrapper: mobileSDK_UI.PaymentOptions {
    let publicType: PaymentOptions
    
    var action: ActionType {
        ActionType.init(rawValue: publicType.action.rawValue) ?? .Sale
    }

    var applePayMerchantID: String? {
        publicType.applePayOptions?.applePayMerchantID
    }

    var applePayDescription: String? {
        publicType.applePayOptions?.applePayDescription
    }

    var pkPaymentRequest: PKPaymentRequest? {
        publicType.applePayOptions?.pkPaymentRequest
    }

    var appleCountryCode: String? {
        publicType.applePayOptions?.countryCode
    }

    var brandColorOverride: Color? {
        if let uiColor = publicType.brandColor {
            return Color(uiColor)
        } else {
            return nil
        }
    }

    var isMockModeEnabled: Bool {
        publicType.mockModeType != .disabled
    }

    var uiAdditionalFields: [mobileSDK_UI.AdditionalField] {
        publicType.additionalFields?.map { $0.wrapper } ?? [] as [mobileSDK_UI.AdditionalField]
    }

    var summary: PaymentSummaryData {
        return PaymentSummaryData(logo: publicType.logoImage.map({ Image(uiImage: $0)}),
                                  currency: publicType.paymentInfo.paymentCurrency,
                                  value: Decimal(publicType.paymentInfo.paymentAmount) / 100)
    }

    var details: [PaymentDetailData] {
        var paymentDetails = [
            PaymentDetailData(title: L.title_payment_id, description: publicType.paymentInfo.paymentId, canBeCopied: true)
        ]
        if let description = publicType.paymentInfo.paymentDescription {
            paymentDetails += [PaymentDetailData(title: L.title_payment_information_description, description: description, canBeCopied: false)]
        }
        return paymentDetails
    }

    var paymentID: String {
        publicType.paymentInfo.paymentId
    }
    
    var token: String? {
        publicType.paymentInfo.token
    }
}