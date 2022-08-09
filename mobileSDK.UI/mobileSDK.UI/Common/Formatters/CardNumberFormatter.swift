//
//  CardNumberFormatter.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 25.07.2022.
//

import Foundation

class CardNumberFormatter: Formatter {
    let cardTypeRecognizer: CardTypeRecognizer

    init(cardTypeRecognizer: CardTypeRecognizer) {
        self.cardTypeRecognizer = cardTypeRecognizer
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addSpaces(in string: String) -> String {
        let cardType: CardType = cardTypeRecognizer.getCardType(for: string)?.cardType ?? .unknown
        return cardType.formattedString(from: string)
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
    func starts(between initial: String, and final: String) -> Bool {
        let maxCount = max(initial.count, final.count)
        guard
            let initialNumber = Int(initial),
            let finalNumber = Int(final),
            let prefix = Int(self.prefix(maxCount))
        else { return false }

        let initialNormalized = initialNumber * (maxCount - initial.count + 1)
        let finalNormalized = finalNumber  * (maxCount - final.count + 1)

        return prefix >= initialNormalized && prefix <= finalNormalized
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
        case .master5, .visa, .maestro, .mir:
            return [4, 4, 4, 4]
        case .dinersClub:
            return [4, 6, 4]
        case .unknown, .forbrugsforeningen, .solo, .dankort, .switch_, .troy, .napas, .cup, .laser, .uzcard, .belcard:
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
