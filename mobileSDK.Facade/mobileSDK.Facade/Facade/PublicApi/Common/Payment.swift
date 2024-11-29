//
//  Payment.swift
//  ecommpaySDK
//
//  Created by Ivan Krapivtsev on 28.01.2022.
//  Copyright © 2022 Ecommpay. All rights reserved.
//

import Foundation
#if !DEVELOPMENT
internal import MsdkCore
#else
import MsdkCore
#endif

@objcMembers public class Payment: NSObject, Codable {
    public var status: String?
    public var type: String?
    public var id: String?
    public var date: String?
    public var method: String?
    public var sum: Int64
    public var currency: String?
    public var token: String?
    public var account: PaymentAccount?

    internal init(from corePayment: MsdkCore.Payment) {
        status = corePayment.status.map { $0.name }
        type = corePayment.type
        id = corePayment.id
        date = corePayment.date
        method = corePayment.method
        sum = corePayment.sum
        currency = corePayment.currency
        token = corePayment.token
        account = corePayment.account != nil ? PaymentAccount(from: corePayment.account!) : nil
        super.init()
    }
}

@objcMembers public class PaymentAccount: NSObject, Codable {
    public var number: String?
    public var type: String?
    public var cardHolder: String?   

    internal init(from corePayment: MsdkCore.Account) {
        number = corePayment.number
        type = corePayment.type
        cardHolder = corePayment.cardHolder
        super.init()
    }
}
