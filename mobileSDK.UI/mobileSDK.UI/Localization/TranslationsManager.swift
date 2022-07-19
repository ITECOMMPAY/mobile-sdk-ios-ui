//
//  TranslationsManager.swift
//  ecommpaySDK
//
//  Created by Deniss Kaibagarovs on 26/07/2019.
//  Copyright © 2019 Ecommpay. All rights reserved.
//

import Foundation

struct TranslationWithLink: Codable {
    let name: String?
    let message: String?
    let links: [Link]?
}

struct Link: Codable {
    let url: String?
    let messageLink: String?

    enum CodingKeys: String, CodingKey {
        case url
        case messageLink = "message_link"
    }
}

extension TranslationWithLink {
    var attributedString: NSAttributedString {
        guard let message = message else { return NSAttributedString(string: "") }
        let result = NSMutableAttributedString(string: message)
        for linkStruct in links ?? [] {
            if let text = linkStruct.messageLink, let link = linkStruct.url {
                let range = result.mutableString.range(of: text)
                result.setAttributes([.link: link], range: range)
            }
        }
        return result
    }
}

class TranslationsManager {
    static let shared = TranslationsManager()

    private init() {}

    private var languageDict: [String: String] = [:]
    private(set) var language: String?

    func setLanguageDict(_ languageDict: [String: String], forLanguage language: String?) {
        self.languageDict = languageDict
        self.language = language
    }
  
    func setValueToDict(value: String, key: String) {
      self.languageDict[key] = value
    }

    func stringValue(for key: String) -> String? {
        guard let translationWithLink = getTranslationWithLink(for: key) else {
            return languageDict[key]
        }
        return translationWithLink.message
    }

    func hasLinksInValue(for key: String) -> Bool {
        return getTranslationWithLink(for: key) != nil
    }

    func getTranslationWithLink(for key: String) -> TranslationWithLink? {
        guard let translation = languageDict[key]
        else {
            return nil
        }
        if  translation.first == "{" {
            if let jsonData = translation.data(using: .utf8) {
                return try? JSONDecoder().decode(TranslationWithLink.self, from: jsonData)
            }
        } else {
            return TranslationWithLink(name: nil, message: translation, links: nil)
        }
        return nil
    }
}
