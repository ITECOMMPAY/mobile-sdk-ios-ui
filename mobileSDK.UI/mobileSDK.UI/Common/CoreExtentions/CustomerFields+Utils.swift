//
//  CustomerFields+Utils.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 16.08.2022.
//

import Foundation

extension Array where Element == CustomerField {

    func merge(changedFields: [FieldValue]?, with additionalFields: [AdditionalField]) -> [FieldValue] {
        if self.isAllCustomerFieldsHidden {// if only hidden fields
            return self.map { field in
                let foundAdditionalFieldValue = additionalFields.first {
                    field.fieldType == $0.type && !$0.value.isEmpty
                }?.value
                return FieldValue(name: field.name, value: foundAdditionalFieldValue ?? "")
            }
        }

        var result = changedFields ?? []
        self.forEach { field in
            if !result.contains(where: { $0.name == field.name }) {
                let foundAdditionalFieldValue = additionalFields.first {
                    field.fieldType == $0.type && !$0.value.isEmpty
                }?.value
                if let foundAdditionalFieldValue =  foundAdditionalFieldValue {
                    result += [FieldValue(name: field.name, value: foundAdditionalFieldValue)]
                }
            }
        }

        return result
    }

    var isAllCustomerFieldsHidden: Bool {
        self.allSatisfy { customerField in
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


