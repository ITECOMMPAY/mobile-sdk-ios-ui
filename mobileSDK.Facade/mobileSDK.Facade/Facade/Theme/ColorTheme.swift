//
//  ColorTheme.swift
//  ecommpaySDK
//
//  Created by Ivan Krapivev on 28.01.2022.
//  Copyright © 2022 Ecommpay. All rights reserved.
//

import UIKit

protocol ColorTheme {
    var overlayColor: UIColor { get }
    var backgroundColor: UIColor { get }
    var headingTextColor: UIColor { get }
    var menuTextColor: UIColor { get }
    var fieldTextColor: UIColor { get }
    var supportiveTextColor: UIColor { get }
    var fieldPlaceholderTextColor: UIColor { get }
    var fieldImageTintColor: UIColor { get }
    var fieldTextCorrectColor: UIColor { get }
    var fieldTextWrongColor: UIColor { get }
    var fieldBackgroundColor: UIColor { get }
    var fieldsContainerViewBackgroundColor: UIColor { get }
    var selectorColor: UIColor { get }
    var selectorBackgroundColor: UIColor { get }
    var primaryTintColor: UIColor { get }
    var secondaryTintColor: UIColor { get }
    var lineColor: UIColor { get }
    var hiperlinkColor: UIColor { get }
    var hipertextMainColor: UIColor { get }

    var cardViewCheckmarkTintColor: UIColor { get }
    var cardViewSaveSettingTitleColor: UIColor { get }
    var cardScanDisableColor: UIColor { get }
    var savedCardLockContainer: UIColor { get }

    var actionButtonBackgroundColor: UIColor { get }
    var actionButtonDisableBackgroundColor: UIColor { get }
    var actionButtonLoadingBackgroundColor: UIColor { get }
    var actionButtonDisableTextColor: UIColor { get }
    var actionButtonTextColor: UIColor { get }

    var searchInputViewPlaceholderColor: UIColor { get }
    var searchViewIconColor: UIColor { get }
    var searchIconWrapViewColor: UIColor { get }

    var bankItemTextColor: UIColor { get }

    var loadingScreenBackground: UIColor { get }
    var clarificationInfoTextColor: UIColor { get }
    var clarificationInfoLabelsColor: UIColor { get }
    var clarificationHeaderTextColor: UIColor { get }
    var clarificationInfoBackgroundColor: UIColor { get }
    var clarificationInfoCircleColor: UIColor { get }
    var clarificationPaymentInfoBackgroundColor: UIColor { get }
    var clarificationInfoTintColor: UIColor { get }

    var consentPageAgreementLinkColor: UIColor { get }

    var navigationBarCustomColor: UIColor? { get }

    var showSearchViewBorder: Bool { get }
    var showShadow: Bool { get }
    var showDarkKeyboard: Bool { get }
    var showDarkNavigationBar: Bool { get }
    var showLightLogo: Bool { get }
    var apsLogoOnly: Bool { get }
    var showLightAPSLogos: Bool { get }
    var underlinedLinks: Bool { get }
}
