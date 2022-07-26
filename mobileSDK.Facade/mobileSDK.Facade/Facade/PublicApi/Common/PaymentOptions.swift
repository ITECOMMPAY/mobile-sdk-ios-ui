//
//  PaymentOptions.swift
//  mobilesdk-ios
//
//  Copyright © 2018 Ecommpay. All rights reserved.
//

import Foundation
import UIKit
import MsdkCore

public class PaymentOptions: NSObject {
    /// PaymentInfo contains this required fields:
    /// - **projectID** - Unique identifier of your project
    /// - **paymentID** - Unique identifier of the payment in your project
    /// - **paymentAmount** - Payment amount in minor units of currency, 1999 means 19.99, 10 means 0.10
    /// - **paymentCurrency** - Payment currency in ISO 4217 alpha-3 format
    /// - **customerId** - Unique identifier of the customer in your project
    /// and other optional params, complete reference of those presented in documentation
    public var paymentInfo: PaymentInfo

    @objc public enum ActionType: Int {
        case Sale = 1
        case Auth = 2
        case Tokenize = 3
        case Verify = 4
    }

    /// Payment logo image
    public var logoImage: UIImage?
    /// Payment description, for example, T-Shirt with print
    public var paymentDescription: String?
    /// Region code of a customer
    public var regionCode: String?
    /// Action of payment, by default its Sale
    public var action: ActionType? = .Sale
    /// Object that holds recurrent info
    public var recurrentInfo: RecurrentInfo?
    /// Apple Pay Merchant ID
    public var applePayMerchantID: String?
    /// Apple Pay Description
    public var applePayDescription: String?
    /// Token of saved card
    public var token: String?
    /// Fields that are known, if visible -> would be pre-filled
    public var additionalFields: [AdditionalField]?
    /// Application language code
    public var languageCode: String?
    /// Force open payment method
    public var forcePaymentMethod: String?
    /// Receipt data base64
    public var receiptData: String?
    /// The reference to an instance of Recipient Info data class should be assagned for auth actions with support FT amd F52 fundings
    @objc public var recipientInfo: RecipientInfo?
    /// Hide saved wallets
    public var hideSavedWallets: Bool?

    /// Display mode
    #if ODTSDK
    public var screenDisplayModes: [ODTScreenDisplayMode]? {
        didSet {
            internalScreenDisplayModes = (screenDisplayModes?.map { $0.internalScreenDisplayMode }).map(Set.init)
        }
    }
    #elseif JETPAY
    public var screenDisplayModes: [JetpayHostsScreenDisplayMode]? {
        didSet {
            internalScreenDisplayModes = (screenDisplayModes?.map { $0.internalScreenDisplayMode }).map(Set.init)
        }
    }
    #else
    public var screenDisplayModes: [ECMPScreenDisplayMode]? {
        didSet {
            internalScreenDisplayModes = (screenDisplayModes?.map { $0.internalScreenDisplayMode }).map(Set.init)
        }
    }
    #endif

    /// Params for 3Ds 2.0
    private var secureInfo: ThreeDSecureInfo?

    /// Display mode internal
    internal var internalScreenDisplayModes: Set<ScreenDisplayMode>?

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
        self.paymentDescription = paymentDescription
        self.paymentInfo.customerId = customerID
        self.regionCode = regionCode
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

    /// Sign a request
    ///
    /// - Parameter value: signature
    @objc(setSignature:)
    public func setSignature(value: String) {
        paymentInfo.signature = value
    }

    /// Set receipt data
    ///
    /// - Parameter value: Base64
    @objc(setReceiptData:)
    public func setReceiptData(value: String) {
        receiptData = value
    }

    /// Set Token of payment card
    ///
    /// - Parameter value: token
    @objc(setToken:)
    public func setToken(value: String) {
        token = value
    }

    /// Set Action of payment, by default its Sale
    /// Could be: Sale/Auth/Tokenize/Verify
    ///
    /// - Parameter ActionType: type of operation
    @objc(setAction:)
    public func setAction(action: ActionType) {
        self.action = action
    }

