//
//  NavigationComponentState.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 01.08.2022.
//

import Foundation

enum SDKScreen {
    case none
    case initialLoading
    case paymentMethods // aka "main"
    case customerFields
    case clarificationFields
    case acsPage
    case loading
    case successResult
    case declineResult
}

struct NavigationComponentState {
    let currentScreen: SDKScreen
}
