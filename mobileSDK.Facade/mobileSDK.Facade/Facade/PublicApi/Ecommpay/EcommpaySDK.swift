//
//  EcommpaySDK.swift
//  ecommpaySDK
//
//  Created by Ivan Krapivev on 25.01.2022.
//  Copyright © 2022 Ecommpay. All rights reserved.
//

import Foundation
import PassKit
import EcmpMsdkCore

typealias ECPPaymentCompletion = (_ result: ECPPaymentResult) -> Void

public class EcommpaySDK: NSObject {
    /// The key is used to get error-code from UserInfo of NSError instance returned while mobile SDK session initialisation
    @objc public static let kSDKInitErrorCodeKey = "SDKInitErrorCode"
    /// Version of currently installed Ecommpay SDK
    @objc public static let buildNumber: String = EcommpaySDK.getBuildNumberOfBundle(for: EcommpaySDK.self)
    @objc public static let sdkVersion: String = EcommpaySDK.getBundleVersion(for: EcommpaySDK.self)

    #if DEVELOPMENT
    @objc public static let apiURL: NSURL = NSURL(string: MSDKCoreSessionConfig.companion.nl3WithDebug().apiHost)!
    @objc public static let socketURL: NSURL = NSURL(string: MSDKCoreSessionConfig.companion.nl3WithDebug().wsApiHost)!

    /// Debug initializer, should not be present in release version!
    ///
    /// - Parameters:
    ///   - url_api: API url to send requests to
    ///   - url_socket: Socket url to listen for callbacks
    @objc(initWithApi:socket:)
    public init(apiUrlString: String, socketUrlString: String) {
        interactor = SDKInteractor(apiUrlString: apiUrlString, socketUrlString: socketUrlString)
    }

    /// Debug initializer, should not be present in release version!
    ///
    /// - Parameters:
    ///   - url_api: API url to send requests to
    ///   - url_socket: Socket url to listen for callbacks
    @objc(initWithApi:socket:callback:)
    public init(apiUrlString: String, socketUrlString: String, callback: ECMPCallback? = nil) {
        interactor = SDKInteractor(apiUrlString: apiUrlString, socketUrlString: socketUrlString) { [weak callback] in
            let data = ECMPPaymentData()
            data.payment = $0
            callback?.onPaymentResult(paymentData: data)
        }
    }
    
    #endif
    
    private let interactor: SDKInteractor

    @objc(init) public override init() {
        interactor = SDKInteractor()
    }

    /// - Parameters:
    ///   - callback: Payment callbacks
    @objc(initWithCallback:)
    public init(callback: ECMPCallback? = nil) {
        interactor = SDKInteractor { [weak callback] in
            let data = ECMPPaymentData()
            data.payment = $0
            callback?.onPaymentResult(paymentData: data)
        }
    }

    /// Set a custom theme to payment form
    ///
    /// - Parameter theme: theme to use in payment form
    @objc(setTheme:) public func setTheme(theme: ECPTheme) {
        interactor.setTheme(theme: theme)
    }

    /// Set a PKPaymentRequest
    ///
    /// - Parameter request: PKPaymentRequest to use with ApplePay
    @objc(setPKPaymentRequest:)
    public func setPKPaymentRequest(request: PKPaymentRequest) {
        interactor.setPKPaymentRequest(request: request)
    }

    /// Presents UI to begin payment flow
    ///
    /// - Parameters:
    ///   - viewController: controller from what you would like to present payment UI
    ///   - paymentOptions: info that is needed to perform payment (merchant_id, proeject_id, etc)
    ///   - completion: result of payment flow
    @objc(presentPaymentAt:paymentOptions:completionHandler:)
    public func presentPayment(at viewController: UIViewController,
                               paymentOptions: PaymentOptions,
                               completion: ((_ result: ECPPaymentResult) -> Void)?) {
        interactor.presentPayment(at: viewController,
                                  paymentOptions: paymentOptions) { result in
            completion?(ECPPaymentResult(internalResult: result))
        }

    }

    internal static func getBundleVersion(for aClass: AnyClass) -> String {
        return Bundle(for: aClass).infoDictionary?["CFBundleShortVersionString"] as! String
    }

    internal static func getBuildNumberOfBundle(for aClass: AnyClass) -> String {
        return Bundle(for: aClass).infoDictionary?["CFBundleVersion"] as! String
    }
}
