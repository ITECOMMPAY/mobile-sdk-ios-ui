//
//  TranslationKey.swift
//  ecommpaySDK
//
//  Created by Виталий Морозов on 08.09.2021.
//  Copyright © 2021 Ecommpay. All rights reserved.
//

import Foundation

public enum L: String {
    // MARK: - Payment Methods Page
    case title_payment_methods
    case title_payment_information_screen
    // MARK: - Payment overview (синяя карточка)
    case title_total_price
    case vat_included
    // MARK: - Payment details
    case title_payment_id
    case title_payment_information_description
    case merchant_address
    // MARK: - APS
    case aps_payment_disclaimer
    case aps_vat_disclaimer
    // MARK: - Saved card method
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

    // MARK: - OTHERS
    case message_card_holder
    case message_invalid_cvv
    case message_about_expiry
    case message_about_card_number
    case alert_message_payment_being_processed
    case message_required_field
}
