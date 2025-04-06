//
//  DefaultDark.swift
//  mobileSDK.UI
//
//  Created by Artem Serebrennikov on 22.02.2023.
//

import SwiftUI
import PassKit

struct DefaultDark: ColorScheme, DarkPalette {
    // MARK: - Matching colors

    var brandColor: Color { primaryColor }

    // MARK: - Non-matching colors

    var isDarkTheme: Bool { true }

    var applePayButtonStyle: PKPaymentButtonStyle { .white }

    var paymentMethodBorder: Color { container }
    var paymentMethodBackground: Color { container }
    var savedAccountBackground: Color { paymentMethodBackground }

    var paymentMethodIconColor: Color { brand ?? globalWhite }

    var navigationButtonColor: Color { globalWhite }

    var textFieldPlaceholderColor: Color { neutral }

    var textFieldNormalBorderColor: Color { inputField }

    var textFieldFocusedPlaceholderColor: Color { neutral }
    var textFieldFocusedBorderColor: Color { brand ?? link }

    var textFieldErrorPlaceholderColor: Color { red }

    var textFieldDisabledTextColor: Color { grey }

    var checkboxUnselectedForeground: Color { mediumGrey }
    var checkboxUnselectedBackground: Color { inputField }

    var deleteCardButtonColor: Color { link }

    var resultInfoBackgroundColor: Color { container }

    var infoIconColor: Color { neutral }
    var scanCardIconColor: Color { neutral }

    var loadingDotsColor: Color { brand ?? neutral }

    private var primaryColor: Color { brand ?? primary }
    let brand: Color?

    init(brandColor: Color? = nil) {
        self.brand = brandColor
    }
}

