//
//  ThreeDSecureMapper.swift
//  ecommpaySDK
//
//  Created by Виталий Морозов on 09.04.2020.
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

internal class TheeDSecureInfoToRequestObjectMapper {
    
    func map(viewObjectList: [ThreeDSecureVO]) -> ThreeDSecureInfo {
        let merchantRisk = getPaymentMerchantRisk(viewObjectList)
        let accountInfo = getCustomerAccountInfo(viewObjectList)
        let shipping = getCustomerShipping(viewObjectList)
        let mpiResult = getCustomerMpiResult(viewObjectList)
        let billingRegionCode = getBillingRegionCode(viewObjectList)
        
        var threeDSecurePaymentInfo: ThreeDSecurePaymentInfo?
        if let merchantRisk = merchantRisk {
            threeDSecurePaymentInfo = mapToThreeDSecurePaymentInfo(merchantRisk)
        }
        
        let threeDSecureCustomerInfo = mapToThreeDSecureCustomerInfo(
            accountInfo,
            shipping,
            mpiResult,
            billingRegionCode)
        
        return ThreeDSecureInfo(threeDSecurePaymentInfo, threeDSecureCustomerInfo)
    }
    
    func mapToThreeDSecureCustomerInfo(
        _ accountInfoJson: ThreeDSecureCustomerAccountInfoRequest?,
        _ shipping: ThreeDSecureCustomerShippingRequest?,
        _ mpiResult: ThreeDSecureCustomerMpiResultRequest?,
        _ billingRegionCode: ThreeDSecureBillingRegionCode?) -> ThreeDSecureCustomerInfo? {
        
        let threeDSecureCustomerInfo = ThreeDSecureCustomerInfo()
        threeDSecureCustomerInfo.addressMatch = accountInfoJson?.customer?.address_match
        threeDSecureCustomerInfo.homePhone = accountInfoJson?.customer?.home_phone
        threeDSecureCustomerInfo.workPhone = accountInfoJson?.customer?.work_phone
        threeDSecureCustomerInfo.billingRegionCode = billingRegionCode?.billing_region_code
        
        if let accountInfoJson = accountInfoJson {
            if let accountJson = accountInfoJson.customer?.account {
                threeDSecureCustomerInfo.accountInfo = mapToThreeDSecureAccountInfo(accountJson)
            }
            
        }
        
        if let shippingJson = shipping {
            threeDSecureCustomerInfo.shippingInfo = mapToThreeDSecureShippingInfo(shippingJson)
        }
        
        if let mpiResultJson = mpiResult {
            threeDSecureCustomerInfo.mpiResultInfo = mapToThreeDSecureMpiResultInfo(mpiResultJson)
        }
        
        return threeDSecureCustomerInfo
    }
    
    func mapToThreeDSecureMpiResultInfo(_ mpiResultJson: ThreeDSecureCustomerMpiResultRequest) -> ThreeDSecureMpiResultInfo? {
        let threeDSecureMpiResultInfo = ThreeDSecureMpiResultInfo()
        threeDSecureMpiResultInfo.acsOperationId = mpiResultJson.customer?.mpi_result.acs_operation_id
        threeDSecureMpiResultInfo.authenticationFlow = mpiResultJson.customer?.mpi_result.authentication_flow
        threeDSecureMpiResultInfo.authenticationTimestamp = mpiResultJson.customer?.mpi_result.authentication_timestamp
        return threeDSecureMpiResultInfo
    }
    
