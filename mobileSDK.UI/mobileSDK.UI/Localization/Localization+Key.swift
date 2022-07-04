//
//  TranslationKey.swift
//  ecommpaySDK
//
//  Created by Виталий Морозов on 08.09.2021.
//  Copyright © 2021 Ecommpay. All rights reserved.
//

import Foundation

enum L: String {
    // MARK: alipay
    case alipay_payment_instruction
    case alipay_title

    // MARK: BigC
    case bigccash_title_result_customer_name
    case bigccash_title_result_payment_type
    case bigccash_title_result_payment_valid_date
    case bigccash_title_result_success_information

    // MARK: Buttons
    case button_add_new_card
    case button_authorize
    case button_authorize_loading
    case button_cancel
    case button_close
    case button_delete
    case button_done
    case button_next
    case button_ok
    case button_pay
    case button_pay_loading
    case button_proceed
    case button_tokenize
    case button_tokenize_loading
    case button_try_again

    // MARK: Consent Page
    case consent_page_accept
    case consent_page_accept_title
    case consent_page_addition_info
    case consent_page_payment_date
    case consent_page_payment_reference
    case consent_page_payment_total
    case consent_page_project
    case consent_page_secure_description

    // MARK: Messages
    case message_about_card_number
    case message_wrong_card_type
    case message_about_cvv
    case message_about_expiry
    case message_card_holder
    case message_delete_card_single
    case message_general_invalid
    case message_internet_connection_error
    case message_invalid_date_of_birth
    case message_invalid_email
    case message_invalid_phone
    case message_required_field
    case message_unknown_error
    case waiting_redirect_message

    // MARK: QiWi
    case qiwi_account_number
    case qiwi_account_number_hint

    // MARK: Titles
    case title_about_cvv
    case title_billing_address
    case title_billing_city
    case title_billing_country
    case title_billing_postal
    case title_billing_region
    case title_card_details
    case title_card_number
    case title_card_wallet
    case title_customer_address
    case title_customer_birthplace
    case title_customer_city
    case title_customer_country
    case title_customer_day_of_birth
    case title_customer_email
    case title_customer_first_name
    case title_customer_language
    case title_customer_last_name
    case title_customer_middle_name
    case title_customer_phone
    case title_customer_postal
    case title_customer_ssn
    case title_customer_state
    case title_cvv
    case title_enter_cvv
    case title_expiry
    case title_holder_name
    case title_identify_doc_issue_by
    case title_identify_doc_issue_date
    case title_identify_doc_number
    case title_identify_doc_type
    case title_month_full
    case title_month_short
    case title_new_bank_card
    case title_new_card_details
    case title_payment_date
    case title_payment_id
    case title_payment_information_amount
    case title_payment_information_description
    case title_payment_information_screen
    case title_payment_methods
    case title_remember_bank_card
    case title_required_fields
    case title_result_error_payment
    case title_result_error_tokenize
    case title_result_error_verification
    case title_result_succes_payment
    case title_result_succes_tokenize
    case title_result_succes_verification
    case title_text_payment_in_progress
    case title_text_payment_is_preparing
    case title_year_full
    case title_year_short

    // MARK: Webmoney
    case webmoney_real_amount
    case webmoney_waiting_message

    // MARK: 1D3
    #if ODTSDK
    case footer_cookie_policy
    case footer_eula
    case footer_privacy_policy
    case footer_additional_info
    case privacy_policy_tokenize
    case privacy_policy_verify
    case operation_is_success
    #endif

    // MARK: Other
    case awaiting_confirmation
    case banks_search_placeholder
    case cascade_error
    case cascade_payment_button
    case cof_agreements
    case common_error_title
    case data_is_empty
    case doku_customer_email
    case doku_customer_email_hint
    case doku_customer_first_name
    case doku_customer_first_name_hint
    case not_found_banks_message
    case privacy_policy
    case vat_included

    // MARK: UI2.0
    case payment_details 
}

