//
//  ThreeDSecureDTO.swift
//  TestClient
//
//  Created by Виталий Морозов on 30.04.2020.
//  Copyright © 2020 Ecommpay. All rights reserved.
//

import Foundation
#if ODTSDK
import ODTSDK
#elseif JETPAY
import jetpayhostsSDK
#else
import ecommpaySDK
#endif

class ThreeDSecureDTO : NSObject {
    @objc var isSendData: Bool = false
    @objc var threeDSecureObject: ThreeDSecureInfo?
    
    override init() {}
    
    @objc(isSendData:threeDSecureObject:)
    init(_ isSendData: Bool, _ threeDSecureObject: ThreeDSecureInfo) {
        self.isSendData = isSendData
        self.threeDSecureObject = threeDSecureObject
    }
    
    @objc(isSendParams)
    public func isSendParams() -> Bool {
        return self.isSendData
    }
    
    @objc(getThreeDSecureObject)
    public func getThreeDSecureObject() -> ThreeDSecureInfo? {
        return threeDSecureObject
    }
}
