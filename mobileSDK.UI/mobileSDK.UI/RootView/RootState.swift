//
//  RootState.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 01.08.2022.
//

import Foundation

// MARK: - Stored properties
/// Корневое состояние на основе которого строится представление всех экранов
struct RootState {
    var isLoading: Bool = false
    var currentMethod: PaymentMethodsListEntity?
    var payment: Payment?
    var customerFields: [CustomerField]?
    var clarificationFields: [ClarificationField]?
    var alertModel: AlertModel?
    var savedAccounts: [SavedAccount]?
    var availablePaymentMethods: [PaymentMethod]?
    var paymentOptions: PaymentOptions
    var finalPaymentState: FinalPaymentState?
    var acsPageState: AcsPageState?
    var apsPaymentMethod: PaymentMethod?
    var savedValues: [PaymentMethodsListEntity: FormData]
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

    /// Уведомление об ошибке после которой продолжение сценария оплаты невозможно
    case FinalError(CoreError, onClose: Action?)
    /// Уведомление о не критичной ошибке
    case InfoError(CoreError, onClose: Action?)
    /// Предупреждение о закрытии страницы оплаты
    case CloseWarning(confirmClose: Action?)
    /// Уведомление о завершении токенизации
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
        switch paymentOptions.action {
        case .Sale:
            return saleCurrentScreen
        case .Tokenize:
            return tokenizeCurrentScreen
        default:
            return SDKScreen.none
        }
    }
    
    private var saleCurrentScreen: SDKScreen {
        if let finalPaymentState = finalPaymentState {
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

        if acsPageState != nil {
            return .acsPage
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
    
    private var tokenizeCurrentScreen: SDKScreen {
        if finalPaymentState != nil {
            return .none
        }
        
        if isLoading {
            if availablePaymentMethods == nil {
                return .initialLoading
            }
            return .loading
        }
        
        if let customerFields = customerFields, !customerFields.isEmpty {
            return .customerFields
        }

        if availablePaymentMethods != nil {
            return .paymentMethods
        }

        return .none
    }
    
    var isTokenSale: Bool {
        paymentOptions.action == .Sale && paymentOptions.token != nil
    }
}

// MARK: - State structs
enum FinalPaymentState {
    case Decline(paymentMessage: String?, isTryAgain: Bool)
    case Success
}

struct AcsPageState: Equatable {
    var acsPage: AcsPage?
    var isCascading: Bool = false
    static func == (lhs: AcsPageState, rhs: AcsPageState) -> Bool {
        return lhs.isCascading == rhs.isCascading && lhs.acsPage?.acsUrl == rhs.acsPage?.acsUrl
    }
}

struct ApsPageState {
    var apsMethod: PaymentMethod?
}