//
//  Models.swift
//  EcommpaySample
//
//  Created by Ivan Krapivtsev on 28.10.2022.
//

import Foundation
import EcommpaySDK

struct Account: Codable {
    var additional: String?
    var ageIndicator: String?
    var date: String?
    var changeIndicator: String?
    var changeDate: String?
    var passChangeIndicator: String?
    var passChangeDate: String?
    var purchaseNumber: Int?
    var provisionAttempts: Int?
    var activityDay: Int?
    var activityYear: Int?
    var paymentAgeIndicator: String?
    var paymentAge: String?
    var suspiciousActivity: String?
    var authMethod: String?
    var authTime: String?
    var authData: String?

    enum CodingKeys: String, CodingKey {
        case additional, date
        case ageIndicator = "age_indicator"
        case changeIndicator = "change_indicator"
        case changeDate = "change_date"
        case passChangeIndicator = "pass_change_indicator"
        case passChangeDate = "pass_change_date"
        case purchaseNumber = "purchase_number"
        case provisionAttempts = "provision_attempts"
        case activityDay = "activity_day"
        case activityYear = "activity_year"
        case paymentAgeIndicator = "payment_age_indicator"
        case paymentAge = "payment_age"
        case suspiciousActivity = "suspicious_activity"
        case authMethod = "auth_method"
        case authTime = "auth_time"
        case authData = "auth_data"
    }

    static let `default` =  Account(
        additional: "gamer12345",
        ageIndicator: "01",
        date: "01-10-2019",
        changeIndicator: "01",
        changeDate: "01-10-2019",
        passChangeIndicator: "01",
        passChangeDate: "01-10-2019",
        purchaseNumber: 12,
        provisionAttempts: 16,
        activityDay: 22,
        activityYear: 222,
        paymentAgeIndicator: "01",
        paymentAge: "01-10-2019",
        suspiciousActivity: "01",
        authMethod: "01",
        authTime: "01-10-201913:12",
        authData: "login_0102"
    )
}

struct Customer: Codable {
    var addressMatch: String?
    var homePhone: String?
    var workPhone: String?
    var account: Account?
    var shipping: Shipping?
    var mpiResult: MpiResult?

    enum CodingKeys: String, CodingKey {
        case account, shipping
        case mpiResult = "mpi_result"
        case addressMatch = "address_match"
        case homePhone = "home_phone"
        case workPhone = "work_phone"
    }
}

struct CustomerAccountInfo: Codable {
    var customer: Customer?
    static let `default` = CustomerAccountInfo(
        customer: Customer(
            addressMatch: "Y",
            homePhone: "79105211111",
            workPhone: "74955211111",
            account: Account.default
        )
    )
}

struct CustomerMpiResult: Codable {
    var customer: Customer?
    static let `default` = CustomerMpiResult(
        customer: Customer(
            mpiResult: MpiResult.default
        )
    )

}

struct CustomerShipping: Codable {
    var customer: Customer?
    static let `default` = CustomerShipping(
        customer: Customer(
            shipping: Shipping.default
        )
    )

}

struct MpiResult: Codable {
    var acsOperationId: String?
    var authenticationFlow: String?
    var authenticationTimestamp: String?

    enum CodingKeys: String, CodingKey {
        case acsOperationId = "acs_operation_id"
        case authenticationFlow = "authentication_flow"
        case authenticationTimestamp = "authentication_timestamp"
    }
    static let `default` =  MpiResult(
        acsOperationId: "00000000-0005-5a5a-8000-016d3ea31d54",
        authenticationFlow: "01",
        authenticationTimestamp: "201812141050"
    )
}

struct Shipping: Codable {
    var type: String?
    var deliveryTime: String?
    var deliveryEmail: String?
    var addressUsageIndicator: String?
    var addressUsage: String?
    var city: String?
    var country: String?
    var address: String?
    var postal: String?
    var regionCode: String?
    var nameIndicator: String?

    enum CodingKeys: String, CodingKey {
        case type, city, country, address, postal
        case deliveryTime = "delivery_time"
        case deliveryEmail = "delivery_email"
        case addressUsageIndicator = "address_usage_indicator"
        case addressUsage = "address_usage"
        case regionCode = "region_code"
        case nameIndicator = "name_indicator"
    }

    static let `default` = Shipping(
        type: "01",
        deliveryTime: "01",
        deliveryEmail: "test@gmail.com",
        addressUsageIndicator: "01",
        addressUsage: "01-10-2019",
        city: "Moscow",
        country: "RU",
        address: "Lenina street 12",
        postal: "109111",
        regionCode: "MOW",
        nameIndicator: "01"
    )

}

struct GiftCard: Codable {
    var amount: Int?
    var currency: String?
    var count: Int?

    static let `default` = GiftCard(
        amount: 12345,
        currency: "USD",
        count: 1
    )
}

