//
//  LibraryBundle.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 16.06.2022.
//

import Foundation

class SDKBundle: Bundle {
    static func get() -> Bundle {
        return Bundle(for: SDKBundle.self)
    }
}


extension SDKBundle {
    static var localizationFramework: Bundle {
        guard let localizationBundle = Bundle(identifier: "com.ecommpay.mobilesdk-ios-dev") else { return .main }

        guard
            let bundlePath = localizationBundle.path(forResource: currentLanguage(of: localizationBundle),
                                                     ofType: "lproj"),
            let bundle = Bundle(path: bundlePath) else { return .main }

        return bundle
    }

    static func currentLanguage(of bundle: Bundle) -> String {
        return String(Locale.current.identifier.prefix(2))
    }
}
