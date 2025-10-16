//
//  TranslationsManager.swift
//  mglwalletSDK
//
//  Created by Deniss Kaibagarovs on 26/07/2019.
//  Copyright © 2019 Mglwallet. All rights reserved.
//

import Foundation

public protocol TranslationWithLink {
    var name: String? { get }
    var message: String? { get }
    var messageLinks: [Link]? { get }
}

public protocol Link {
    var url: String? { get }
    var messageLink: String? { get }
}

class TranslationsManager {
    @Injected var resourceManager: StringResourceManager?

    static var shared: TranslationsManager {
        guard let translationsManager = serviceLocator.getService(ofType: self) else {
            return TranslationsManager()
        }
        return translationsManager
    }

    func stringValue(for key: String) -> String? {
        if let string = resourceManager?.getStringByKey(key: key) {
            return string
        } else if let translationWithLink = resourceManager?.getLinkMessageByKey(key: key) {
            return translationWithLink.message
        }
        return nil
    }

    func hasLinksInValue(for key: String) -> Bool {
        return getTranslationWithLink(for: key) != nil
    }

    func getTranslationWithLink(for key: String) -> TranslationWithLink? {
        return resourceManager?.getLinkMessageByKey(key: key)
    }
}

public protocol StringResourceManager {
    func getLinkMessageByKey(key: String) -> TranslationWithLink?
    func getStringByKey(key: String) -> String?
}
