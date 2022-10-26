//
//  InputMaskTransformation.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 05.08.2022.
//

import Foundation

struct InputMaskTransformation: CustomFormatterTransformation {

    let maskCharacter: Character = "#"

    let unmaskingEnabled: Bool
    var mask: String

    init(with mask: String, unmaskingEnabled: Bool = true) {
        self.mask = mask
        self.unmaskingEnabled = unmaskingEnabled
    }

    func formattedString(from string: String) -> String {
        var result = ""
        var index = string.startIndex
        for ch in mask where index < string.endIndex {
            if ch == "#" {
                result.append(string[index])
                index = string.index(after: index)
            } else if string[index] == ch {
                result.append(string[index])
                index = string.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    } 

    func rawString(from string: String) -> String {
        guard unmaskingEnabled
        else {
            return string
        }
        let formatCharacters = mask.filter { $0 != maskCharacter }
        return string.filter { !formatCharacters.contains($0) }
    }

   
}
