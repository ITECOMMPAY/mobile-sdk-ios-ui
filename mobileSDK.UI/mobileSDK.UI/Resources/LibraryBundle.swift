//
//  LibraryBundle.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 16.06.2022.
//

import Foundation

class SDKBundle: Bundle {
    static func get() -> Bundle {
        // For Swift Package Manager, try to find the resource bundle first
        if let resourceBundleURL = Bundle.main.url(forResource: "EcommpaySDK_EcommpaySDK", withExtension: "bundle"),
           let resourceBundle = Bundle(url: resourceBundleURL) {
            return resourceBundle
        }
        
        // Fallback to the old method for framework builds
        return Bundle(for: SDKBundle.self)
    }
}

extension SDKBundle {
    static var localizationFramework: Bundle {
        let bundle = Bundle(for: SDKBundle.self)

        guard
            let bundlePath = bundle.path(forResource: currentLanguage(of: bundle), ofType: "lproj"),
            let localizedBundle = Bundle(path: bundlePath) else { return bundle }

        return localizedBundle
    }

    static func currentLanguage(of bundle: Bundle) -> String {
        return String(Locale.current.identifier.prefix(2))
    }
}
