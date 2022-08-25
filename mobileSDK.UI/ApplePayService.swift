//
//  ApplePayService.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 24.08.2022.
//

import PassKit

class ApplePayService: NSObject {

    static let supportedPaymentNetworks = [
        PKPaymentNetwork.visa,
        PKPaymentNetwork.masterCard,
        PKPaymentNetwork.maestro,
        PKPaymentNetwork.amex
    ]

    var isAvailable: Bool {
        return PKPaymentAuthorizationController.canMakePayments(usingNetworks: ApplePayService.supportedPaymentNetworks)
    }

    func createRequest(with options: PaymentOptions) -> PKPaymentRequest? {
        guard let applePayMerchantID = options.applePayMerchantID else {
            return nil
        }
        let request = PKPaymentRequest()
        request.currencyCode = options.summary.currency
        if let countryCode = options.appleCountryCode {
            request.countryCode = countryCode
        }
        request.merchantIdentifier = applePayMerchantID
        request.merchantCapabilities = PKMerchantCapability.capability3DS
        request.supportedNetworks = ApplePayService.supportedPaymentNetworks
        request.paymentSummaryItems = [
            PKPaymentSummaryItem(label: options.applePayDescription ?? options.paymentID ,
                                 amount: options.summary.value as NSDecimalNumber)
        ]
        return request
    }

    func presentPayment(with request: PKPaymentRequest) {
        let controller = PKPaymentAuthorizationController(paymentRequest: request)
        controller.delegate = self
        controller.present {
            if !$0 {
                self.onApplePayResult?(.failToPresent)
            }
        }
    }

    var onApplePayResult: ((ApplePayResult) -> Void)? = nil
    private(set) var paymentCompletion: ((PKPaymentAuthorizationResult) -> Void)?
}

enum ApplePayResult {
    case failToPresent
    case canceled
    case didAuthorizePayment(token: String)
}

extension ApplePayService: PKPaymentAuthorizationControllerDelegate  {
    func paymentAuthorizationControllerDidFinish(_ controller: PKPaymentAuthorizationController) {
        onApplePayResult?(.canceled)
    }

    func paymentAuthorizationController(_ controller: PKPaymentAuthorizationController,
                                        didAuthorizePayment payment: PKPayment,
                                        handler completion: @escaping (PKPaymentAuthorizationResult) -> Void) {
        let token = String(decoding: payment.token.paymentData, as: UTF8.self)
        paymentCompletion = completion
        onApplePayResult?(.didAuthorizePayment(token: token))
    }
}
