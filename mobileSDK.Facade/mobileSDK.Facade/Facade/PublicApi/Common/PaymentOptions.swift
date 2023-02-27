//
//  PaymentOptions.swift
//  mobilesdk-ios
//
//  Copyright © 2018 Ecommpay. All rights reserved.
//

import Foundation
import UIKit
#if !DEVELOPMENT
@_implementationOnly import mobileSDK_UI
@_implementationOnly import MsdkCore
#else
import mobileSDK_UI
import MsdkCore
#endif
import UIKit
import PassKit

@objc public enum MockModeType: Int {
    case disabled
    case success
    case decline
}

public class PaymentOptions: NSObject {
    @objc(PaymentOptionsForApplePay)
    public class ApplePayOptions: NSObject {
        /// Apple Pay Merchant ID
        /// If you want to use Apple Pay, you would need to set MerchantID from developer.apple.com
        @objc private(set) var applePayMerchantID: String?
        /// Apple Pay Description
        @objc private(set) var applePayDescription: String?
        /// Country code
        @objc private(set) var countryCode: String?
        /// PKPaymentRequest to use with ApplePay
        @objc private(set) var pkPaymentRequest: PKPaymentRequest?

        /// Initialise with fields:
        /// - **applePayMerchantID** - required parameter:
        /// - **countryCode** - The merchant's ISO country code. It is required parameter:
        /// - **applePayDescription**  Optional. PaymentID will be used as description of payment if not provided
        @objc
        public init(applePayMerchantID: String?, applePayDescription: String?, countryCode: String?) {
            self.applePayMerchantID = applePayMerchantID
            self.applePayDescription = applePayDescription
            self.countryCode = countryCode
        }

        /// Initialise with pre-filed PKPaymentRequest
        @objc
        public init(paymentRequest: PKPaymentRequest?) {
            self.pkPaymentRequest = paymentRequest
        }
        
        /// Initialise with fields:
        /// - **applePayMerchantID** - required parameter:
        /// - **countryCode** - The merchant's ISO country code. It is required parameter:
        /// - **applePayDescription**  Optional. PaymentID will be used as description of payment if not provided
        /// - **paymentRequest**  Optional.  pre-filed PKPaymentRequest
        @objc
        public init(applePayMerchantID: String?, applePayDescription: String?, countryCode: String?, paymentRequest: PKPaymentRequest?) {
            self.applePayMerchantID = applePayMerchantID
            self.applePayDescription = applePayDescription
            self.countryCode = countryCode
            self.pkPaymentRequest = paymentRequest
        }
    }

    /// PaymentInfo contains this required fields:
    /// - **projectID** - Unique identifier of your project
    /// - **paymentID** - Unique identifier of the payment in your project
    /// - **paymentAmount** - Payment amount in minor units of currency, 1999 means 19.99, 10 means 0.10
    /// - **paymentCurrency** - Payment currency in ISO 4217 alpha-3 format
    /// - **customerId** - Unique identifier of the customer in your project
    /// and other optional params, complete reference of those presented in documentation
    internal var paymentInfo: PaymentInfo

    @objc public var applePayOptions: ApplePayOptions?



    /// Payment logo image
    @objc public var logoImage: UIImage?

    /// Brand color
    @objc public var brandColor: UIColor?

    /// Dark theme mode
    @objc public var isDarkThemeOn: Bool = false

    /// mock Mode type
    @objc public var mockModeType: MockModeType = .disabled

    /* TODO: add auth, verify support */
    @objc public enum ActionType: Int {
        case Sale = 1
        case Auth = 2
        case Tokenize = 3
        case Verify = 4
    }

    /// Action of payment, by default its Sale
    @objc public var action: ActionType = .Sale

    /// Object that holds recurrent info
    /// If set, would treat payment as recurrent
    @objc public var recurrentInfo: RecurrentInfo?

