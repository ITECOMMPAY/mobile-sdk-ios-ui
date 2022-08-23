//
//  PaymentOptions.swift
//  mobilesdk-ios
//
//  Copyright © 2018 Ecommpay. All rights reserved.
//

import Foundation
import UIKit
import MsdkCore
import mobileSDK_UI
import UIKit


@objc public enum MockModeType: Int {
    case disabled
    case success
    case decline
}


public class PaymentOptions: NSObject {
    /// PaymentInfo contains this required fields:
    /// - **projectID** - Unique identifier of your project
    /// - **paymentID** - Unique identifier of the payment in your project
    /// - **paymentAmount** - Payment amount in minor units of currency, 1999 means 19.99, 10 means 0.10
    /// - **paymentCurrency** - Payment currency in ISO 4217 alpha-3 format
    /// - **customerId** - Unique identifier of the customer in your project
    /// and other optional params, complete reference of those presented in documentation
    @objc public var paymentInfo: PaymentInfo

    @objc public enum ActionType: Int {
        case Sale = 1
        case Auth = 2
        case Tokenize = 3
        case Verify = 4
    }

    /// Payment logo image
    @objc public var logoImage: UIImage? = nil

    /// Brand color
    @objc public var brandColor: UIColor? = nil

    /// mock Mode type
    @objc public var mockModeType: MockModeType = .disabled
    
    /// Action of payment, by default its Sale
    @objc public var action: ActionType = .Sale

    /// Object that holds recurrent info
    /// If set, would treat payment as recurrent
    @objc public var recurrentInfo: RecurrentInfo?

    /// 3ds2.0
    @objc public var threeDSecureInfo: ThreeDSecureInfo?

    /// Apple Pay Merchant ID
    /// If you want to use Apple Pay, you would need to set MerchantID from developer.apple.com
    @objc public var applePayMerchantID: String?
    /// Apple Pay Description
    @objc public var applePayDescription: String?
 
    /// If you know any data for fields what would be asked from a user
    /// you could set them and they would be pre-filled
    /// Fields that are known, if visible -> would be pre-filled
    @objc public var additionalFields: [AdditionalField]?

    /// Receipt data base64
    @objc public var receiptData: String?
    /// The reference to an instance of Recipient Info data class should be assagned for auth actions with support FT amd F52 fundings
    @objc public var recipientInfo: RecipientInfo?
    /// Hide saved wallets
    @objc public var hideSavedWallets: Bool = false

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
    @objc(initWithProjectID:paymentID:paymentAmount:paymentCurrency:paymentDescription:customerID:regionCode:)
    public init(projectID: Int32,
                paymentID: String,
                paymentAmount: Int64,
                paymentCurrency: String,
                paymentDescription: String?,
                customerID: String?,
                regionCode: String?) {
        self.paymentInfo = PaymentInfo.companion.create(projectId: projectID,
                                                        paymentId: paymentID,
                                                        paymentAmount: paymentAmount,
                                                        paymentCurrency: paymentCurrency)
        self.paymentInfo.paymentDescription = paymentDescription
        self.paymentInfo.customerId = customerID
        self.paymentInfo.regionCode = regionCode
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

}
