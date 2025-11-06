//
//  CustomerField+Validate.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 29.07.2022.
//

import Foundation

extension CustomerField {
    func getValidationMessage( value: String, onTransformValueBeforeValidate: ((String) -> String)? = nil) -> String? {
        if value.isEmpty {
            return L.message_required_field.string
        }
        guard let validator = self.validationMethod else {
            return nil
        }

        let isValid = validator(onTransformValueBeforeValidate?(value) ?? value)
        return !isValid ? (self.errorMessage ?? self.errorMessageKey) : nil
    }
}
