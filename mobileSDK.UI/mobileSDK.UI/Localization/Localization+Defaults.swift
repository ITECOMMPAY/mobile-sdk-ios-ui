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
        // MARK: - Recurring details
        .recurring_start_date: "Next Bill Date",
        .recurring_type_expiry_date: "End Date",
        .recurring_period_label: "Frequency",
        .recurring_period_daily: "Every Day",
        .recurring_period_weekly: "Every Week",
        .recurring_period_monthly: "Every Month",
        .recurring_period_quarterly: "Every Quarter",
        .recurring_period_annually: "Every Year",
        .recurring_amount: "Recurring Amount",
        .recurring_fail: "Failed to register recurring payments",
        .recurring_type_express: "By clicking pay your methods will be saved for future payments.",
        .recurring_type_regular: "By clicking pay your methods will be saved for future payments. Subscription can be canceled at any time. Also it will automatically cancel when your card expires.",
        .recurring_charged_right_now: "Charged Right Now",
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
        .title_result_error_tokenize: "Failed to save card",
        // MARK: - Verify
        .button_authorize: "Authorize Card",
        // MARK: - Others
        .title_camera_permission: "Camera lets you scan your bank card. To enable this, click App Settings",
        .button_camera_permission: "App Settings"
    ]
}
