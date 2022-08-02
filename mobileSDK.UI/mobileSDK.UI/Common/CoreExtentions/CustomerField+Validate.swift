//
//  CustomerField+Validate.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 29.07.2022.
//

import Foundation

extension CustomerField {
    func getValidationMessage( value: String, onTransformValueBeforeValidate: ((String) -> String)? = nil) -> String? {
        guard let validator = self.validatonMethod else {
            return nil
        }
        if self.isRequired && value.isEmpty {
            return L.message_required_field.string
        } else {
            let isValid = validator(onTransformValueBeforeValidate?(value) ?? value)
            return !isValid ? (self.errorMessage ?? self.errorMessageKey) : nil
        }
    }
}
