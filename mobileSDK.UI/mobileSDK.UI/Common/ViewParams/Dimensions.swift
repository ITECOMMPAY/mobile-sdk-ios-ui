//
//  Dimensions.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 14.06.2022.
//

import SwiftUI

protocol DimensionScheme {
    /// Typical distance from the logical block's borders to an inner element. **default: 16**
    var middleSpacing: CGFloat { get }
    /// Typical distance from screen borders to page content, and between logical blocks. **default: 26**
    var largeSpacing: CGFloat { get }
    /// Distance from payment details block borders to inner elements. **default: 20**
    var paymentOverviewSpacing: CGFloat { get }
    /// Distance between elements in payment details block. **default: 18**
    var paymentDetailsSpacing: CGFloat { get }
    /// Payment details button height. **default: 33**
    var paymentDetailsButtonHeight: CGFloat { get }
    /// Distance between elements in a list or logically related elements. **default: 10**
    var smallSpacing: CGFloat { get }
    /// Distance between attribute name and its description in payment details block. **default: 6**
    var tinySpacing: CGFloat { get }
    /// ApplePay button height. **default: 48**
    var applePayButtonHeight: CGFloat { get }
    /// Payment method button height. **default: 50**
    var paymentMethodButtonHeight: CGFloat { get }
    /// Background sheet corner radius. **default: 12**
    var backgroundSheetCornerRadius: CGFloat { get }
    /// Button corner radius. **default: 6**
    var buttonCornerRadius: CGFloat { get }
    /// Smallest corner radius. **default: 4**
    var smallestCornerRadius: CGFloat { get }
    /// Minimum tap area size according to iOS UI guidelines. **default: 44**
    var minimumTapAreaSize: CGFloat { get }
    /// Input field border width. **default: 2**
    var inputBorderWidth: CGFloat { get }
    /// Highlighted input field border width. **default: 1**
    var inputAccentedBorderWidth: CGFloat { get }
    /// Info card height. **default: 150**
    var infoCardHeight: CGFloat { get }
    /// Info card height without logo. **default: 92**
    var infoCardShortenedHeight: CGFloat { get }
    /// Spacing between amount and currency on payment card. **default: 8**
    var valueToCurrencySpacing: CGFloat { get }
    /// Spacing between elements in horizontal list on payment form. **default: 12**
    var formSmallSpacing: CGFloat { get }
    /// Large vertical spacing on payment form. **default: 22**
    var formLargeVerticalSpacing: CGFloat { get }
    /// Pay button height. **default: 45**
    var payButtonHeight: CGFloat { get }
    /// Spacing between "Pay" and price on pay button. **default: 5**
    var payButtonPayPriceSpacing: CGFloat { get }
    /// Text field height. **default: 55**
    var textFieldHeight: CGFloat { get }
    /// Spacing between loading screen subtitle and cancel button. **default: 34**
    var cancelButtonLoadingSubtitleSpacing: CGFloat { get }
    /// Divider height. **default: 1**
    var dividerHeight: CGFloat { get }
}

struct DefaultDimensionScheme: DimensionScheme {
    let inputAccentedBorderWidth: CGFloat = 1
    let textFieldHeight: CGFloat = 55
    let payButtonPayPriceSpacing: CGFloat = 5
    let payButtonHeight: CGFloat = 45
    let infoCardShortenedHeight: CGFloat = 92
    let formSmallSpacing: CGFloat = 12
    let formLargeVerticalSpacing: CGFloat = 22
    let backgroundSheetCornerRadius: CGFloat = 20
    let paymentMethodButtonHeight: CGFloat = 50
    let applePayButtonHeight: CGFloat = 48
    let tinySpacing: CGFloat = 6
    let smallSpacing: CGFloat = 10
    let paymentDetailsSpacing: CGFloat = 18
    let paymentOverviewSpacing: CGFloat = 20
    let paymentDetailsButtonHeight: CGFloat = 33
    let largeSpacing: CGFloat = 26
    let middleSpacing: CGFloat = 16
    let buttonCornerRadius: CGFloat = 12
    let smallestCornerRadius: CGFloat = 4
    let minimumTapAreaSize: CGFloat = 44
    let inputBorderWidth: CGFloat = 2
    let infoCardHeight: CGFloat = 150
    let valueToCurrencySpacing: CGFloat = 8
    let cancelButtonLoadingSubtitleSpacing: CGFloat = 34
    let dividerHeight: CGFloat = 1
}
