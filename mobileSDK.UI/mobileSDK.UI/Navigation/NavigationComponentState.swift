//
//  NavigationComponentState.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 01.08.2022.
//

import Foundation

enum SDKScreen {
    case initialLoading
    case paymentMethods // aka "main"
    case customerFields
    case clarificationFields
    case threeDSecurePage
    case apsPage
    case loading
    case successResult
    case declineResult
    case none
}

struct NavigationComponentState {
    let currentScreen: SDKScreen
}