    /// If set, would treat payment as recurrent
    ///
    /// - Parameter recurrent: RecurrentInfo object
    @objc(setRecurret:)
    public func setRecurrent(recurrent: RecurrentInfo) {
        recurrentInfo = recurrent
    }

    /// If you want to use Apple Pay, you would need to set MerchantID from developer.apple.com
    ///
    /// - Parameter merchantID: Your MerchantID in Apple Pay
    @objc(setApplePayMerchantID:)
    public func setApplePayMerchantID(merchantID: String) {
        applePayMerchantID = merchantID
    }

    ///
    ///
    /// - Parameter applePayDescription: Your description for Apple Pay page
    @objc(setApplePayDescription:)
    public func setApplePayDescription(description: String) {
        applePayDescription = description
    }

    /// If you know any data for fields what would be asked from a user
    /// you could set them and they would be pre-filled
    /// - Parameter additionalFields: Additional fields for collecting customer information
    @objc(setAdditionalFields:)
    public func setAdditionalFields(additionalFields: [AdditionalField]) {
        self.additionalFields = additionalFields
    }

    /// Setting the language regardless of the system
    /// - Parameter value: Language code, example: en (English) or ru (Russian)
    @objc(setLanguageCode:)
    public func setLanguageCode(value: String) {
        languageCode = value
    }

    /// - Parameter secureInfo: Parameters for 3D secure 2.0
    @objc(setSecureInfo:)
    public func setSecureInfo(secureInfo: ThreeDSecureInfo) {

    }

    /// - Parameter value: Parameter for hide saved wallets
    @objc(setHideSavedWallets:)
    public func setHideSavedWallets(value: Bool) {
        hideSavedWallets = value
    }

    /// - Parameter value: Forced opening of a payment method
    @objc(setForcePaymentMethod:)
    public func setForcePaymentMethod(value: String) {
        forcePaymentMethod = value
    }

    /// You can hide this or that screen based on the passed parameters
    ///
    /// - Parameter screenDisplayMode: Option to hide the result screen
    #if ODTSDK
    @objc(addScreenDisplayMode:)
    public func addScreenDisplayMode(screenDisplayMode: ODTScreenDisplayMode) -> PaymentOptions {
        return self.addScreenDisplayMode(screenDisplayMode: screenDisplayMode.internalScreenDisplayMode)
    }
    #elseif JETPAY
    @objc(addScreenDisplayMode:)
    public func addScreenDisplayMode(screenDisplayMode: JetpayHostsScreenDisplayMode) -> PaymentOptions {
        return self.addScreenDisplayMode(screenDisplayMode: screenDisplayMode.internalScreenDisplayMode)
    }
    #else
    @objc(addEcmpScreenDisplayMode:)
    public func addScreenDisplayMode(screenDisplayMode: ECMPScreenDisplayMode) -> PaymentOptions {
        return self.addScreenDisplayMode(screenDisplayMode: screenDisplayMode.internalScreenDisplayMode)
    }
    #endif

    private func addScreenDisplayMode(screenDisplayMode: ScreenDisplayMode) -> PaymentOptions {
        internalScreenDisplayModes = internalScreenDisplayModes.map {
            $0.union([screenDisplayMode])
        } ?? [screenDisplayMode]
        return self
    }

    /// You can hide this or that screen based on the passed parameters
    /// Important !!! The parameter will be converted into an enumeration, if the data is not transferred correctly, it will be ignored.
    /// - Parameter screenDisplayMode: Option to hide the result screen. Parameter
    @objc(addScreenDisplayModeString:)
    public func addScreenDisplayMode(value: String) -> PaymentOptions {
        #if ODTSDK
        let cases = ODTScreenDisplayMode.allCases
        #elseif JETPAY
        let cases = JetpayHostsScreenDisplayMode.allCases
        #else
        let cases = ECMPScreenDisplayMode.allCases
        #endif

        if let screenDisplayMode = cases.first(where: { mode in mode.description == value }) {
            return addScreenDisplayMode(screenDisplayMode: screenDisplayMode)
        }
        return self
    }

    /// Get composed string with params for signatue
    ///
    /// - Returns: Composed params string
    @objc(getParamsForSignature)
    public func getParamsForSignature() -> String {
        return paymentInfo.getParamsForSignature()
    }
}