    func mapToThreeDSecureShippingInfo(_ shippingJson: ThreeDSecureCustomerShippingRequest) -> ThreeDSecureShippingInfo? {
        let threeDSecureShippingInfo = ThreeDSecureShippingInfo()
        
        threeDSecureShippingInfo.address = shippingJson.customer?.shipping.address
        threeDSecureShippingInfo.addressUsage = shippingJson.customer?.shipping.address_usage
        threeDSecureShippingInfo.addressUsageIndicator = shippingJson.customer?.shipping.address_usage_indicator
        threeDSecureShippingInfo.city = shippingJson.customer?.shipping.city
        threeDSecureShippingInfo.country = shippingJson.customer?.shipping.country
        threeDSecureShippingInfo.deliveryEmail = shippingJson.customer?.shipping.delivery_email
        threeDSecureShippingInfo.deliveryTime = shippingJson.customer?.shipping.delivery_time
        threeDSecureShippingInfo.nameIndicator = shippingJson.customer?.shipping.name_indicator
        threeDSecureShippingInfo.postal = shippingJson.customer?.shipping.postal
        threeDSecureShippingInfo.regionCode = shippingJson.customer?.shipping.region_code
        threeDSecureShippingInfo.type = shippingJson.customer?.shipping.type
        return threeDSecureShippingInfo
    }
    
    func mapToThreeDSecureAccountInfo(_ accountJson: ThreeDSecureAccountRequest) -> ThreeDSecureAccountInfo? {
        let threeDSecureAccountInfo = ThreeDSecureAccountInfo()
        threeDSecureAccountInfo.activityDay = accountJson.activity_day
        threeDSecureAccountInfo.activityYear = accountJson.activity_year
        threeDSecureAccountInfo.additional = accountJson.additional
        threeDSecureAccountInfo.ageIndicator = accountJson.age_indicator
        threeDSecureAccountInfo.authData = accountJson.auth_data
        threeDSecureAccountInfo.authMethod = accountJson.auth_method
        threeDSecureAccountInfo.authTime = accountJson.auth_time
        threeDSecureAccountInfo.changeDate = accountJson.change_date
        threeDSecureAccountInfo.changeIndicator = accountJson.change_indicator
        threeDSecureAccountInfo.date = accountJson.date
        threeDSecureAccountInfo.passChangeDate = accountJson.pass_change_date
        threeDSecureAccountInfo.passChangeIndicator = accountJson.pass_change_indicator
        threeDSecureAccountInfo.paymentAge = accountJson.payment_age
        threeDSecureAccountInfo.paymentAgeIndicator = accountJson.payment_age_indicator
        threeDSecureAccountInfo.provisionAttempts = accountJson.provision_attempts
        threeDSecureAccountInfo.purchaseNumber = accountJson.purchase_number
        threeDSecureAccountInfo.suspiciousActivity = accountJson.suspicious_activity
        return threeDSecureAccountInfo
    }
    
    func mapToThreeDSecurePaymentInfo(_ merchantRisk: ThreeDSecurePaymentMerchantRiskRequest) -> ThreeDSecurePaymentInfo? {
        let threedSecurePaymentInfo = ThreeDSecurePaymentInfo()
        threedSecurePaymentInfo.reorder = merchantRisk.payment?.reorder
        threedSecurePaymentInfo.challengeIndicator = merchantRisk.payment?.challenge_indicator
        threedSecurePaymentInfo.challengeWindow = merchantRisk.payment?.challenge_window
        threedSecurePaymentInfo.preorderDate = merchantRisk.payment?.preorder_date
        threedSecurePaymentInfo.preorderPurchase = merchantRisk.payment?.preorder_purchase
        if let gifCard = merchantRisk.payment?.gift_card {
            threedSecurePaymentInfo.giftCard = mapToThreeDSecureGiftCardInfo(gifCard)
        }
        return threedSecurePaymentInfo
    }
    
    func mapToThreeDSecureGiftCardInfo(_ giftCard: ThreeDSecureGifCardRequest) -> ThreeDSecureGiftCardInfo? {
        let threeDSecureGifCard = ThreeDSecureGiftCardInfo()
        threeDSecureGifCard.amount = giftCard.amount
        threeDSecureGifCard.count = giftCard.count
        threeDSecureGifCard.currency = giftCard.currency
        return threeDSecureGifCard
    }
    
    func getPaymentMerchantRisk(_ viewObjectList: [ThreeDSecureVO]) -> ThreeDSecurePaymentMerchantRiskRequest? {
        if let jsonData = viewObjectList.first(where: { vo in vo.type == "payment_merchant_risk" })?.json?.data(using: .utf8) {
            return try? JSONDecoder().decode(ThreeDSecurePaymentMerchantRiskRequest.self, from: jsonData)
        }
        return nil
    }
    
