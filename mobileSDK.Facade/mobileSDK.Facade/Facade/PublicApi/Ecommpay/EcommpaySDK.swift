//
//  EcommpaySDK.swift
//  ecommpaySDK
//
//  Created by Ivan Krapivtsev on 25.01.2022.
//  Copyright © 2022 Ecommpay. All rights reserved.
//

import Foundation
import PassKit
import SwiftUI
import UIKit
@_exported import MsdkCore

public typealias PaymentCompletion = (_ result: PaymentResult) -> Void

public class EcommpaySDK: NSObject {
    /// The key is used to get error-code from UserInfo of NSError instance returned while mobile SDK session initialisation
    @objc public static let kSDKInitErrorCodeKey = "SDKInitErrorCode"
    /// Version of currently installed Ecommpay SDK
    @objc public static let buildNumber: String = SDKInteractor.getBuildNumberOfBundle(for: EcommpaySDK.self)
    @objc public static let sdkVersion: String = SDKInteractor.getBundleVersion(for: EcommpaySDK.self)

    #if DEVELOPMENT

    /// Debug initializer, should not be present in release version!
    ///
    /// - Parameters:
    ///   - url_api: API url to send requests to
    ///   - url_socket: Socket url to listen for callbacks
    @objc(initWithApi:socket:)
    public init(apiUrlString: String, socketUrlString: String) {
        interactor = SDKInteractor(apiUrlString: apiUrlString, socketUrlString: socketUrlString)
    }

    #endif

    private let interactor: SDKInteractor

    @objc(init) public override init() {
        interactor = SDKInteractor()
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
                               completion: ((_ result: PaymentResult) -> Void)?) {
        interactor.presentPayment(at: viewController,
                                  paymentOptions: paymentOptions) { result in
            completion?(result)
        }

    }

    /// Create pament page UI to begin payment flow
    ///
    /// - Parameters:
    ///   - rootView: view to present payment on
    ///   - paymentOptions: info that is needed to perform payment (merchant_id, proeject_id, etc)
    ///   - completion: result of payment flow
    public func getPaymentView(with paymentOptions: PaymentOptions,
                               completion: ((_ result: PaymentResult) -> Void)?) -> some View {
        final class WrapperCotroller: UIViewController, UIViewControllerRepresentable {

            typealias OnViewDidAppear = (_ controlledBy: UIViewController) -> Void

            var onViewDidAppear: OnViewDidAppear = { _ in }

            init(onViewDidAppear: @escaping OnViewDidAppear) {
                self.onViewDidAppear = onViewDidAppear
                super.init(nibName: nil, bundle: nil)
            }

            required init?(coder: NSCoder) {
                fatalError("init(coder:) has not been implemented")
            }

            typealias UIViewControllerType = WrapperCotroller

            override func viewDidAppear(_ animated: Bool) {
                super.viewDidAppear(animated)
                onViewDidAppear(self)
            }

            func makeUIViewController(context: Context) -> WrapperCotroller {
                return WrapperCotroller(onViewDidAppear: onViewDidAppear)
            }

            func updateUIViewController(_ uiViewController: WrapperCotroller, context: Context) {}
        }

        let wrapper = WrapperCotroller { [weak self] vc in
            self?.presentPayment(at: vc, paymentOptions: paymentOptions, completion: completion)
        }
        return wrapper
    }
}
