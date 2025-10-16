//
//  TranslationKey+Strings.swift
//  mglwalletSDK
//
//  Created by Виталий Морозов on 08.09.2021.
//  Copyright © 2021 Mglwallet. All rights reserved.
//

import Foundation

extension L {
    var string: String {
        self.rawValue.localized()
    }

    func stringByReplacingPlaceholder(with string: String) -> String {
        let localizedString = self.rawValue.localized()
        let placeholderPattern = "\\[\\[.+]]"
        let regex = try! NSRegularExpression(pattern: placeholderPattern, options: .caseInsensitive)
        let range = NSRange(location: 0, length: localizedString.count)
        return regex.stringByReplacingMatches(in: localizedString, options: [], range: range, withTemplate: string)
    }
}

extension L {
    var translationWithLink: TranslationWithLink? {
        TranslationsManager.shared.getTranslationWithLink(for: self.rawValue)
    }
}

extension String {
    func localized(bundle: Bundle = SDKBundle.get(), tableName: String = "Localizable") -> String {
        // at first try to get string from TranslationsManager, if its not available then try to return one from bundle (current flow)

        if let translation = TranslationsManager.shared.stringValue(for: self) {
            return translation
        }

        if let key = L(rawValue: self), let translation = L.localizationDefaults[key] {
            return translation
        }

        return NSLocalizedString(self, tableName: nil, bundle: bundle, value: "**\(self)**", comment: "")
    }
}

extension String {
    func localizedWithCode(languageCode: String?) -> String {
        guard let langCode = languageCode else {
            return NSLocalizedString(self, tableName: nil, bundle: SDKBundle.get(), comment: "")
        }
        
        let key = "\(self)_\(langCode.lowercased())"
        var title = NSLocalizedString(key, tableName: "Overrides", bundle: SDKBundle.get(), comment: "")
        
        if (title == key) {
            title = NSLocalizedString(self, tableName: nil, bundle: SDKBundle.get(), comment: "")
        }

        return title
    }
}
