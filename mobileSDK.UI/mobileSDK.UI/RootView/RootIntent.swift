//
//  RootIntent.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 01.08.2022.
//

import Foundation

enum RootIntent {
    case initialLoadingScreenIntent(InitialLoadingScreenIntent)
    case paymentMethodsScreenIntent(PaymentMethodsIntent)
    case closeErrorAlert
}
