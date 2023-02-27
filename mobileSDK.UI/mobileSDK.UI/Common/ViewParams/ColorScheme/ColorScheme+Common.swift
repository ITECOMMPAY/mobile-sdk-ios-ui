//
//  ColorScheme+Common.swift
//  mobileSDK.UI
//
//  Created by Artem Serebrennikov on 22.02.2023.
//

import SwiftUI

extension ColorScheme where Self: ColorPalette {
    var dimming: Color { globalBlack80 }

    var shimmeringBackground: Color { inputField }
    var shimmeringBase: Color { globalBlack }
    var shimmeringAccent: Color { globalBlack30 }

    var mainBackground: Color { background }

    var screenHeader: Color { neutral }

    var text: Color { neutral }
    var secondaryTextColor: Color { grey }
    var successTextColor: Color { green }
    var errorTextColor: Color { red }

    var paymentInfoCardForegroundColor: Color { globalWhite }
    var paymentDetailsTitleColor: Color { globalWhite60 }
    var paymentDetailsForegroundColor: Color { globalWhite }
    var paymentDetailsBackgroundColor: Color { globalWhite10 }

    var linkButtonColor: Color { link }

    var textFieldNormalPlaceholderColor: Color { grey }
    var textFieldNormalBackgroundColor: Color { inputField }

    var textFieldFocusedBackgroundColor: Color { accent }

    var textFieldErrorBorderColor: Color { red }
    var textFieldErrorBackgroundColor: Color { containerRed }

    var textFieldDisabledBorderColor: Color { inputField }

    var textFieldRequirementMarkColor: Color { red }

    var checkboxSelectedForeground: Color { globalWhite }
    var checkboxSelectedBackground: Color { brandColor }

    var cancelPaymentButtonColor: Color { mediumGrey }

    var minorShapesColor: Color { mediumGrey }
}
