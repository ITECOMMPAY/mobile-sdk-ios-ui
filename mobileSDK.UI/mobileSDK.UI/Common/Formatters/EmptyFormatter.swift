//
//  EmptyFormatter.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 25.07.2022.
//

import Foundation

/// Formatter that doing nothing
class EmptyFormatter: Formatter {
    // MARK: - Overriden methods

    override func string(for obj: Any?) -> String? {
        if let string = obj as? String {
            return string
        }
        return nil
    }

    override func getObjectValue(_ obj: AutoreleasingUnsafeMutablePointer<AnyObject?>?, for string: String, errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>?) -> Bool {
        obj?.pointee = string as AnyObject
        return true
    }
}
