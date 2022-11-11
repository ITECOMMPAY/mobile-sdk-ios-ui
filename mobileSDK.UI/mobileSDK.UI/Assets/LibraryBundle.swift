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
