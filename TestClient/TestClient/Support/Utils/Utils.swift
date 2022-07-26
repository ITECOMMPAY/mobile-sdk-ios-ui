//
//  Utils.swift
//  TestClient
//
//  Created by Ecommpay on 8/10/18.
//  Copyright © 2018 Ecommpay. All rights reserved.
//

import UIKit
#if ODTSDK
import ODTSDK
typealias PaymentDataType = ODTPPaymentData
#elseif JETPAY
import jetpayhostsSDK
typealias PaymentDataType = JetpayHostsPaymentData
#else
import ecommpaySDK
typealias PaymentDataType = ECMPPaymentData
#endif

class Utils: NSObject {
    class func signature(params: [String: Any], secret: String, ignoreParamKeys: [String]) -> String? {
        let sign = Utils().sign(params: params, secret: secret, ignoreParamKeys: ignoreParamKeys)
        return sign
    }

    @objc class func signature(params: String, secret: String) -> String? {
        let result = params.sha512(secret: secret)?.base64EncodedString()
        return result
    }

    private func sign(params: [String: Any], secret: String, ignoreParamKeys: [String], doNotHash: Bool = false) -> String? {
        let params = self.getParamsToSign(params: params, ignoreParamKeys: ignoreParamKeys, currentLevel: 1)
        let signString = params.joined(separator: ";")
        let result = doNotHash ? signString : signString.sha512(secret: secret)?.base64EncodedString()
        return result
    }

    private func getParamsToSign(params: [String: Any], ignoreParamKeys: [String] = [], currentLevel: Int = 1,
                                 prefix: String = "") -> [String] {
        var paramsToSign: [String] = []
        for (key, value) in params {
            print("signin param \(key) \(value)")
            if ignoreParamKeys.contains(key) && currentLevel == 1 {
                continue
            }

            let paramKey = (prefix.count > 0 ? prefix + ":" : "") + key

            var resultValue = ""

            if let value = value as? Bool {
                resultValue = value == true ? "1" : "0"
            } else if let value = value as? Int {
                resultValue = String(value)
            } else if let value = value as? String {
                resultValue = value
            }

            paramsToSign.append(paramKey + ":" + resultValue)
        }

        return paramsToSign.sorted(by: { (key1, key2) -> Bool in
            return key1.compare(key2) == .orderedAscending
        })
    }

    @objc public static func mapPaymentDataToString(paymentData: PaymentDataType?) -> String? {
        return mapCodableToString(codable: paymentData)
    }

    private static func mapCodableToString<T>(codable: T?) -> String? where T: Codable {
        let jsonEncoder = JSONEncoder()
        let jsonData = try? jsonEncoder.encode(codable)
        if let jsonData = jsonData {
            return String(data: jsonData, encoding: String.Encoding.utf8)
        }
        return ""
    }
}
