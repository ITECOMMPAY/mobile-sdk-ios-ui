//
//  AdditionalFieldEnums.swift
//  ecommpaySDK
//
//  Created by Deniss Kaibagarovs on 02/08/2019.
//  Copyright © 2019 Ecommpay. All rights reserved.
//

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
        case .customer_first_name: return "first_name"
        case .customer_middle_name: return "middle_name"
        case .customer_last_name: return "last_name"
        case .customer_phone: return "phone"
        case .customer_email: return "email"
        case .customer_country: return "country"
        case .customer_state: return "state"
        case .customer_city: return "city"
        case .customer_address: return "address"
        case .customer_zip: return "zip"
        case .customer_day_of_birth: return "day_of_birth"
        case .customer_birthplace: return "birthplace"
        case .customer_ssn: return "ssn"
        case .customer_domain: return "domain"
        case .customer_mir: return "mir"
        case .customer_account_id: return "account_id"
        case .customer_language:
            return "language"
        case .customer_screen_res:
            return "screen_res"
        case .customer_save:
            return "save"
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
