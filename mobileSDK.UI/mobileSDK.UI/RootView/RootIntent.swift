//
//  RootIntent.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 01.08.2022.
//

import Foundation

enum RootIntent {
    case initialLoadingScreenIntent(InitialLoadingScreenIntent)
    case paymentMethodsScreenIntent(PaymentMethodsIntent)
    case customerFieldsScreenIntent(CustomerFieldsScreenIntent)
    case clarificationFieldsScreenIntent(ClarificationFieldsScreenIntent)
    case closeErrorAlert
    case successScreenIntent(ResultSuccessScreenIntent)
    case declineScreenIntent(ResultDeclineScreenIntent)
    case threeDSecureScreenIntent(ThreeDSecureScreenIntent)
    case apsScreenIntent(ApsScreenIntent)
}
