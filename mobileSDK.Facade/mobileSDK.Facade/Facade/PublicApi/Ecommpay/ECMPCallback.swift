//
//  ECPCallback.swift
//  ecommpaySDK
//
//  Created by Виталий Морозов on 23.09.2020.
//  Copyright © 2020 Ecommpay. All rights reserved.
//

import Foundation

@objc public protocol ECMPCallback {
    @objc(onPaymentResult:) func onPaymentResult(paymentData: ECMPPaymentData?)
}

@objcMembers public class ECMPPaymentData: NSObject, Codable {
    public var payment: Payment?
}
