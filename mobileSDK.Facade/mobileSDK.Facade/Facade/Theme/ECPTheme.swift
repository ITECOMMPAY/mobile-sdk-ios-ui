//
//  ECPTheme.swift
//  ecommpaySDK
//
//  Created by Deniss Kaibagarovs on 27/05/2019.
//  Copyright © 2019 Ecommpay. All rights reserved.
//

import UIKit

public class ECPTheme: NSObject {
    
    @objc public var overlayColor: UIColor = UIColor.init(hexFromString: "#000000", alpha: 0.4)
    @objc public var backgroundColor: UIColor = UIColor.init(hexFromString: "#eef3fb")
    @objc public var headingTextColor: UIColor = UIColor.init(hexFromString: "#000000")
    @objc public var menuTextColor: UIColor = UIColor.init(hexFromString: "#217DFB")
    @objc public var fieldTextColor: UIColor = UIColor.init(hexFromString: "#293347")
    @objc public var supportiveTextColor: UIColor = UIColor.init(hexFromString: "#56627C")
    @objc public var fieldPlaceholderTextColor: UIColor = UIColor.init(hexFromString: "#b3bdd1")
    @objc public var fieldImageTintColor: UIColor = UIColor.init(hexFromString: "#b3bdd1")
    @objc public var fieldTextCorrectColor: UIColor = UIColor.init(hexFromString: "#007aff")
    @objc public var fieldTextWrongColor: UIColor = UIColor.init(hexFromString: "#ff3b30")
    @objc public var fieldBackgroundColor: UIColor = UIColor.init(hexFromString: "#FFFFFF")
    @objc public var selectorColor: UIColor = UIColor.init(hexFromString: "#000000")
    @objc public var selectorBackgroundColor: UIColor = UIColor.init(hexFromString: "#AAAAAA")
    @objc public var primaryTintColor: UIColor = UIColor.init(hexFromString: "#007AFF")
    @objc public var secondaryTintColor: UIColor = UIColor.init(hexFromString: "#8E8E93")
    @objc public var lineColor: UIColor = UIColor.init(hexFromString: "#C8C7CC")
    @objc public var actionButtonDisableBackgroundColor: UIColor = UIColor.init(hexFromString: "#8E8E93").multiplied(by: 0.5)
    @objc public var actionButtonDisableTextColor: UIColor = UIColor.init(hexFromString: "#FFFFFF")
    @objc public var actionButtonTextColor: UIColor = UIColor.init(hexFromString: "#FFFFFF")
    @objc public var searchInputViewPlaceholderColor: UIColor = UIColor.init(hexFromString: "#B2BDD2")
    @objc public var bankItemTextColor: UIColor = UIColor.init(hexFromString: "#293347")
    @objc public var actionButtonBackgroundColor: UIColor = UIColor.init(hexFromString: "#007AFF")

    @objc public var loadingScreenBackground = UIColor(hexFromString: "#04040F", alpha: 0.4)
    @objc public var clarificationInfoTextColor = UIColor(hexFromString: "#FFFFFF")
    @objc public var clarificationHeaderTextColor = UIColor(hexFromString: "#000000")
    @objc public var clarificationInfoBackgroundColor = UIColor(hexFromString: "#E5EFFF")
    @objc public var clarificationInfoCircleColor = UIColor(hexFromString: "#D9E7FF")
    @objc public var clarificationPaymentInfoBackgroundColor = UIColor(hexFromString: "#007AFF")
    @objc public var clarificationInfoTintColor = UIColor(hexFromString: "#007AFF")

    @objc public var searchIconWrapViewColor = UIColor(hexFromString: "#eef3fb")
    @objc public var searchViewIconColor = UIColor(hexFromString: "#B2BDD2")

    @objc public var showSearchViewBorder: Bool = true
    @objc public var showShadow: Bool = true
    @objc public var showDarkKeyboard: Bool = false
    @objc public var showDarkNavigationBar: Bool = false
    @objc public var showLightLogo: Bool = false
    @objc public var apsLogoOnly: Bool = true
    @objc public var showLightAPSLogos: Bool = false

    @objc
    public static func getLightTheme() -> ECPTheme { 
        return ECPTheme()
    }
    
    @objc
    public static func getDarkTheme() -> ECPTheme {
        let theme = ECPTheme()
        theme.backgroundColor = UIColor.init(hexFromString: "#34353c")
        theme.headingTextColor = UIColor.init(hexFromString: "#FFFFFF")
        theme.fieldBackgroundColor = UIColor.init(hexFromString: "#535560")
        theme.fieldTextColor = UIColor.init(hexFromString: "#FFFFFF")
        theme.supportiveTextColor = UIColor.init(hexFromString: "#b7b7b7")
        theme.selectorColor = UIColor.init(hexFromString: "#FFFFFF")
        theme.clarificationHeaderTextColor = UIColor.init(hexFromString: "#FFFFFF")
        theme.clarificationInfoBackgroundColor = UIColor.init(hexFromString: "#2A2A31")
        theme.clarificationPaymentInfoBackgroundColor = UIColor.init(hexFromString: "#2A2A31")
        theme.clarificationInfoBackgroundColor = theme.clarificationPaymentInfoBackgroundColor
        theme.clarificationInfoCircleColor = UIColor(hexFromString: "#FFFFFF", alpha: 0.1)
        theme.searchInputViewPlaceholderColor = theme.fieldPlaceholderTextColor
        theme.bankItemTextColor = theme.fieldTextColor
        theme.clarificationInfoTintColor = theme.selectorColor
        theme.searchIconWrapViewColor = theme.backgroundColor
        theme.searchViewIconColor = theme.searchInputViewPlaceholderColor

        theme.showDarkKeyboard = true
        theme.showShadow = false
        theme.showDarkNavigationBar = true
        theme.showLightLogo = true
        theme.showLightAPSLogos = true

        return theme
    }
}

extension ECPTheme: ColorTheme {
    var consentPageAgreementLinkColor: UIColor { primaryTintColor }
    var underlinedLinks: Bool { false }
    var navigationBarCustomColor: UIColor? { nil }
    var hiperlinkColor: UIColor { primaryTintColor }
    var hipertextMainColor: UIColor { secondaryTintColor }
    var actionButtonLoadingBackgroundColor: UIColor { primaryTintColor }
    var fieldsContainerViewBackgroundColor: UIColor { fieldBackgroundColor }
    var cardViewCheckmarkTintColor: UIColor { primaryTintColor }
    var cardViewSaveSettingTitleColor: UIColor { supportiveTextColor }
    var clarificationInfoLabelsColor: UIColor { clarificationInfoTextColor.withAlphaComponent(0.6) }
    var cardScanDisableColor: UIColor { actionButtonDisableBackgroundColor }
    var savedCardLockContainer: UIColor { backgroundColor }
}
