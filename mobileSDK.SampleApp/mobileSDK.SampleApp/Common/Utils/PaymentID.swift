//
//  PaymentID.swift
//  SampleApp
//
//  Created by Ivan Krapivtsev on 22.08.2022.
//

import Foundation

func getUniquePaymentID() -> String {
    let paymentID = String(format: "sdk_ios_%0.0f", NSDate.now.timeIntervalSince1970)
    return paymentID
}
