//
//  ColorScheme.swift
//  mobileSDK.UI
//
//  Created by Artem Serebrennikov on 22.02.2023.
//

import SwiftUI
import PassKit

protocol ColorScheme {
    /// Dark/Light
    var isDarkTheme: Bool { get }
    /// Background dimming color
    var dimming: Color { get }
    /// Primary color of skeleton view
    var shimmeringBackground: Color { get }
    /// Primary color of shimmer effect
    var shimmeringBase: Color { get }
    /// Accent color of shimmer effect
    var shimmeringAccent: Color { get }
    /// Primary background color of payment screens
    var mainBackground: Color { get }
    /// Screen header color
    var screenHeader: Color { get }
    /// Primary brand color
    var primaryBrandColor: Color { get }
    /// Secondary brand color
    var secondaryBrandColor: Color { get }
    /// Background color of payment details on final screen
    var resultInfoBackgroundColor: Color { get }
    /// Secondary Text Color
    var secondaryTextColor: Color { get }
    /// Text color
    var text: Color { get }
    /// Foreground color of payment information card
    var paymentInfoCardForegroundColor: Color { get }
    /// Color of saved card in list of payment methods
    var savedAccountBackground: Color { get }
    /// Cell color in list of payment methods
    var paymentMethodBackground: Color { get }
    /// Color of standard icons of payment methods
    var paymentMethodIconColor: Color { get }
    /// Color of navigation buttons
    var navigationButtonColor: Color { get }
    /// Color of link buttons
    var linkButtonColor: Color { get }
    /// TextField full-size placeholder color
    var textFieldPlaceholderColor: Color { get }
    /// TextField normal placeholder color
    var textFieldNormalPlaceholderColor: Color { get }
    /// TextField normal border color
    var textFieldNormalBorderColor: Color { get }
    /// TextField normal background color
    var textFieldNormalBackgroundColor: Color { get }
    /// TextField focused placeholder color
    var textFieldFocusedPlaceholderColor: Color { get }
    /// TextField focused border color
    var textFieldFocusedBorderColor: Color { get }
    /// TextField focused background color
    var textFieldFocusedBackgroundColor: Color { get }
    /// TextField error placeholder color
    var textFieldErrorPlaceholderColor: Color { get }
    /// TextField error border color
    var textFieldErrorBorderColor: Color { get }
    /// TextField error background color
    var textFieldErrorBackgroundColor: Color { get }
    /// TextField disabled text color
    var textFieldDisabledTextColor: Color { get }
    /// TextField disabled border color
    var textFieldDisabledBorderColor: Color { get }
    /// TextField requirement mark color
    var textFieldRequirementMarkColor: Color { get }
    /// Color of minor shapes
    var minorShapesColor: Color { get }
    /// Color of loading dots
    var loadingDotsColor: Color { get }
    /// Color of delete card button
    var deleteCardButtonColor: Color { get }
    /// Color of cancel payment button
    var cancelPaymentButtonColor: Color { get }
    /// Foreground color of unselected checkbox
    var checkboxUnselectedForeground: Color { get }
    /// Background color of unselected checkbox
    var checkboxUnselectedBackground: Color { get }
    /// Foreground color of selected checkbox
    var checkboxSelectedForeground: Color { get }
    /// Background color of selected checkbox
    var checkboxSelectedBackground: Color { get }
    /// Success text color
    var successTextColor: Color { get }
    /// Error text color
    var errorTextColor: Color { get }
    /// Primary color in detailed payment information
    var paymentDetailsForegroundColor: Color { get }
    /// Background color of elements in detailed payment information (divider, button)
    var paymentDetailsBackgroundColor: Color { get }
    /// Color of headings in detailed payment information
    var paymentDetailsTitleColor: Color { get }
    /// Color of icon in additional information button
    var infoIconColor: Color { get }
    /// Color of card scan button icon
    var scanCardIconColor: Color { get }
    /// Apple Pay button style
    var applePayButtonStyle: PKPaymentButtonStyle { get }
}
