//
//  AdditionalFieldEnums.swift
//  ecommpaySDK
//
//  Created by Deniss Kaibagarovs on 02/08/2019.
//  Copyright © 2019 Ecommpay. All rights reserved.
//

import Foundation

@objc public enum AdditionalFieldType: Int, CaseIterable, CustomStringConvertible {
    @objc(customer_first_name)       case customer_first_name
    @objc(customer_middle_name)      case customer_middle_name
    @objc(customer_last_name)        case customer_last_name
    @objc(customer_phone)            case customer_phone
    @objc(customer_email)            case customer_email
    @objc(customer_country)          case customer_country
    @objc(customer_state)            case customer_state
    @objc(customer_city)             case customer_city
    @objc(customer_address)          case customer_address
    @objc(customer_zip)              case customer_zip
    @objc(customer_day_of_birth)     case customer_day_of_birth
    @objc(customer_birthplace)       case customer_birthplace
    @objc(customer_ssn)              case customer_ssn
    @objc(customer_domain)           case customer_domain
    @objc(customer_mir)              case customer_mir
    @objc(customer_account_id)       case customer_account_id
    @objc(customer_language)         case customer_language
    @objc(customer_screen_res)       case customer_screen_res
    @objc(customer_save)             case customer_save

    @objc(billing_postal)            case billing_postal
    @objc(billing_country)           case billing_country
    @objc(billing_region)            case billing_region
    @objc(billing_city)              case billing_city
    @objc(billing_address)           case billing_address

    @objc(identify_doc_number)       case identify_doc_number
    @objc(identify_doc_type)         case identify_doc_type
    @objc(identify_doc_issue_date)   case identify_doc_issue_date
    @objc(identify_doc_issue_by)     case identify_doc_issue_by

    @objc(custom)                    case custom

    // Doku
    @objc(doku_customer_first_name)  case doku_customer_first_name
    @objc(doku_customer_email)       case doku_customer_email

    // Neteller
    @objc(neteller_account_number)   case neteller_account_number

    // Qiwi
    @objc(qiwi_account_number)       case qiwi_account_number

    // WebMoney-Classic
    @objc(webmoney_classic_account_number)     case webmoney_classic_account_number
    @objc(webmoney_classic_account_type)       case webmoney_classic_account_type

    public var description: String {
        switch self {
        case .billing_address: return "billing_address"
        case .customer_first_name: return "customer_first_name"
        case .customer_middle_name: return "customer_middle_name"
        case .customer_last_name: return "customer_last_name"
        case .customer_phone: return "customer_phone"
        case .customer_email: return "customer_email"
        case .customer_country: return "customer_country"
        case .customer_state: return "customer_state"
        case .customer_city: return "customer_city"
        case .customer_address: return "customer_address"
        case .customer_zip: return "customer_zip"
        case .customer_day_of_birth: return "customer_day_of_birth"
        case .customer_birthplace: return "customer_birthplace"
        case .customer_ssn: return "customer_ssn"
        case .customer_domain: return "customer_domain"
        case .customer_mir: return "customer_mir"
        case .customer_account_id: return "customer_account_id"
        case .customer_language:
            return "customer_language"
        case .customer_screen_res:
            return "customer_screen_res"
        case .customer_save:
            return "customer_save"
        case .billing_postal:
            return "billing_postal"
        case .billing_country:
            return "billing_country"
        case .billing_region:
            return "billing_region"
        case .billing_city:
            return "billing_city"
        case .identify_doc_number:
            return "identify_doc_number"
        case .identify_doc_type:
            return "identify_doc_type"
        case .identify_doc_issue_date:
            return "identify_doc_issue_date"
        case .identify_doc_issue_by:
            return "identify_doc_issue_by"
        case .doku_customer_first_name:
            return "doku_customer_first_name"
        case .doku_customer_email:
            return "doku_customer_email"
        case .neteller_account_number:
            return "neteller_account_number"
        case .qiwi_account_number:
            return "qiwi_account_number"
        case .webmoney_classic_account_type:
            return "webmoney_classic_account_type"
        case .webmoney_classic_account_number:
            return "webmoney_classic_account_number"
        case .custom:
            return "custom"
        }
    }
}

public enum ServerType {
    case text // defualt
    case tel
    case password
    case file // not implemented
    case textarea
    case number
    case search // not implemented
    case url
    case email
    case date
}

public enum AdditionalFieldValidator {
    case email
    case birthDay
    case aboveZero
    case country
    case string15
    case string30
    case string100
    case string255
    case string512
    case date
    case fxcmAccountNumber
    case mobilePhone
    case minAge
    case month
    case postalCode
    case year
    case pan
    case avsPostCode
    case streetAddress
}
