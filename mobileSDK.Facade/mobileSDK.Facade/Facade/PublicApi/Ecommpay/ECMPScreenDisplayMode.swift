//
//  ScreenDisplayMode.swift
//  ecommpaySDK
//
//  Created by Виталий Морозов on 09.09.2020.
//  Copyright © 2020 Ecommpay. All rights reserved.
//

import Foundation

@objc public enum ECMPScreenDisplayMode: Int,
                                         CaseIterable,
                                         CustomStringConvertible,
                                         RawRepresentable,
                                         ScreenDisplayModeConvertable {

    @objc(hide_success_final_page) case hide_success_final_page
    @objc(hide_decline_final_page) case hide_decline_final_page

    public var description: String {
        switch self {
            case .hide_decline_final_page:
                return "hide_decline_final_page"
            case .hide_success_final_page:
                return "hide_success_final_page"
            default:
                return ""
        }
    }

}

internal extension ECMPScreenDisplayMode {
    var internalScreenDisplayMode: ScreenDisplayMode {
        switch self {
        case .hide_decline_final_page: return .hideDeclineFinalPage
        case .hide_success_final_page: return .hideSuccessFinalPage
        }
    }
}
