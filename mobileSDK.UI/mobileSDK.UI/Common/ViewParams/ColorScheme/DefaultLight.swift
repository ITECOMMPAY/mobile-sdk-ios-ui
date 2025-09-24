//
//  DefaultLight.swift
//  mobileSDK.UI
//
//  Created by Artem Serebrennikov on 22.02.2023.
//

import SwiftUI
import PassKit

struct DefaultLight: ColorScheme, LightPalette {
    // MARK: - Matching colors

    var primaryBrandColor: Color { primaryColor }
    var secondaryBrandColor: Color { secondaryColor }

    // MARK: - Non-matching colors

    var isDarkTheme: Bool { false }

    var applePayButtonStyle: PKPaymentButtonStyle { .black }

    var paymentMethodBackground: Color { .white }
    var savedAccountBackground: Color { paymentMethodBackground }

    var paymentMethodIconColor: Color { primaryColor }

    var navigationButtonColor: Color { globalBlack }

    var textFieldPlaceholderColor: Color { grey }

    var textFieldNormalBorderColor: Color { container }

    var textFieldFocusedPlaceholderColor: Color { primaryColor }
    var textFieldFocusedBorderColor: Color { primaryColor }

    var textFieldErrorPlaceholderColor: Color { grey }

    var textFieldDisabledTextColor: Color { mediumGrey }

    var checkboxUnselectedForeground: Color { mediumGrey }
    var checkboxUnselectedBackground: Color { background }

    var deleteCardButtonColor: Color { grey }

    var resultInfoBackgroundColor: Color { inputField }

    var infoIconColor: Color { grey }
    var scanCardIconColor: Color { grey }

    var loadingDotsColor: Color { primaryColor }

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
