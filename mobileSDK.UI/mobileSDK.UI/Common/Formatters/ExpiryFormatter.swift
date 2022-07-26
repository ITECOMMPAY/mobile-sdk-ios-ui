//
//  ExpiryFormatter.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 25.07.2022.
//

import Foundation

class ExpiryFormatter: Formatter {

    func addFormating(in string: String) -> String {
        let mask = "##/##"
        var result = ""
        var index = string.startIndex
        for ch in mask where index < string.endIndex {
            if ch == "#" {
                result.append(string[index])
                index = string.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }

    func removeFormatting(in string: String) -> String {
        return string.replacingOccurrences(of: "/", with: "")
    }

    // MARK: - Overriden methods

    override func string(for obj: Any?) -> String? {
        if let string = obj as? String {
            return addFormating(in: string)
        }
        return nil
    }

    override func getObjectValue(_ obj: AutoreleasingUnsafeMutablePointer<AnyObject?>?, for string: String, errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>?) -> Bool {
        obj?.pointee = removeFormatting(in: string) as AnyObject
        return true
    }
}
