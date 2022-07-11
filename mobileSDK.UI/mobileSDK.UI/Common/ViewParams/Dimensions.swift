//
//  Dimensions.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 14.06.2022.
//

import SwiftUI

protocol DimensionScheme {
    /// Типичное расстояние от границ экрана до контента страницы, а также между логическими блоками. **default: 26**
    var largeSpacing: CGFloat { get }
    /// Типичное расстояние от границ логического блока до элемента внутри. **default: 16**
    var middleSpacing: CGFloat { get }
    /// Расстояние от границ блока деталей платежа до элементов внутри. **default: 20**
    var paymentDetailsSpacing: CGFloat { get }
    /// Расстояние между элементами в списке либо связанными логически элементами. **default: 10**
    var smallSpacing: CGFloat { get }
    /// Расстояние между названием атрибута в блоке деталей платежа и его описанием. **default: 6**
    var paymentDetailsAttributeSpacing: CGFloat { get }
    /// Высота кнопки ApplePay. **default: 48**
    var applePayButtonHeight: CGFloat { get }
    /// Высота кнопки платёжного метода. **default: 50**
    var paymentMethodButtonHeight: CGFloat { get }
    /// Радиус скругления подложки. **default: 12**
    var backgroundSheetCornerRadius: CGFloat { get }
    /// Радиус скругления копок. **default: 6**
    var buttonCornerRadius: CGFloat { get }
    /// Наименьший радиус скругления. **default: 4**
    var smallestCornerRadius: CGFloat { get }
    /// Наименьшая облась нажатия по гайдлайнам интерфейса iOS. **default: 44**
    var minimumTapAreaSize: CGFloat { get }
    /// Размер обводки элементов **default: 44**
    var borderWidth: CGFloat { get }
    /// Высона карточки с информацией **default: 150**
    var infoCardHeight: CGFloat { get }
    /// Растояние между суммой и валютой на карточке платежа**default: 8**
    var valueToCurrencySpacing: CGFloat { get }
}

struct DefaultDimensionScheme: DimensionScheme {
    let backgroundSheetCornerRadius: CGFloat = 12
    let paymentMethodButtonHeight: CGFloat = 50
    let applePayButtonHeight: CGFloat = 48
    let paymentDetailsAttributeSpacing: CGFloat = 6
    let smallSpacing: CGFloat = 10
    let paymentDetailsSpacing: CGFloat = 20
    let largeSpacing: CGFloat = 26
    let middleSpacing: CGFloat = 16
    let buttonCornerRadius: CGFloat = 6
    let smallestCornerRadius: CGFloat = 4
    let minimumTapAreaSize: CGFloat = 44
    let borderWidth: CGFloat = 1
    let infoCardHeight: CGFloat = 150
    let valueToCurrencySpacing: CGFloat = 8
}
