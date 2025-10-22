//
//  ClarificationField+CustomerField.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 08.08.2022.
//

import Foundation

extension ClarificationField {
    var asCustomerField: CustomerField {
        ClarificationFieldAdapter(with: self)
    }
}

private struct ClarificationFieldAdapter {
    let clarificationField: ClarificationField

    init(with clarificationField: ClarificationField) {
        self.clarificationField = clarificationField
    }
}

extension ClarificationFieldAdapter: CustomerField {
    var name: String { clarificationField.name }

    var isOptional: Bool { false }

    var isHidden: Bool { false }

    var isTokenize: Bool { false }

    var hint: String? { clarificationField.defaultHint }

    var label: String { clarificationField.defaultLabel ?? "" }

    var placeholder: String? { clarificationField.defaultPlaceholder }

    var validationMethod: Validator<String>? { clarificationField.validationMethod }

    var fieldServerType: FieldServerType { .text }

    var errorMessage: String? { clarificationField.defaultErrorMessage }

    var errorMessageKey: String { L.message_general_invalid.rawValue }
    
    var options: [any AdditionalField]? { nil }
}
