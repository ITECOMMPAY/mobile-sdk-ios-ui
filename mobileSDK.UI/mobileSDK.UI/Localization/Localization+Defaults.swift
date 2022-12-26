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
        // MARK: - Saved card method
        .title_expiry: "MM/YY",
        // MARK: - Payment details
        .title_payment_information_screen: "Payment Details",
        .button_hide_details: "Hide Details",
        // MARK: - Loading screen
        .title_cancel_payment: "Cancel Payment",
        // MARK: - Success / Error screen
        .button_done: "Done",
        .button_close: "Close",
        // MARK: - Dialog
        .button_ok: "OK",
        .button_cancel: "Cancel",
        // MARK: - Tokenize
        .button_tokenize: "Save Card",
        .button_proceed: "Continue",
        .title_result_succes_tokenize: "Successfully saved card",
        .title_result_error_tokenize: "Failed to save card"
    ]
}
