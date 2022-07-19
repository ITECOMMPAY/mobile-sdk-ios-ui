//
//  TranslationKey+Strings.swift
//  ecommpaySDK
//
//  Created by Виталий Морозов on 08.09.2021.
//  Copyright © 2021 Ecommpay. All rights reserved.
//

import Foundation

extension L {
    var string: String {
        self.rawValue.localized()
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