    func getCustomerAccountInfo(_ viewObjectList: [ThreeDSecureVO]) -> ThreeDSecureCustomerAccountInfoRequest? {
        if let jsonData = viewObjectList.first(where: { vo in vo.type == "customer_account_info" })?.json?.data(using: .utf8) {
            return try? JSONDecoder().decode(ThreeDSecureCustomerAccountInfoRequest.self, from: jsonData)
        }
        return nil
    }
    
    func getCustomerShipping(_ viewObjectList: [ThreeDSecureVO]) -> ThreeDSecureCustomerShippingRequest? {
        if let jsonData = viewObjectList.first(where: { vo in vo.type == "customer_shipping" })?.json?.data(using: .utf8) {
            return try? JSONDecoder().decode(ThreeDSecureCustomerShippingRequest.self, from: jsonData)
        }
        return nil
    }
    
    func getCustomerMpiResult(_ viewObjectList: [ThreeDSecureVO]) -> ThreeDSecureCustomerMpiResultRequest? {
        if let jsonData = viewObjectList.first(where: { vo in vo.type == "customer_mpi_result" })?.json?.data(using: .utf8) {
            return try? JSONDecoder().decode(ThreeDSecureCustomerMpiResultRequest.self, from: jsonData)
        }
        return nil
    }
    
    func getBillingRegionCode(_ viewObjectList: [ThreeDSecureVO]) -> ThreeDSecureBillingRegionCode? {
        if let jsonData = viewObjectList.first(where: { vo in vo.type == "billing_region_code" })?.json?.data(using: .utf8) {
            return try? JSONDecoder().decode(ThreeDSecureBillingRegionCode.self, from: jsonData)
        }
        return nil
    }
}

internal class ThreeDSecureBillingRegionCode: Codable {
    var billing_region_code: String?
}

internal class ThreeDSecurePaymentMerchantRiskRequest: Codable {
    
    var payment: Payment?
    
    class Payment: Codable {
        public var reorder: String?
        public var preorder_purchase: String?
        public var preorder_date: String?
        public var challenge_indicator: String?
        public var challenge_window: String?
        public var gift_card: ThreeDSecureGifCardRequest?
    }
}

internal class ThreeDSecureGifCardRequest: Codable {
    public var amount: Int?
    public var currency: String?
    public var count: Int?
}

internal class ThreeDSecureCustomerAccountInfoRequest: Codable {
    
    var customer: Customer?
    
    class Customer: Codable {
        public var address_match: String?
        public var home_phone: String?
        public var work_phone: String?
        public var account: ThreeDSecureAccountRequest?
    }
}

internal class ThreeDSecureAccountRequest: Codable {
    public var additional: String?
    public var age_indicator: String?
    public var date: String?
    public var change_indicator: String?
    public var change_date: String?
    public var pass_change_indicator: String?
    public var pass_change_date: String?
    public var purchase_number: Int?
    public var provision_attempts: Int?
    public var activity_day: Int?
    public var activity_year: Int?
    public var payment_age_indicator: String?
    public var payment_age: String?
    public var suspicious_activity: String?
    public var auth_method: String?
    public var auth_time: String?
    public var auth_data: String?
}

internal class ThreeDSecureCustomerShippingRequest: Codable {
    var customer: Customer?
    
    class Customer: Codable {
        var shipping: Shipping
        
        class Shipping: Codable {
            public var type: String?
            public var delivery_time: String?
            public var delivery_email: String?
            public var address_usage_indicator: String?
            public var address_usage: String?
            public var city: String?
            public var country: String?
            public var address: String?
            public var postal: String?
            public var region_code: String?
            public var name_indicator: String?
        }
    }
}

internal class ThreeDSecureCustomerMpiResultRequest: Codable {
    var customer: Customer?
    
    class Customer: Codable {
        var mpi_result: MpiResult
        
        class MpiResult: Codable {
            public var acs_operation_id: String?
            public var authentication_flow: String?
            public var authentication_timestamp: String?
        }
    }
}
