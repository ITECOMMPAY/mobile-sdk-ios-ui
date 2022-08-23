//
//  SignatureUtils.swift
//  SampleApp
//
//  Created by Ivan Krapivtsev on 22.08.2022.
//

import UIKit
import CommonCrypto

func signature(paramsToSign: String, secret: String) -> String {
    return paramsToSign.sha512(secret: secret)!.base64EncodedString();
}


extension String {
    func sha512(secret: String = "") -> Data? {
        guard let secretData = secret.data(using: .utf8),
              let selfData = self.data(using: .utf8) else { return nil }

        var macData = Data(count: Int(CC_SHA512_DIGEST_LENGTH))
        macData.withUnsafeMutableBytes { macBytes in
            selfData.withUnsafeBytes { selfBytes in
                secretData.withUnsafeBytes { secretBytes in
                    CCHmac(CCHmacAlgorithm(kCCHmacAlgSHA512), secretBytes, secretData.count, selfBytes, selfData.count, macBytes)
                }
            }
        }

        return macData
    }
}
