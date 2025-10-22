//
//  Dimensions.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 14.06.2022.
//

import SwiftUI

protocol DimensionScheme {
    /// Типичное расстояние от границ логического блока до элемента внутри. **default: 16**
    var middleSpacing: CGFloat { get }
    /// Типичное расстояние от границ экрана до контента страницы, а также между логическими блоками. **default: 26**
    var largeSpacing: CGFloat { get }
    /// Расстояние от границ блока деталей платежа до элементов внутри. **default: 20**
    var paymentOverviewSpacing: CGFloat { get }
    /// Расстояние между элементами в блоке детальной информации о платеже. **default: 18**
    var paymentDetailsSpacing: CGFloat { get }
    /// Высота кнопки payment details**default 33**
    var paymentDetailsButtonHeight: CGFloat { get }
    /// Расстояние между элементами в списке либо связанными логически элементами. **default: 10**
    var smallSpacing: CGFloat { get }
    /// Расстояние между названием атрибута в блоке деталей платежа и его описанием. **default: 6**
    var tinySpacing: CGFloat { get }
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
    /// Размер обводки полей ввода **default: 2**
    var inputBorderWidth: CGFloat { get }
    /// Высона карточки с информацией **default: 150**
    var infoCardHeight: CGFloat { get }
    /// Высона карточки с информацией без логотипа**default: 92**
    var infoCardShortenedHeight: CGFloat { get }
    /// Растояние между суммой и валютой на карточке платежа**default: 8**
    var valueToCurrencySpacing: CGFloat { get }
    /// Растояние между элементами  в горизонтальном списке на форме оплаты**default: 12**
    var formSmallSpacing: CGFloat { get }
    /// Большой вертикальный отступ на форме оплаты**default: 22**
    var formLargeVerticalSpacing: CGFloat { get }
    /// Высота кнопки оплаты**default: 45**
    var payButtonHeight: CGFloat { get }
    /// Расстояние между "оплатить" и суммой на кнопке оплаты**default: 5**
    var payButtonPayPriceSpacing: CGFloat { get }
    /// Высота полей ввода**default: 55**
    var textFieldHeight: CGFloat { get }
    /// Расстояние между подзаголовком экрана загрузки и кнопкой отмены. **default: 34**
    var cancelButtonLoadingSubtitleSpacing: CGFloat { get }
    /// Высота разделителя **default: 1**
    var dividerHeight: CGFloat { get }
}

struct DefaultDimensionScheme: DimensionScheme {
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
