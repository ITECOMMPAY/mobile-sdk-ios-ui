//
//  Localization+Defaults.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 27.06.2022.
//

import Foundation

extension L {
    static let localizationDefaults: [L: String] = [
        // MARK: - Payment Methods Page
        .title_payment_methods: "Payment Methods",
        .title_payment_information_screen: "Payment Details",
        // MARK: - Payment overview (синяя карточка)
        .title_total_price: "Total Price",
        .vat_included: "VAT included",
        // MARK: - Payment details
        .title_payment_id: "Payment ID",
        .title_payment_information_description: "Description",
        .merchant_address: "Addess",
        // MARK: - APS
        .aps_payment_disclaimer: "To pay with this payment method click button below. No additional actions needed.",
        .aps_vat_disclaimer: "VAT may differ depending on payment method",
        // MARK: - Saved card method
        .title_expiration: "Expiration",
        .title_cvv: "CVC",
        .button_delete: "Delete Card",
        // MARK: - New card method
        .title_card_number: "Card Number",
        .title_holder_name: "Cardholder",
        .title_expiration_placeholder: "MM/YY",
        .title_saved_cards: "Save card details for future use",
        .cof_agreements: "By clicking checkbox and saving card detailsI agree with COF Agreement",
        .button_confirmation: "Confirm and Continue",
        // MARK: - Common
        .button_pay: "Pay ... USD",
        // MARK: - Additional data screen
        .title_payment_additional_data: "Additional Data",
        .title_payment_additional_data_disclaimer: "Please add more information below to complete your payment. Everything is stored securely.",
        // MARK: - Loading screen
        .title_loading_screen: "Title",
        .sub_title_loading_screen: "Sub-Title",
        // MARK: - Success / Error screen
        .title_result_succes_payment: "Successful Payment",
        .title_result_error_payment: "Payment Failed",
        .title_card_wallet: "Card / Wallet",
        .title_payment_date: "Date",
        // MARK: - Текст из Mapped messages"
        .button_try_again: "Try Again",
        .complete_field_payment_vat_operation_amount: "VAT Amount",
        .complete_field_payment_vat_operation_currency: "VAT Currency",
        .complete_field_payment_vat_operation_rate: "VAT Rate",
        .complete_field_payment_vat_operation_residency: "VAT Residency",
        // MARK: - Footer
        .privacy_policy: "Privacy policy",
        .cookie_policy: "Cookie policy",
        // MARK: - Dialog
        .button_ok: "OK",
        .button_cancel: "Cancel",
    ]
}
