//
//  MsdkCore.PaymentMethodType.swift
//  ecommpaySDK
//
//  Created by Ivan Krapivtsev on 25.07.2022.
//

#if !DEVELOPMENT
internal import MsdkCore
internal import mobileSDK_UI
#else
import MsdkCore
import mobileSDK_UI
#endif

extension mobileSDK_UI.CardType {
    static func createFrom(_ typeString: String?) -> mobileSDK_UI.CardType {
        if let typeString = typeString {
            return CardType.init(rawValue: typeString) ?? .unknown
        } else {
            return .unknown
        }
    }
}
