//
//  RootState.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 01.08.2022.
//

import Foundation

// MARK: - Stored properties
/// Корневое состояние на основе которого строится предствление всех экранов
struct RootState {
    var isLoading: Bool = false
    var currentScreen: SDKScreen = .initialLoading
    var currentMethod: PaymentMethodsListEntity?
    var payment: Payment?
    var customerFields: [CustomerField]?
    var clarificationFields: [ClarificationField]?
    var error: CoreError?
    var savedAccounts: [SavedAccount]?
    var availablePaymentMethods: [PaymentMethod]?
    var paymentOptions: PaymentOptions
}

// MARK: - Computed properties
extension RootState {}
