//
//  RecurringDetailsData.swift
//  mobileSDK.UI
//
//  Created by Artem Serebrennikov on 01.02.2023.
//

import Foundation

public enum RecurringDetailDescription {
    case value(String)
    case localizable(L)

    var stringValue: String {
        switch self {
        case .value(let value): return value
        case .localizable(let localizable): return localizable.string
        }
    }
}

public struct RecurringDetailsData {
    let title: L
    let description: RecurringDetailDescription
    
    public init(title: L, description: RecurringDetailDescription) {
        self.title = title
        self.description = description
    }
}
