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

    var isRequired: Bool { true }  // clarification fields are always true

    var isHidden: Bool { false }

    var isTokenize: Bool { false }

    var isVerify: Bool { false }

    var hint: String? { clarificationField.defaultHint }

    var label: String { clarificationField.defaultLabel ?? "" }

    var placeholder: String? { clarificationField.defaultPlaceholder }

    var validatorName: String? { clarificationField.validatorName }

    var validatonMethod: Validator<String>? { clarificationField.validatonMethod }

    var fieldServerType: FieldServerType { .text }

    var errorMessage: String? { clarificationField.defaultErrorMessage }

    var errorMessageKey: String { L.message_general_invalid.rawValue }
}
