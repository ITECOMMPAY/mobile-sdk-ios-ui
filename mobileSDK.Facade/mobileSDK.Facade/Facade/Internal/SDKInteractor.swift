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
    #if DEVELOPMENT
        msdkConfig = MSDKCoreSessionConfig.companion.debug(apiHost: Config.app.apiHost,
                                                           wsApiHost: Config.app.socketHost)
    #else
        msdkConfig = MSDKCoreSessionConfig.companion.release(apiHost: Config.app.apiHost,
                                                             wsApiHost: Config.app.socketHost)
    #endif
    }

    public init(apiUrlString: String, socketUrlString: String) {
        #if DEVELOPMENT
        msdkConfig = MSDKCoreSessionConfig.companion.debug(
            apiHost: apiUrlString,
            wsApiHost: socketUrlString
        )
        #else
        msdkConfig = MSDKCoreSessionConfig.companion.release(
            apiHost: apiUrlString,
            wsApiHost: socketUrlString
        )
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
            msdkConfig = MSDKCoreSessionConfig.companion.mockFullSuccessFlow(
                duration: .companion.seconds(seconds: 2)
            )
        } else if paymentOptions.mockModeType == .decline {
            msdkConfig = MSDKCoreSessionConfig.companion.mockFullDeclineFlow(
                duration: .companion.seconds(seconds: 2)
            )
        }

        msdkConfig.userAgentData = UserAgentData(
            screenInfo: .init(width: Int32(UIScreen.main.bounds.width),
                              height: Int32(UIScreen.main.bounds.height)),
            applicationInfo: .init(version: Ecommpay.sdkVersion,
                                   bundleId: Bundle.main.bundleIdentifier,
                                   appName: Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String))

        let msdkSession = MSDKCoreSession(config: msdkConfig)
        setupDependency(with: msdkSession)

        self.completionHandler = completion

        let delegateProxy = InitDelegateProxy()

        let view = ViewFactory.assembleRootView(
            paymentOptions: paymentOptions.uiPaymentOptions(msdkSession: msdkSession),
            initPublisher: delegateProxy.createPublisher(with: { delegate in
                let initRequest =  InitRequest(
                    paymentInfo: paymentOptions.paymentInfo,
                    recurrentInfo: paymentOptions.recurrentInfo?.coreRecurrentInfo,
                    additionalFields: paymentOptions.additionalFields?.map {
                        CustomerFieldValue(name: $0.wrapper.name, value: $0.wrapper.value)
                    } ?? []
                )
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

    internal static func getCoreVersion() -> String {
        return MSDKCoreSession.companion.metadata.version
    }
}

fileprivate extension PaymentOptions {
    func uiPaymentOptions(msdkSession: MSDKCoreSession) -> some mobileSDK_UI.PaymentOptions {
        PaymentOptionsWrapper(publicType: self, msdkSession: msdkSession)
    }
}

private struct PaymentOptionsWrapper: mobileSDK_UI.PaymentOptions {
    var footerImage: Image? {
        publicType.footerImage.map({ Image(uiImage: $0)})
    }
    
    let publicType: PaymentOptions
    let msdkSession: MSDKCoreSession
    
    var action: ActionType {
        ActionType.init(rawValue: publicType.action.rawValue) ?? .Sale
    }
    
    var languageCode: String? {
        publicType.languageCode
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

    var primaryBrandColorOverride: Color? {
        if let uiColor = publicType.primaryBrandColor {
            return Color(uiColor)
        } else {
            return nil
        }
    }
    
    var secondaryBrandColorOverride: Color? {
        if let uiColor = publicType.secondaryBrandColor {
            return Color(uiColor)
        } else {
            return nil
        }
    }

    var isDarkThemeOn: Bool {
        publicType.isDarkThemeOn
    }

    var isMockModeEnabled: Bool {
        publicType.mockModeType != .disabled
    }

    var uiAdditionalFields: [mobileSDK_UI.AdditionalField] {
        publicType.additionalFields?.map { $0.wrapper } ?? [] as [mobileSDK_UI.AdditionalField]
    }

    var summary: PaymentSummaryData {
        return PaymentSummaryData(
            logo: publicType.logoImage.map({ Image(uiImage: $0)}),
            currency: publicType.paymentInfo.paymentCurrency,
            value: msdkSession.getPaymentAmountInMajorUnits()
                .flatMap(CurrencyAmountFormatter.decimal)
                ?? CurrencyAmountFormatter.decimal(
                    minorUnits: publicType.paymentInfo.paymentAmount,
                    currencyExponent: nil
                ),
            currencyExponent: currencyExponent
        )
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

    var paymentDescription: String? {
        publicType.paymentInfo.paymentDescription
    }
    
    var token: String? {
        publicType.paymentInfo.token
    }
    
    var storedCarType: Int32? {
        publicType.storedCardType?.int32Value
    }


    var recipientInfo: mobileSDK_UI.RecipientInfo? {
        publicType.recipientInfo?.wrapper
    }

    var screenDisplayModes: Set<mobileSDK_UI.ScreenDisplayMode> {
        return Set<mobileSDK_UI.ScreenDisplayMode>(
            publicType.screenDisplayModes.compactMap({
                guard let mode = mobileSDK_UI.ScreenDisplayMode(rawValue: $0.rawValue) else { return nil }
                
                return mode
            })
        )
    }

    var recurringRegister: Bool {
        publicType.recurrentInfo?.register == true
    }

    var recurringRegular: Bool {
        publicType.recurrentInfo?.type == .Regular
    }

    var recurringDetails: [RecurringDetailsData] {
        let recurrentInfo = publicType.recurrentInfo

        guard recurrentInfo?.register == true, recurrentInfo?.type == .Regular else {
            return []
        }
        
        var recurringDetails: [RecurringDetailsData] = []
        
        if action == .Verify {
            recurringDetails.append(
                RecurringDetailsData(
                    title: L.recurring_charged_right_now,
                    description: .value(
                        formattedRecurringAmount(minorUnits: 0)
                            + " "
                            + publicType.paymentInfo.paymentCurrency
                    )
                )
            )
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        if let start = recurrentInfo?.startDate, let startDate = dateFormatter.date(from: start) {

            dateFormatter.dateFormat = "LLLL d, yyyy"
            let startDateText = dateFormatter.string(from: startDate)

            recurringDetails.append(
                RecurringDetailsData(
                    title: L.recurring_start_date,
                    description: .value(startDateText)
                )
            )
        }

        let paymentAmount: Int64
        if let recurrentAmount = recurrentInfo?.amount {
            paymentAmount = Int64(recurrentAmount)
        } else {
            paymentAmount = publicType.paymentInfo.paymentAmount
        }
        recurringDetails.append(
            RecurringDetailsData(
                title: L.recurring_amount,
                description: .value(
                    formattedRecurringAmount(minorUnits: paymentAmount)
                        + " "
                        + publicType.paymentInfo.paymentCurrency
                )
            )
        )

        if let frequency = recurrentInfo?.period, recurrentInfo?.interval == nil || recurrentInfo?.interval == 1 {
            let period: L
            switch frequency {
            case .Day: period = L.recurring_period_daily
            case .Week: period = L.recurring_period_weekly
            case .Month: period = L.recurring_period_monthly
            case .Quarter: period = L.recurring_period_quarterly
            case .Year: period = L.recurring_period_annually
            }

            recurringDetails.append(
                RecurringDetailsData(
                    title: L.recurring_period_label,
                    description: .localizable(period)
                )
            )
        }
        
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        if let expiryDay = recurrentInfo?.expiryDay, let expiryMonth = recurrentInfo?.expiryMonth,
           let expiryYear = recurrentInfo?.expiryYear,
           let expiryDate = dateFormatter.date(from: "\(expiryDay)-\(expiryMonth)-\(expiryYear)") {
            
            dateFormatter.dateFormat = "LLLL d, yyyy"
            let expiryText = dateFormatter.string(from: expiryDate)
            
            recurringDetails.append(
                RecurringDetailsData(
                    title: L.recurring_type_expiry_date,
                    description: .value(expiryText)
                )
            )
        }
        
        return recurringDetails
    }

    private var currencyExponent: Int {
        CurrencyAmountFormatter.validExponent(
            Int(msdkSession.getCurrencyExponent()?.intValue ?? 2)
        )
    }

    private func formattedRecurringAmount(minorUnits: Int64) -> String {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = currencyExponent
        formatter.minimumFractionDigits = currencyExponent

        let amount = CurrencyAmountFormatter.decimal(
            minorUnits: minorUnits,
            currencyExponent: currencyExponent
        )
        return formatter.string(for: amount as NSDecimalNumber)
            ?? CurrencyAmountFormatter.string(
                minorUnits: minorUnits,
                currencyExponent: currencyExponent
            )
    }

    var recurringDisclaimer: L? {
        let recurrentInfo = publicType.recurrentInfo
        
        guard recurrentInfo?.register == true else { return nil }

        return recurrentInfo?.type == .Regular ? L.recurring_type_regular : L.recurring_type_express
    }

    var hideScanningCards: Bool {
        publicType.hideScanningCards
    }
    
    var hideFooterLogo: Bool {
        publicType.hideFooterLogo
    }
}

private enum CurrencyAmountFormatter {
    private static let defaultCurrencyExponent = 2
    private static let maximumCurrencyExponent = 18
    private static let posixLocale = Locale(identifier: "en_US_POSIX")

    static func validExponent(_ currencyExponent: Int?) -> Int {
        guard let currencyExponent,
              (0...maximumCurrencyExponent).contains(currencyExponent) else {
            return defaultCurrencyExponent
        }
        return currencyExponent
    }

    static func decimal(_ majorUnits: String) -> Decimal? {
        Decimal(string: majorUnits, locale: posixLocale)
    }

    static func decimal(minorUnits: Int64, currencyExponent: Int?) -> Decimal {
        Decimal(
            string: string(
                minorUnits: minorUnits,
                currencyExponent: currencyExponent
            ),
            locale: posixLocale
        ) ?? .zero
    }

    static func string(minorUnits: Int64, currencyExponent: Int?) -> String {
        let exponent = validExponent(currencyExponent)
        let amount = String(minorUnits)
        guard exponent > 0 else { return amount }

        let isNegative = amount.hasPrefix("-")
        let digits = isNegative ? String(amount.dropFirst()) : amount
        let paddedDigits = String(repeating: "0", count: max(0, exponent - digits.count + 1)) + digits
        let separatorIndex = paddedDigits.index(paddedDigits.endIndex, offsetBy: -exponent)
        let majorUnits = String(paddedDigits[..<separatorIndex])
            + "."
            + String(paddedDigits[separatorIndex...])

        return (isNegative ? "-" : "") + majorUnits
    }
}
