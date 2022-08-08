//
//  InputMaskFormatter.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 05.08.2022.
//

import Foundation

class InputMaskFormatter: Formatter {
    let maskCharacter: Character = "#"
    var mask: String

    init(with mask: String) {
        self.mask = mask
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addFormating(in string: String) -> String {
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
        let formatCharacters = mask.filter { $0 != maskCharacter }
        return string.filter { !formatCharacters.contains($0) }
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
