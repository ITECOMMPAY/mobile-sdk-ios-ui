//
//  mobileSDK_SampleAppApp.swift
//  mobileSDK.SampleApp
//
//  Created by Ivan Krapivtsev on 18.08.2022.
//

import SwiftUI
import AppCenter
import AppCenterCrashes

@main
struct mobileSDK_SampleApp: App {
    init() {
        AppCenter.start(withAppSecret: "4b91c9e7-50df-4b5a-9b76-acfcb8c8d281", services: [
            Crashes.self
        ])
    }

    var body: some Scene {
        WindowGroup {
            MainScreen()
        }
    }
}