    /// If you know any data for fields what would be asked from a user
    /// you could set them and they would be pre-filled
    /// Fields that are known, if visible -> would be pre-filled
    @objc public var additionalFields: [AdditionalField]?

    /// Receipt data base64
    @objc public var receiptData: String?
    /// The reference to an instance of Recipient Info data class should be assagned for auth actions with support FT amd F52 fundings
    @objc public var recipientInfo: RecipientInfo?
    /// Hide saved wallets
    @objc public var hideSavedWallets: Bool {
        get { paymentInfo.hideSavedWallets }
        set { paymentInfo.hideSavedWallets = newValue }
    }
    /// language code
    @objc public var languageCode: String? {
        get { paymentInfo.languageCode }
        set { paymentInfo.languageCode = newValue }
    }

    @objc public func setThreeDSecureInfo(_ threeDSecureInfo: ThreeDSecureInfo?) {
        paymentInfo.threeDSecureInfo = threeDSecureInfo?.coreType
    }

    /// Display mode
    public var screenDisplayModes: Set<ScreenDisplayMode> = []

    @objc
    public func addScreenDisplayMode(_ mode: ScreenDisplayMode) {
        screenDisplayModes = screenDisplayModes.union([mode])
    }

    /// Init Payment Info with some additional params
    ///
    /// - Parameters:
    ///   - projectID: Unique identifier of your project
    ///   - paymentID: Unique identifier of the payment in your project
    ///   - paymentAmount: Payment amount in minor units of currency, 1999 means 19.99, 10 means 0.10
    ///   - paymentCurrency: Payment currency in ISO 4217 alpha-3 format
    ///   - paymentDescription: Payment description, for example, T-Shirt with print
    ///   - customerID: Unique identifier of the customer in your project
    ///   - regionCode: Region code of a customer
    ///   - token: Saved card token
    @objc(initWithProjectID:paymentID:paymentAmount:paymentCurrency:paymentDescription:customerID:regionCode:token:)
    public init(projectID: Int32,
                paymentID: String,
                paymentAmount: Int64,
                paymentCurrency: String,
                paymentDescription: String?,
                customerID: String?,
                regionCode: String?,
                token: String? = nil) {
        self.paymentInfo = PaymentInfo.companion.create(projectId: projectID,
                                                        paymentId: paymentID,
                                                        paymentAmount: paymentAmount,
                                                        paymentCurrency: paymentCurrency)
        self.paymentInfo.paymentDescription = (paymentDescription?.isEmpty ?? true) ? nil : paymentDescription
        self.paymentInfo.customerId = customerID
        self.paymentInfo.regionCode = regionCode
        self.paymentInfo.token = token
        super.init()
    }

    /// Init Payment Info with only required params
    ///
    /// - Parameters:
    ///   - projectID: Unique identifier of your project
    ///   - paymentID: Unique identifier of the payment in your project
    ///   - paymentAmount: Payment amount in minor units of currency, 1999 means 19.99, 10 means 0.10
    ///   - paymentCurrency: Payment currency in ISO 4217 alpha-3 format
    @objc(initWithProjectID:paymentID:paymentAmount:paymentCurrency:)
    public init(projectID: Int32,
                paymentID: String,
                paymentAmount: Int64,
                paymentCurrency: String) {
        self.paymentInfo = PaymentInfo.companion.create(projectId: projectID,
                                                        paymentId: paymentID,
                                                        paymentAmount: paymentAmount,
                                                        paymentCurrency: paymentCurrency)
        super.init()
    }

    @objc public var signature: String? {
        get { paymentInfo.signature }
        set { paymentInfo.signature = newValue }
    }

    @objc public var forcePaymentMethod: String? {
        get { paymentInfo.forcePaymentMethod }
        set { paymentInfo.forcePaymentMethod = newValue }
    }

    @objc public var paramsForSignature: String {
        paymentInfo.getParamsForSignature()
    }
}
