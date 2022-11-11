//
//  CardNumberTransformation.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 25.07.2022.
//

import Foundation

struct CardNumberTransformation: CustomFormatterTransformation {
    let cardTypeRecognizer: CardTypeRecognizer

    init(cardTypeRecognizer: CardTypeRecognizer) {
        self.cardTypeRecognizer = cardTypeRecognizer
    }

    func formattedString(from string: String) -> String {
        let cardType: CardType = cardTypeRecognizer.getCardType(for: string)?.cardType ?? .unknown
        return cardType.formattedString(from: string)
    }

    func rawString(from string: String) -> String {
        return string.replacingOccurrences(of: " ", with: "")
    }
}

fileprivate extension CardType {
    var blocks: [Int] {
        switch self {
        case .discover:
            return [4, 4, 4, 4, 3]
        case .amex:
            return [4, 6, 5]
        case .jcb:
            return [4, 4, 4, 4, 3]
        case .mastercard, .visa, .maestro, .mir:
            return [4, 4, 4, 4]
        case .diners_club:
            return [4, 6, 4]
        case .unknown, .forbrugsforeningen, .dankort, .switch, .cup, .belcard:
            return [4]
        }
    }

    func formattedString(from string: String, delimiter: String = " ", repeatLastBlock: Bool = true) -> String {
        var invertedBlocks = Array(blocks.reversed())
        var formattedString = ""
        var subIdx = 0
        guard var currentBlock = invertedBlocks.popLast() else { return formattedString }
        for character in string {
            if subIdx == currentBlock {
                if let nextBlock = invertedBlocks.popLast() {
                    formattedString.append(delimiter)
                    subIdx = 0
                    currentBlock = nextBlock
                } else {
                    if repeatLastBlock {
                        formattedString.append(delimiter)
                        subIdx = 0
                    } else {
                        return formattedString
                    }
                }
            }
            formattedString.append(character)
            subIdx += 1
        }

        return formattedString
    }
}
