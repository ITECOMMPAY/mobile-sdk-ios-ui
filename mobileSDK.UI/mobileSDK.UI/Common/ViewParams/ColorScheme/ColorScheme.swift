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
    /// Цвет затемнения фона
    var dimming: Color { get }
    /// Основной цвет фона скелетного вью
    var shimmeringBackground: Color { get }
    /// Основной цвет Shimmering эффекта
    var shimmeringBase: Color { get }
    /// Цвет блика Shimmering эффекта
    var shimmeringAccent: Color { get }
    /// Цвет основного фона карточки экранов оплаты
    var mainBackground: Color { get }
    /// Цвет заголовков экрана
    var screenHeader: Color { get }
    /// Цвет  бренда
    var brandColor: Color { get }
    /// Цвет подложки деталей платежа на финальном экране
    var resultInfoBackgroundColor: Color { get }
    /// Цвет рамки платёжного метода
    var paymentMethodBorder: Color { get }
    /// secondary Text Color
    var secondaryTextColor: Color { get }
    /// Цвет текста
    var text: Color { get }
    /// paymentInfoCard foreground color
    var paymentInfoCardForegroundColor: Color { get }

    /// Цвет сохранённой карты в списке платёжных методов`
    var savedAccountBackground: Color { get }
    /// Цвет ячейки в списке платёжных методов`
    var paymentMethodBackground: Color { get }

    /// Цвет стандартных иконок платёжных методов
    var paymentMethodIconColor: Color { get }

    /// Цвет кнопок навигации
    var navigationButtonColor: Color { get }
    /// Цвет кнопок-ссылок
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
    /// TextField error  background color
    var textFieldErrorBackgroundColor: Color { get }

    /// TextField disabled text color
    var textFieldDisabledTextColor: Color { get }
    /// TextField disabled border color
    var textFieldDisabledBorderColor: Color { get }

    /// TextField requirement mark color
    var textFieldRequirementMarkColor: Color { get }

    /// Цвет малозначимых декоративных элементов
    var minorShapesColor: Color { get }

    /// Цвет точек на экране загрузки
    var loadingDotsColor: Color { get }
    
    /// Цвет кнопки delete card
    var deleteCardButtonColor: Color { get }
    /// Цвет кнопки cancel payment
    var cancelPaymentButtonColor: Color { get }
    /// Цвет границы невыделеного чекбокса
    var checkboxUnselectedForeground: Color { get }
    /// Цвет фона невыделенного чекбокса
    var checkboxUnselectedBackground: Color { get }
    /// Цвет границы выделеного чекбокса
    var checkboxSelectedForeground: Color { get }
    /// Цвет фона выделенного чекбокса
    var checkboxSelectedBackground: Color { get }
    /// Цвет текста успеха
    var successTextColor: Color { get }
    /// Цвет текста ошибки
    var errorTextColor: Color { get }
    /// Основной цвет в детальной информации о платеже
    var paymentDetailsForegroundColor: Color { get }
    /// Фон элементов в детальной информации о платеже(divider, кнопка)
    var paymentDetailsBackgroundColor: Color { get }
    /// Цвет заголовков в детальной информации о платеже
    var paymentDetailsTitleColor: Color { get }
    /// Цвет иконки кнопки доп. информации
    var infoIconColor: Color { get }
    /// Цвет иконки кнопки сканирования карты
    var scanCardIconColor: Color { get }
    /// ApplePay button style
    var applePayButtonStyle: PKPaymentButtonStyle { get }
}
