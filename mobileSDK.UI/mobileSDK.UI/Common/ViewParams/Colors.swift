//
//  Colors.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 14.06.2022.
//

import SwiftUI

protocol ColorScheme {
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
    /// Цвет фона логических блоков ( блок информации о платеже, блок информации о результате )
    var infoBlockBackground: Color { get }
    /// Цвет фона полей ввода
    var editableFieldBackground: Color { get }
    /// Цвет заголовков экрана
    var screenHeader: Color { get }
    /// Цвет  бренда
    var brandColor: Color { get }
    /// Цвет  подложки деталей платежа
    var panelBackgroundColor: Color { get }
    /// Цвет рамки
    var border: Color { get }
    /// secondary Text Color
    var secondaryText: Color { get }
    /// Цвет текста
    var text: Color { get }
    /// paymentInfoCard foreground color
    var paymentInfoCardForegroundColor: Color { get }
    /// Цвет сохранённой карты в списке платёжных методов`
    var savedAccountBackground: Color { get }
    /// Цвет ячейки в списке платёжных методов`
    var paymentMethodBackground: Color { get }
    /// Shadow
    var paymentInfoCardShadow: Color { get }
    /// TextField error border color
    var textFieldErrorBorderColor: Color { get }
    /// TextField error  background color
    var textFieldErrorBackgroundColor: Color { get }
    /// TextField unfocused border color
    var textFieldUnfocusedBorderColor: Color { get }
    /// TextField unfocused  background color
    var textFieldNormalBackgroundColor: Color { get }
    /// TextField focused border color
    var textFieldFocusedBorderColor: Color { get }
    /// TextField requirement mark color
    var textFieldRequirementMarkColor: Color { get }
    /// disabled TextField color
    var textFieldDisabledColor: Color { get }
    /// цвет малозначимых декоративных элементов
    var minorShapesColor: Color { get }
    /// цвет кнопки delete card
    var deleteCardButtonColor: Color { get }
    /// цвет невыделеного чекбокса
    var checkboxBorder: Color { get }
    /// Цвет текста ошибки
    var errorTextColor: Color { get }
}

struct DefaultLight: ColorScheme {
    var textFieldErrorBorderColor: Color { red }
    var textFieldErrorBackgroundColor: Color { lightRed }
    var textFieldUnfocusedBorderColor: Color { grey }
    var textFieldNormalBackgroundColor: Color { lightGray }
    var textFieldFocusedBorderColor: Color { brandBlue }
    var textFieldRequirementMarkColor: Color { red }
    var paymentInfoCardShadow: Color { Color(hex: 0x105084).opacity(0.1) }
    var paymentMethodBackground: Color { Color.white }
    var savedAccountBackground: Color { lightGray }
    var screenHeader: Color { Color.black }
    var editableFieldBackground: Color { lightGray }
    var infoBlockBackground: Color { lightGray }
    var mainBackground: Color { Color.white }
    var shimmeringBackground: Color { lightGray }
    var shimmeringBase: Color {  Color.black }
    var shimmeringAccent: Color { Color.black.opacity(0.3) }
    var dimming: Color { Color.black.opacity(0.8) }
    var brandColor: Color { brandBlue }
    var panelBackgroundColor: Color { lightGray }
    var border: Color { grey }
    var secondaryText: Color { darkGray }
    var text: Color { Color.black }
    var paymentInfoCardForegroundColor: Color { Color.white }
    var textFieldDisabledColor: Color { semiMediumGrey }
    var minorShapesColor: Color { semiMediumGrey }
    var deleteCardButtonColor: Color { darkGray }
    var checkboxBorder: Color { Color(hex: 0xD1D5DB).opacity(0.9) }
    var errorTextColor: Color { red }

    /// Colors as they marked in Figma
    let lightRed = Color(hex: 0xF8EAEA)
    let red = Color(hex: 0xC03230)
    let grey = Color(hex: 0xEBEBEE)
    let darkGray = Color(hex: 0x666666)
    let lightGray = Color(hex: 0xF6F7F9)
    var brandBlue = Color(hex: 0x00579E)
    let semiMediumGrey = Color(hex: 0xBCBDBE)
}
/*
struct DefaultDark: ColorScheme {
    let dimmingColor: Color = DefaultLight().dimmingColor
    // TODO: implement default dark color scheme later
}
*/

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
