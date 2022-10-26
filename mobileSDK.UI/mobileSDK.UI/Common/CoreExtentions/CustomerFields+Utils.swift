//
//  CustomerFields+Utils.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 16.08.2022.
//

import Foundation

extension Array where Element == FieldValue {
    func skipEmpty() -> [FieldValue] {
        self.compactMap { $0.value.isEmpty ? nil : $0 }
    }
}

extension Array where Element == CustomerField {
    func fill(from additionalFields: [AdditionalField], where isIncluded: (CustomerField) -> Bool = { _ in true }) -> [FieldValue] {
        self
            .filter(isIncluded)
            .compactMap { field in
                additionalFields
                    .first(where: { $0.name == field.name && !$0.value.isEmpty })
                    .map { additionalField in
                        return FieldValue.init(name: field.name, value: additionalField.value)
                    }
            }
    }

    var hiddenFields: [CustomerField] {
        self.filter { customerField in
            customerField.isHidden
        }
    }

    var isAllCustomerFieldsNonRequired: Bool {
        self.contains { customerField in
            !customerField.isRequired
        }
    }

    var hasVisibleCustomerFields: Bool {
        self.contains { customerField in
            !customerField.isHidden
        }
    }

    var visibleCustomerFields: [CustomerField] {
        self.filter { customerField in
            !customerField.isHidden
        }
    }
}
