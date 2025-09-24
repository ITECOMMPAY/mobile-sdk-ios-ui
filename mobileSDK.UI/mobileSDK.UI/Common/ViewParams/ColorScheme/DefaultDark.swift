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

    var primaryBrandColor: Color { primaryColor }
    var secondaryBrandColor: Color { secondaryColor }

    // MARK: - Non-matching colors

    var isDarkTheme: Bool { true }

    var applePayButtonStyle: PKPaymentButtonStyle { .white }

    var paymentMethodBackground: Color { container }
    var savedAccountBackground: Color { paymentMethodBackground }

    var paymentMethodIconColor: Color { primaryBrand ?? globalWhite }

    var navigationButtonColor: Color { globalWhite }

    var textFieldPlaceholderColor: Color { neutral }

    var textFieldNormalBorderColor: Color { inputField }

    var textFieldFocusedPlaceholderColor: Color { neutral }
    var textFieldFocusedBorderColor: Color { primaryBrand ?? link }

    var textFieldErrorPlaceholderColor: Color { red }

    var textFieldDisabledTextColor: Color { grey }

    var checkboxUnselectedForeground: Color { mediumGrey }
    var checkboxUnselectedBackground: Color { inputField }

    var deleteCardButtonColor: Color { link }

    var resultInfoBackgroundColor: Color { container }

    var infoIconColor: Color { neutral }
    var scanCardIconColor: Color { neutral }

    var loadingDotsColor: Color { primaryBrand ?? neutral }

    private var primaryColor: Color { primaryBrand ?? primary }
    private var secondaryColor: Color { secondaryBrand ?? secondary }
    
    let primaryBrand: Color?
    let secondaryBrand: Color?

    init(
        primaryBrandColor: Color? = nil,
        secondaryBrandColor: Color? = nil
    ) {
        self.primaryBrand = primaryBrandColor
        self.secondaryBrand = secondaryBrandColor
    }
}

