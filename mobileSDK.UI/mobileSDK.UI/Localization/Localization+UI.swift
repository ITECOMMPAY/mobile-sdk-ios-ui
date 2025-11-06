//
//  File.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 29.08.2022.
//

import SwiftUI

extension TranslationWithLink {
    var attributedText: AttributedText {
        AttributedText {
            guard let message = message else { return NSAttributedString(string: "") }
            let result = NSMutableAttributedString(string: message, attributes: textAttributes)
            for linkStruct in messageLinks ?? [] {
                if let text = linkStruct.messageLink, let link = linkStruct.url {
                    let range = result.mutableString.range(of: text)
                    result.setAttributes(merge([.link: link], linksAttributes), range: range)
                }
            }
            return result
        } onOpenLink: { url in
            UIApplication.shared.open(url)
        }
    }

    private var linksAttributes: [NSAttributedString.Key: Any] {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.09
        return [
            .font: UIFont.custom(.primary(size: .xs, weight: .regular)),
            .foregroundColor: UIColor(UIScheme.color.brandPrimary),
            .underlineStyle: UIScheme.underlinedLinks ? NSUnderlineStyle.single.rawValue : 0,
            .paragraphStyle: paragraphStyle
        ]
    }

    private var textAttributes: [NSAttributedString.Key: Any] {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.09
        return [
            .font: UIFont.custom(.primary(size: .xs, weight: .regular)),
            .foregroundColor: UIColor(UIScheme.color.inputTextPrimary),
            .paragraphStyle: paragraphStyle
        ]
    }
}

private func merge(_ first: [NSAttributedString.Key: Any], _ second: [NSAttributedString.Key: Any]) -> [NSAttributedString.Key: Any] {
    return first.merging(second) { _, secondValue in
        return secondValue
    }
}
