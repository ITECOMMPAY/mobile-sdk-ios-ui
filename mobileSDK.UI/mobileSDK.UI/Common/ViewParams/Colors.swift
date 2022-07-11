//
//  Colors.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 14.06.2022.
//

import Foundation
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
}

struct DefaultLight: ColorScheme {
    let savedAccountBackground: Color = lightGray
    let screenHeader = Color.black
    let editableFieldBackground = lightGray
    let infoBlockBackground = lightGray
    let mainBackground = Color.white
    let shimmeringBackground = lightGray
    let shimmeringBase =  Color.black
    let shimmeringAccent = Color.black.opacity(0.3)
    let dimming = Color.black.opacity(0.8)
    let brandColor = Color(hex: 0x00579E)
    let paymentDetailsBackground = lightGray
    let border = Color(hex: 0xEBEBEE)
    let paymentDetailsInnerTitleColor = darkGray
    let paymentDetailsDescriptionColor = Color.black
    let text = Color.black
    let paymentInfoCardForegroundColor = Color.white

    private static let darkGray = Color(hex: 0x666666)
    private static let lightGray = Color(hex: 0xF6F7F9)
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
