//
//  TranslationKey.swift
//  etoedtoSDK
//
//  Created by Виталий Морозов on 08.09.2021.
//  Copyright © 2021 Etoedto. All rights reserved.
//

import Foundation

public enum L: String {
    // MARK: - Payment Methods Page
    case title_payment_methods
    // MARK: - Payment overview (синяя карточка)
    case title_total_price
    case vat_included
    // MARK: - Payment details
    case title_payment_id
    case title_payment_information_description
    case merchant_address
    case title_payment_information_screen
    case button_hide_details
    // MARK: - Recurring details
    case recurring_start_date
    case recurring_type_expiry_date
    case recurring_period_label
    case recurring_period_daily
    case recurring_period_weekly
    case recurring_period_monthly
    case recurring_period_quarterly
    case recurring_period_annually
    case recurring_amount
    case recurring_fail
    case recurring_type_express
    case recurring_type_regular
    case recurring_charged_right_now
    // MARK: - APS
    case aps_payment_disclaimer
    case aps_vat_disclaimer
    // MARK: - Saved card method
    case title_expiry
    case title_expiration
    case title_cvv
    case button_delete
    // MARK: - New card method
    case title_card_number
    case title_holder_name
    case title_expiration_placeholder
    case title_saved_cards
    case cof_agreements
    case button_confirmation
    // MARK: - Common
    case button_pay
    // MARK: - Additional data screen
    case title_payment_additional_data
    case title_payment_additional_data_disclaimer
    // MARK: - Loading screen
    case title_loading_screen
    case sub_title_loading_screen
    case title_cancel_payment
    case button_done
    case button_close
    // MARK: - Success / Error screen
    case title_result_succes_payment
    case title_result_error_payment
    case title_card_wallet
    case title_payment_date
    // MARK: - Текст из Mapped messages"
    case button_try_again
    case complete_field_payment_vat_operation_amount
    case complete_field_payment_vat_operation_currency
    case complete_field_payment_vat_operation_rate
    case complete_field_payment_vat_operation_residency
    // MARK: - Footer
    case privacy_policy
    case cookie_policy
    // MARK: - Tokenize
    case button_tokenize
    case button_proceed
    case title_result_succes_tokenize
    case title_result_error_tokenize
    // MARK: - Verify
    case button_authorize
    case title_result_succes_verification
    case title_result_error_verification

    // MARK: - OTHERS
    case message_card_holder
    case message_invalid_cvv
    case message_about_expiry
    case message_about_card_number
    case message_wrong_card_type
    case alert_message_payment_being_processed
    case message_required_field
    case button_pay_with_card
    case message_general_invalid
    case title_about_cvv
    case message_about_cvv
    case button_ok
    case message_delete_card_single
    case button_cancel
    case title_camera_permission
    case button_camera_permission
}
