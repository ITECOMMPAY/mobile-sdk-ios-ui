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

class SDKInteractor {
    typealias PaymentCompletion = (_ result: PaymentResult) -> Void
    typealias OnPaymentResult = (Payment?) -> Void
    // MARK: - Private variables
    /// session identifier

    deinit {
        pkPaymentRequest = nil
    }

    private(set) var pkPaymentRequest: PKPaymentRequest?

    public init(callback: OnPaymentResult? = nil) { 
    }

    #if DEVELOPMENT
    /// DEVELOPMENT initializer, should not be present in release version!
    public convenience init(apiUrlString: String, socketUrlString: String) {
        self.init(apiUrlString: apiUrlString, socketUrlString: socketUrlString, callback: nil)
    }

    /// DEVELOPMENT initializer, should not be present in release version!
    public convenience init(apiUrlString: String, socketUrlString: String, callback: OnPaymentResult? = nil) {
        self.init(callback: callback)
    }
    #endif

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
    ///   - paymentInfo: info that is needed to perform payment (merchant_id, proeject_id, etc)
    ///   - completion: result of payment flow
    public func presentPayment(at viewController: UIViewController,
                               paymentInfo: PaymentInfo,
                               completion: PaymentCompletion?) {
        let vc = UIHostingController(rootView: PaymentsMethodsLoadingView())
        vc.view.backgroundColor = .clear
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overFullScreen
        viewController.present(vc, animated: true)
    }
}

