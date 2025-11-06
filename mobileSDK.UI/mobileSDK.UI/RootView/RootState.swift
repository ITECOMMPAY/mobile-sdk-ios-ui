//
//  RootState.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 01.08.2022.
//

import Foundation

// MARK: - Stored properties
/// The root state on which all screens are based
struct RootState {
    var isLoading: Bool = false
    var isTryAgain: Bool = false
    var currentMethod: PaymentMethodsListEntity?
    var payment: Payment?
    var customerFields: [CustomerField]?
    var clarificationFields: [ClarificationField]?
    var alertModel: AlertModel?
    var savedAccounts: [SavedAccount]?
    var availablePaymentMethods: [PaymentMethod]?
    var paymentOptions: PaymentOptions
    var finalPaymentState: FinalPaymentState?
    var threeDSecurePageState: ThreeDSecurePageState?
    var apsPaymentMethod: PaymentMethod?
    var savedValues: [PaymentMethodsListEntity: FormData]
    var request: PayRequest? = nil
}

struct FormData {
    var cardCVV: String = ""
    var cardNumber: String = ""
    var cardHolder: String = ""
    var cardExpiry: String = ""
    var isCOFAgreementChecked: Bool = false
    var customerFieldValues: [FieldValue] = []
}

enum AlertModel {
    typealias Action = () -> Void

    /// Notification of an error after which the payment scenario cannot be continued
    case FinalError(CoreError, onClose: Action?)
    /// Notification of a non-critical error
    case InfoError(CoreError, onClose: Action?)
    /// Warning about closing the payment page
    case CloseWarning(confirmClose: Action?)
    /// Notification of tokenization completion
    case TokenizeResult(message: String, onClose: Action?)
}

// MARK: - Computed properties
extension RootState {
    var isVatIncluded: Bool {
        guard let entity = currentMethod?.entityType else {
            return false
        }
        switch entity {
        case .savedAccount:
            return availablePaymentMethods?.filter { paymentMethod in
                paymentMethod.methodType == .card
            }.first?.isVatInfo ?? false
        case .paymentMethod(let method):
            return method.isVatInfo
        }
    }

    var currentPaymentMethod: PaymentMethod? {
        guard let entity = currentMethod?.entityType else {
            return nil
        }
        switch entity {
        case .savedAccount:
            return availablePaymentMethods?.filter { paymentMethod in
                paymentMethod.methodType == .card
            }.first
        case .paymentMethod(let method):
            return method
        }
    }

    var currentScreen: SDKScreen {
        if let finalPaymentState = finalPaymentState {
            guard paymentOptions.action != .Tokenize else {
                return .none
            }

            switch finalPaymentState {
            case .Success:
                return .successResult
            case .Decline(paymentMessage: _, isTryAgain: _):
                return .declineResult
            }
        }

        if isLoading {
            if availablePaymentMethods == nil {
                return .initialLoading
            }
            return .loading
        }

        if threeDSecurePageState != nil {
            return .threeDSecurePage
        }

        if clarificationFields != nil {
            return .clarificationFields
        }

        if !visibleCustomerFields.isEmpty {
            return .customerFields
        }

        if apsPaymentMethod != nil {
            return .apsPage
        }

        if availablePaymentMethods != nil {
            return .paymentMethods
        }

        return .none
    }
    
    var isTokenizedAction: Bool {
        (paymentOptions.action == .Sale || paymentOptions.action == .Auth) && paymentOptions.token != nil
    }

    var hideSuccessScreen: Bool {
        paymentOptions.screenDisplayModes.contains(.hideSuccessFinalPage)
    }

    var hideDeclineScreen: Bool {
        paymentOptions.screenDisplayModes.contains(.hideDeclineFinalPage)
    }
}

// MARK: - State structs
enum FinalPaymentState {
    case Decline(paymentMessage: String?, isTryAgain: Bool)
    case Success
}

struct ThreeDSecurePageState: Equatable {
    var threeDSecurePage: ThreeDSecurePage?
    var isCascading: Bool = false

    static func == (lhs: ThreeDSecurePageState, rhs: ThreeDSecurePageState) -> Bool {
        return lhs.isCascading == rhs.isCascading &&
        lhs.threeDSecurePage?.loadUrl == rhs.threeDSecurePage?.loadUrl
    }
}

struct ApsPageState {
    var apsMethod: PaymentMethod?
}
