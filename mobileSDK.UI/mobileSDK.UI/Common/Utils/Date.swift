//
//  Date.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 26.09.2022.
//

import Foundation
import CoreMedia

extension DateFormatter {
    static var uiDateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        return dateFormatter
    }

    static var coreDateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return dateFormatter
    }
}

extension Date {
    static func fromCoreDate(string: String) -> Date? {
        DateFormatter.coreDateFormatter.date(from: string)
    }

    var toUIDateString: String {
        DateFormatter.uiDateFormatter.string(from: self)
    }
}

extension Payment {
    var uiDate: String? {
        guard let dateStr = date else { return nil }
        return Date.fromCoreDate(string: dateStr)?.toUIDateString
    }
}