struct Payment: Codable {
    var reorder: String?
    var preorderPurchase: String?
    var preorderDate: String?
    var challengeIndicator: String?
    var challengeWindow: String?
    var giftCard: GiftCard?

    enum CodingKeys: String, CodingKey {
        case reorder
        case preorderPurchase = "preorder_purchase"
        case preorderDate = "preorder_date"
        case challengeIndicator = "challenge_indicator"
        case challengeWindow = "challenge_window"
        case giftCard = "gift_card"
    }

    static let `default` = Payment(
        reorder: "01",
        preorderPurchase: "01",
        preorderDate: "01-10-2020",
        challengeIndicator: "01",
        challengeWindow: "01",
        giftCard: GiftCard.default
    )
}

struct PaymentMerchantRisk: Codable {
    var payment: Payment?

    static let `default` = PaymentMerchantRisk(
        payment: Payment.default
    )
}

struct ThreeDSecureInfo: Codable {
    var billingRegionCode: String?
    var customerAccountInfo: CustomerAccountInfo?
    var customerShipping: CustomerShipping?
    var customerMpiResult: CustomerMpiResult?
    var paymentMerchantRisk: PaymentMerchantRisk?

    enum CodingKeys: String, CodingKey {
        case billingRegionCode = "billing_region_code"
        case customerAccountInfo = "customer_account_info"
        case customerShipping = "customer_shipping"
        case customerMpiResult = "customer_mpi_result"
        case paymentMerchantRisk = "payment_merchant_risk"
    }

    static let `default` = ThreeDSecureInfo(
        billingRegionCode: "CRS",
        customerAccountInfo: CustomerAccountInfo.default,
        customerShipping: CustomerShipping.default,
        customerMpiResult: CustomerMpiResult.default,
        paymentMerchantRisk: PaymentMerchantRisk.default
    )

    var sdkThreeDSecureInfo: EcommpaySDK.ThreeDSecureInfo {
        EcommpaySDK.ThreeDSecureInfo.init(
            threeDSecurePaymentInfo: paymentMerchantRisk?.payment.map({ payment in
                EcommpaySDK.ThreeDSecurePaymentInfo(
                    reorder: payment.reorder,
                    preorderPurchase: payment.preorderPurchase,
                    preorderDate: payment.preorderDate,
                    challengeIndicator: payment.challengeIndicator,
                    challengeWindow: payment.challengeWindow,
                    giftCard: payment.giftCard.map({ giftCard in
                        EcommpaySDK.ThreeDSecureGiftCardInfo(
                            amount: giftCard.amount,
                            currency: giftCard.currency,
                            count: giftCard.count
                        )
                    })
                )
            }),
            threeDSecureCustomerInfo: EcommpaySDK.ThreeDSecureCustomerInfo(
                addressMatch: customerAccountInfo?.customer?.addressMatch,
                homePhone: customerAccountInfo?.customer?.homePhone,
                workPhone: customerAccountInfo?.customer?.workPhone,
                billingRegionCode: billingRegionCode,
                accountInfo: customerAccountInfo?.customer?.account.map({ account in
                    EcommpaySDK.ThreeDSecureAccountInfo(
                        additional: account.additional,
                        ageIndicator: account.ageIndicator,
                        date: account.date,
                        changeIndicator: account.changeIndicator,
                        changeDate: account.changeDate,
                        passChangeIndicator: account.passChangeIndicator,
                        passChangeDate: account.passChangeDate,
                        purchaseNumber: account.purchaseNumber,
                        provisionAttempts: account.provisionAttempts,
                        activityDay: account.activityDay,
                        activityYear: account.activityYear,
                        paymentAgeIndicator: account.paymentAgeIndicator,
                        paymentAge: account.paymentAge,
                        suspiciousActivity: account.suspiciousActivity,
                        authMethod: account.authMethod,
                        authTime: account.authTime,
                        authData: account.authData)
                }),
                shippingInfo: customerShipping?.customer?.shipping.map({ shipping in
                    EcommpaySDK.ThreeDSecureShippingInfo(
                        type: shipping.type,
                        deliveryTime: shipping.deliveryTime,
                        deliveryEmail: shipping.deliveryEmail,
                        addressUsageIndicator: shipping.addressUsageIndicator,
                        addressUsage: shipping.addressUsage,
                        city: shipping.city,
                        country: shipping.country,
                        address: shipping.address,
                        postal: shipping.postal,
                        regionCode: shipping.regionCode,
                        nameIndicator: shipping.nameIndicator
                    )
                }),
                mpiResultInfo: customerMpiResult?.customer?.mpiResult.map({ mpiResult in
                    EcommpaySDK.ThreeDSecureMpiResultInfo(
                        acsOperationId: mpiResult.acsOperationId,
                        authenticationFlow: mpiResult.authenticationFlow,
                        authenticationTimestamp: mpiResult.authenticationTimestamp
                    )
                })
            )
        )
    }
}
