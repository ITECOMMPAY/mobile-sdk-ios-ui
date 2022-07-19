//
//  Colors.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 14.06.2022.
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
    var paymentDetailsBackground: Color { get }
    /// Цвет рамки
    var border: Color { get }
    /// Цвет заголовков внутри блока деталей платежа
    var paymentDetailsInnerTitleColor: Color { get }
    /// Цвет описания деталей платежа
    var paymentDetailsDescriptionColor: Color { get }
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
    /// TextField placeholder text color
    var textFieldPlaceholderColor: Color { get }
    /// disabled TextField color
    var textFieldDisabledColor: Color { get }
    /// цвет малозначимых декоративных элементов
    var minorShapesColor: Color { get }
    /// цвет кнопки delete card
    var deleteCardButtonColor: Color { get }
}

struct DefaultLight: ColorScheme {
    var textFieldPlaceholderColor = darkGray
    let textFieldErrorBorderColor = red
    let textFieldErrorBackgroundColor = lightRed
    let textFieldUnfocusedBorderColor = grey
    let textFieldNormalBackgroundColor = lightGray
    let textFieldFocusedBorderColor = brandBlue
    let textFieldRequirementMarkColor = red
    let paymentInfoCardShadow = Color(hex: 0x105084).opacity(0.1)
    let paymentMethodBackground = Color.white
    let savedAccountBackground = lightGray
    let screenHeader = Color.black
    let editableFieldBackground = lightGray
    let infoBlockBackground = lightGray
    let mainBackground = Color.white
    let shimmeringBackground = lightGray
    let shimmeringBase =  Color.black
    let shimmeringAccent = Color.black.opacity(0.3)
    let dimming = Color.black.opacity(0.8)
    let brandColor = brandBlue
    let paymentDetailsBackground = lightGray
    let border = grey
    let paymentDetailsInnerTitleColor = darkGray
    let paymentDetailsDescriptionColor = Color.black
    let text = Color.black
    let paymentInfoCardForegroundColor = Color.white
    let textFieldDisabledColor = semiMediumGrey
    let minorShapesColor = semiMediumGrey
    let deleteCardButtonColor = darkGray

    /// Colors as they marked in Figma
    private static let lightRed = Color(hex: 0xF8EAEA)
    private static let red = Color(hex: 0xC03230)
    private static let grey = Color(hex: 0xEBEBEE)
    private static let darkGray = Color(hex: 0x666666)
    private static let lightGray = Color(hex: 0xF6F7F9)
    private static let brandBlue = Color(hex: 0x00579E)
    private static let semiMediumGrey = Color(hex: 0xBCBDBE)
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
