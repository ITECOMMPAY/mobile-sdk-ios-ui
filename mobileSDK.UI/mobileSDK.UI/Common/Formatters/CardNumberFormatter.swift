//
//  CardNumberFormatter.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 25.07.2022.
//

import Foundation

class CardNumberFormatter: Formatter {
    func addSpaces(in string: String) -> String {
        return string.insertSpaces(each: 4)
    }

    func removeSpaces(in string: String) -> String {
        return string.replacingOccurrences(of: " ", with: "")
    }

    // MARK: - Overriden methods

    override func string(for obj: Any?) -> String? {
        if let string = obj as? String {
            return addSpaces(in: string)
        }
        return nil
    }

    override func getObjectValue(_ obj: AutoreleasingUnsafeMutablePointer<AnyObject?>?, for string: String, errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>?) -> Bool {
        obj?.pointee = removeSpaces(in: string) as AnyObject
        return true
    }
}

extension String {

    func insertSpaces(each symbols: Int) -> String {
        var text = self as NSString
        var components: [String] = []

        while text.length > 0 {
            let subString = text.substring(to: min(text.length, symbols))
            components.append(subString)
            text = text.substring(from: min(text.length, symbols)) as NSString
        }

        return components.joined(separator: " ")
    }
}
