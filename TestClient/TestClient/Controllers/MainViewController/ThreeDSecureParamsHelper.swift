//
//  ThreeDSecureParamsHelper.swift
//  TestClient
//
//  Created by Виталий Морозов on 09.04.2020.
//  Copyright © 2020 Ecommpay. All rights reserved.
//
#if ODTSDK
import ODTSDK
#elseif JETPAY
import jetpayhostsSDK
#else
import ecommpaySDK
#endif

class ThreeDSecureParamsHelper: NSObject {

    @objc func getThreeDSecureInfo() -> ThreeDSecureInfo {
        let threeDSecureInfo = ThreeDSecureInfo()

        let gifCard = ThreeDSecureGiftCardInfo()
        gifCard.amount = 12345
        gifCard.currency = "USD"
        gifCard.count = 1

        let threeDSecurePaymentInfo = ThreeDSecurePaymentInfo()
        threeDSecurePaymentInfo.setReorder(reorder: "01")
        threeDSecurePaymentInfo.setPreorderPurchase(preorderPurchase: "01")
        threeDSecurePaymentInfo.setPreorderDate(preorderDate: "01-10-2019")
        threeDSecurePaymentInfo.setChallengeIndicator(challengeIndicator: "01")
        threeDSecurePaymentInfo.setChallengeWindow(challengeWindow: "01")
        threeDSecurePaymentInfo.setGiftCard(giftCard: gifCard)

        let threeDSecureCustomerInfo = ThreeDSecureCustomerInfo()
        let threeDSecureAccountInfo = ThreeDSecureAccountInfo()
        let threeDSecureMpiResultInfo = ThreeDSecureMpiResultInfo()
        let threeDSecureShippingInfo = ThreeDSecureShippingInfo()
        threeDSecureAccountInfo.additional = "s"

        threeDSecureCustomerInfo.accountInfo = threeDSecureAccountInfo
        threeDSecureCustomerInfo.mpiResultInfo = threeDSecureMpiResultInfo
        threeDSecureCustomerInfo.shippingInfo = threeDSecureShippingInfo

        threeDSecureInfo.setThreeDSecurePaymentInfo(threeDSecurePaymentInfo: threeDSecurePaymentInfo)
        threeDSecureInfo.threeDSecureCustomerInfo = threeDSecureCustomerInfo

        return threeDSecureInfo
    }
}
