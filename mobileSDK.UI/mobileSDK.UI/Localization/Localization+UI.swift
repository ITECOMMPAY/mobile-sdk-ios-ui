//
//  File.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 29.08.2022.
//

import SwiftUI

extension TranslationWithLink {
    var attributedText: AttributedText {
        AttributedText(NSAttributedString(string: self.message ?? "")) // TODO: add links
    }
}
