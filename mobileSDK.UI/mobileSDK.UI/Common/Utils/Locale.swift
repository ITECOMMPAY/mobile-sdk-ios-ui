//
//  Locale.swift
//  mobileSDK.UI
//
//  Created by Ilya Matveev on 17.09.2025.
//

import Foundation

extension Locale {
    func threeLetterLanguageCode() -> String {
        guard let languageCode = self.languageCode else { return "ENG" }
        
        let mapping: [String: String] = [
            "de": "GER", "en": "ENG", "es": "SPA",
            "fr": "FRA", "hu": "HUN", "it": "ITA"
        ]
        
        return mapping[languageCode] ?? "ENG"
    }
}
