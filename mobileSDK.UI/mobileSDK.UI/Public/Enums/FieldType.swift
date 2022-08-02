//
//  FieldType.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 29.07.2022.
//

import Foundation

public enum FieldType {
    case unknown
    case customerEmail
    case customerZip
    case customerPostCode
    case customerAddress
    case customerStreetAddress
    case customerCountry
    case customerFirstName
    case customerMiddleName
    case customerLastName
    case customerPhone
    case customerState
    case customerCity
    case customerDayOfBirth
    case customerBirthPlace
    case customerSsn
    case customerDomain
    case customerMir
    case customerAccountId
    case customerLanguage
    case customerScreenRes
    case customerSave
    case billingPostal
    case billingCountry
    case billingRegion
    case billingCity
    case billingAddress
    case identifyDocNumber
    case identifyDocType
    case identifyDocIssueDate
    case identifyDocIssueBy
    case custom
    case dokuCustomerEmail
    case dokuCustomerFirstName
    case qiwiAccountNumber
    case netellerAccountNumber
    case netellerSecurityCode
    case webmoneyAccountType
    case webmoneyAccountNumber
}

public enum FieldServerType {
    case tel
    case password
    case file
    case textarea
    case number
    case search
    case url
    case email
    case date
    case text
}
