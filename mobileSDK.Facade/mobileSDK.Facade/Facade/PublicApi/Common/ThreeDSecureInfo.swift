//
//  ThreeDSecureInfo.swift
//  etoedtoSDK
//
//  Created by Виталий Морозов on 09.04.2020.
//  Copyright © 2020 Etoedto. All rights reserved.
//
import Foundation
#if !DEVELOPMENT
@_implementationOnly import MsdkCore
#else
import MsdkCore
#endif

public class ThreeDSecureInfo: NSObject {
    @objc public override init() {
        super.init()
    }

    public init(threeDSecurePaymentInfo: ThreeDSecurePaymentInfo? = nil, threeDSecureCustomerInfo: ThreeDSecureCustomerInfo? = nil) {
        self.threeDSecurePaymentInfo = threeDSecurePaymentInfo
        self.threeDSecureCustomerInfo = threeDSecureCustomerInfo
    }

    public var threeDSecurePaymentInfo: ThreeDSecurePaymentInfo?
    public var threeDSecureCustomerInfo: ThreeDSecureCustomerInfo?

    @objc(setThreeDSecurePaymentInfo:)
    /// - Parameter threeDSecurePaymentInfo
    public func setThreeDSecurePaymentInfo(threeDSecurePaymentInfo: ThreeDSecurePaymentInfo) {
        self.threeDSecurePaymentInfo = threeDSecurePaymentInfo
    }

    @objc(setThreeDSecureCustomerInfo:)
    /// - Parameter threeDSecureCustomerInfo
    public func setThreeDSecureCustomerInfo(threeDSecureCustomerInfo: ThreeDSecureCustomerInfo) {
        self.threeDSecureCustomerInfo = threeDSecureCustomerInfo
    }
}

public class ThreeDSecurePaymentInfo: NSObject {
    @objc public override init() {
        super.init()
    }

    public init(reorder: String? = nil,
                  preorderPurchase: String? = nil,
                  preorderDate: String? = nil,
                  challengeIndicator: String? = nil,
                  challengeWindow: String? = nil,
                  giftCard: ThreeDSecureGiftCardInfo? = nil) {
        self.reorder = reorder
        self.preorderPurchase = preorderPurchase
        self.preorderDate = preorderDate
        self.challengeIndicator = challengeIndicator
        self.challengeWindow = challengeWindow
        self.giftCard = giftCard
    }

    public var reorder: String?
    public var preorderPurchase: String?
    public var preorderDate: String?
    public var challengeIndicator: String?
    public var challengeWindow: String?
    public var giftCard: ThreeDSecureGiftCardInfo?

    @objc(setReorder:)
    /// This parameter indicates whether the cardholder is reordering previously purchased merchandise.
    /// - Parameter reorder: Example: 01 (First time ordered), 02 (Reordered)
    public func setReorder(reorder: String) {
        self.reorder = reorder
    }

    @objc(setPreorderPurchase:)
    /// This parameter indicates whether cardholder is placing an order for merchandise with a future availability or release date
    /// - Parameter preorderPurchase: Example: 01 (Merchandise available), 02 (Future availability)
    public func setPreorderPurchase(preorderPurchase: String) {
        self.preorderPurchase = preorderPurchase
    }

    @objc(setPreorderDate:)
    /// The date the preordered merchandise will be available.
    /// - Parameter preorderDate: DD-MM-YYYY
    public func setPreorderDate(preorderDate: String) {
        self.preorderDate = preorderDate
    }

    @objc(setChallengeIndicator:)
    /// This parameter indicates whether challenge flow is requested for this payment.
    /// - Parameter challengeIndicator: Example: 01 (No preference), 02 (No challenge),
    /// 03 (Challenge requested (3DS Requestor preference), 04 (Challenge requested (Mandate))
    public func setChallengeIndicator(challengeIndicator: String) {
        self.challengeIndicator = challengeIndicator
    }

    @objc(setChallengeWindow:)
    /// The dimensions of a window in which authentication page opens.
    /// - Parameter challengeWindow: 01 (250x400), 02 (390x400), 03 (500x600), 04 (600x400), 05 (Full screen)
    public func setChallengeWindow(challengeWindow: String) {
        self.challengeWindow = challengeWindow
    }

    @objc(setGiftCard:)
    /// Object with information about payment with prepaid card or gift card.
    /// - Parameter giftCard
    public func setGiftCard(giftCard: ThreeDSecureGiftCardInfo) {
        self.giftCard = giftCard
    }

    private func isValidParam(param: String?) -> Bool {
        return param?.isEmpty ?? false
    }
}

public class ThreeDSecureGiftCardInfo: NSObject {
    @objc public override init() {
        super.init()
    }

    public init(amount: Int? = nil, currency: String? = nil, count: Int? = nil) {
        self.amount = amount
        self.currency = currency
        self.count = count
    }

    public var amount: Int?
    public var currency: String?
    public var count: Int?

    @objc(setAmount:)
    /// Amount of payment with prepaid or gift card denominated in minor currency units.
    /// - Parameter amount: Example: 123.45 -> 123.
    public func setAmount(amount: Int) {
        self.amount = amount
    }

    @objc(setCurrency:)
    /// Currency of payment with prepaid or gift card in the ISO 4217 alpha-3 format
    /// - Parameter currency: Example: ISO 4217 numeric.
    public func setCurrency(currency: String) {
        self.currency = currency
    }

    @objc(setCount:)
    /// Total number of individual prepaid or gift cards/codes used in purchase.
    /// - Parameter count
    public func setCount(count: Int) {
        self.count = count
    }
}

public class ThreeDSecureCustomerInfo: NSObject {
    @objc public override init() {
        super.init()
    }

    public init(addressMatch: String? = nil,
                  homePhone: String? = nil,
                  workPhone: String? = nil,
                  billingRegionCode: String? = nil,
                  accountInfo: ThreeDSecureAccountInfo? = nil,
                  shippingInfo: ThreeDSecureShippingInfo? = nil,
                  mpiResultInfo: ThreeDSecureMpiResultInfo? = nil) {
        self.addressMatch = addressMatch
        self.homePhone = homePhone
        self.workPhone = workPhone
        self.billingRegionCode = billingRegionCode
        self.accountInfo = accountInfo
        self.shippingInfo = shippingInfo
        self.mpiResultInfo = mpiResultInfo
    }

    public var addressMatch: String?
    public var homePhone: String?
    public var workPhone: String?
    public var billingRegionCode: String?
    public var accountInfo: ThreeDSecureAccountInfo?
    public var shippingInfo: ThreeDSecureShippingInfo?
    public var mpiResultInfo: ThreeDSecureMpiResultInfo?

    @objc(setAddressMatch:)
    /// The parameter indicates whether the customer billing address matches the address specified in the shipping object.
    /// - Parameter addressMatch: Example: Y (Shipping Address matches Billing Address), N (Shipping Address does not match Billing Address)
    public func setAddressMatch(addressMatch: String) {
        self.addressMatch = addressMatch
    }

    @objc(setHomePhone:)
    /// Customer home phone number.
    /// - Parameter homePhone
    public func setHomePhone(homePhone: String) {
        self.homePhone = homePhone
    }

    @objc(setWorkPhone:)
    /// Customer work phone number.
    /// - Parameter workPhone
    public func setWorkPhone(workPhone: String) {
        self.workPhone = workPhone
    }

    @objc(setBillingRegionCode:)
    /// State, province, or region code in the ISO 3166-2 format. Example: SPE for Saint Petersburg, Russia.
    /// - Parameter billingRegionCode
    public func setBillingRegionCode(billingRegionCode: String) {
        self.billingRegionCode = billingRegionCode
    }

    @objc(setAccountInfo:)
    /// - Parameter accountInfo
    public func setAccountInfo(accountInfo: ThreeDSecureAccountInfo) {
        self.accountInfo = accountInfo
    }

    @objc(setShippingInfo:)
    /// - Parameter shippingInfo
    public func setShippingInfo(shippingInfo: ThreeDSecureShippingInfo) {
        self.shippingInfo = shippingInfo
    }

    @objc(setMpiResultInfo:)
    /// - Parameter mpiResultInfo
    public func setMpiResultInfo(mpiResultInfo: ThreeDSecureMpiResultInfo) {
        self.mpiResultInfo = mpiResultInfo
    }
}

public class ThreeDSecureAccountInfo: NSObject {
    @objc public override init() {
        super.init()
    }

    public init(additional: String? = nil,
                  ageIndicator: String? = nil,
                  date: String? = nil,
                  changeIndicator: String? = nil,
                  changeDate: String? = nil,
                  passChangeIndicator: String? = nil,
                  passChangeDate: String? = nil,
                  purchaseNumber: Int? = nil,
                  provisionAttempts: Int? = nil,
                  activityDay: Int? = nil,
                  activityYear: Int? = nil,
                  paymentAgeIndicator: String? = nil,
                  paymentAge: String? = nil,
                  suspiciousActivity: String? = nil,
                  authMethod: String? = nil,
                  authTime: String? = nil,
                  authData: String? = nil) {
        self.additional = additional
        self.ageIndicator = ageIndicator
        self.date = date
        self.changeIndicator = changeIndicator
        self.changeDate = changeDate
        self.passChangeIndicator = passChangeIndicator
        self.passChangeDate = passChangeDate
        self.purchaseNumber = purchaseNumber
        self.provisionAttempts = provisionAttempts
        self.activityDay = activityDay
        self.activityYear = activityYear
        self.paymentAgeIndicator = paymentAgeIndicator
        self.paymentAge = paymentAge
        self.suspiciousActivity = suspiciousActivity
        self.authMethod = authMethod
        self.authTime = authTime
        self.authData = authData
    }

    public var additional: String?
    public var ageIndicator: String?
    public var date: String?
    public var changeIndicator: String?
    public var changeDate: String?
    public var passChangeIndicator: String?
    public var passChangeDate: String?
    public var purchaseNumber: Int?
    public var provisionAttempts: Int?
    public var activityDay: Int?
    public var activityYear: Int?
    public var paymentAgeIndicator: String?
    public var paymentAge: String?
    public var suspiciousActivity: String?
    public var authMethod: String?
    public var authTime: String?
    public var authData: String?

    @objc(setAdditional:)
    /// Additional customer account information, for instance arbitrary customer ID.
    /// - Parameter additional
    public func setAdditional(additional: String) {
        self.additional = additional
    }

    @objc(setAgeIndicator:)
    /// Number of days since the customer account was created.
    /// - Parameter ageIndicator: 01 (guest check-out), 02 (Created during this transaction), 03 (Less than 30 days), 04 (30−60 days), 05 (More than 60 days)
    public func setAgeIndicator(ageIndicator: String) {
        self.ageIndicator = ageIndicator
    }

    @objc(setDate:)
    /// Account creation date.
    /// - Parameter date: DD-MM-YYYY
    public func setDate(date: String) {
        self.date = date
    }

    @objc(setChangeIndicator:)
    /// Number of days since last customer account update, not including password change or reset.
    /// - Parameter changeIndicator: 01 (Changed during this transaction), 02 (Less than 30 days), 03 (30−60 days), 04 (More than 60 days)
    public func setChangeIndicator(changeIndicator: String) {
        self.changeIndicator = changeIndicator
    }

    @objc(setChangeDate:)
    /// Last account change date except for password change or password reset.
    /// - Parameter changeDate: DD-MM-YYYY
    public func setChangeDate(changeDate: String) {
        self.changeDate = changeDate
    }

    @objc(setPassChangeIndicator:)
    /// Number of days since the last password change or reset.
    /// - Parameter passChangeIndicator: 01 (No change), 02 (Changed during this transaction), 03 (Less than 30 days), 04 (30−60 days), 05 (More than 60 days)
    public func setPassChangeIndicator(passChangeIndicator: String) {
        self.passChangeIndicator = passChangeIndicator
    }

    @objc(setPassChangeDate:)
    /// Last password change or password reset date.
    /// - Parameter passChangeDate: DD-MM-YYYY
    public func setPassChangeDate(passChangeDate: String) {
        self.passChangeDate = passChangeDate
    }

    @objc(setPurchaseNumber:)
    /// Number of purchases with this cardholder account in the previous six months.
    /// - Parameter purchaseNumber
    public func setPurchaseNumber(purchaseNumber: Int) {
        self.purchaseNumber = purchaseNumber
    }

    @objc(setProvisionAttempts:)
    /// Number of attempts to add card details in customer account in the last 24 hours.
    /// - Parameter provisionAttempts
    public func setProvisionAttempts(provisionAttempts: Int) {
        self.provisionAttempts = provisionAttempts
    }

    @objc(setActivityDay:)
    /// Number of card payment attempts in the last 24 hours.
    /// - Parameter activityDay
    public func setActivityDay(activityDay: Int) {
        self.activityDay = activityDay
    }

    @objc(setActivityYear:)
    /// Number of card payment attempts in the last 365 days.
    /// - Parameter activityYear
    public func setActivityYear(activityYear: Int) {
        self.activityYear = activityYear
    }

    @objc(setPaymentAgeIndicator:)
    /// Number of days since the payment card details were saved in a customer account.
    /// - Parameter paymentAgeIndicator: 01 (No account (guest check-out)), 02 (During this transaction), 03 (Less than 30 days), 04 (30−60 days), 05 (More than 60 days)
    public func setPaymentAgeIndicator(paymentAgeIndicator: String) {
        self.paymentAgeIndicator = paymentAgeIndicator
    }

    @objc(setPaymentAge:)
    /// Card record creation date.
    /// - Parameter paymentAge: DD-MM-YYYY
    public func setPaymentAge(paymentAge: String) {
        self.paymentAge = paymentAge
    }

    @objc(setSuspiciousActivity:)
    /// Suspicious activity detection result.
    /// - Parameter suspiciousActivity: 01 (No suspicious activity has been observed), 02 (Suspicious activity has been observed)
    public func setSuspiciousActivity(suspiciousActivity: String) {
        self.suspiciousActivity = suspiciousActivity
    }

    @objc(setAuthMethod:)
    /// Authentication type the customer used to log on to the account when placing the order.
    /// - Parameter authMethod
    public func setAuthMethod(authMethod: String) {
        self.authMethod = authMethod
    }

    @objc(setAuthTime:)
    /// Account log on date and time.
    /// - Parameter authTime: DD-MM-YYYYHH:MM
    public func setAuthTime(authTime: String) {
        self.authTime = authTime
    }

    @objc(setAuthData:)
    /// Any additional log in information in free text.
    /// - Parameter authData
    public func setAuthData(authData: String) {
        self.authData = authData
    }
}

public class ThreeDSecureShippingInfo: NSObject {
    @objc public override init() {
        super.init()
    }

    public init(type: String? = nil, deliveryTime: String? = nil, deliveryEmail: String? = nil, addressUsageIndicator: String? = nil, addressUsage: String? = nil, city: String? = nil, country: String? = nil, address: String? = nil, postal: String? = nil, regionCode: String? = nil, nameIndicator: String? = nil) {
        self.type = type
        self.deliveryTime = deliveryTime
        self.deliveryEmail = deliveryEmail
        self.addressUsageIndicator = addressUsageIndicator
        self.addressUsage = addressUsage
        self.city = city
        self.country = country
        self.address = address
        self.postal = postal
        self.regionCode = regionCode
        self.nameIndicator = nameIndicator
    }

    public var type: String?
    public var deliveryTime: String?
    public var deliveryEmail: String?
    public var addressUsageIndicator: String?
    public var addressUsage: String?
    public var city: String?
    public var country: String?
    public var address: String?
    public var postal: String?
    public var regionCode: String?
    public var nameIndicator: String?

    @objc(setType:)
    /// Shipment indicator.
    /// - Parameter type
    public func setType(type: String) {
        self.type = type
    }

    @objc(setDeliveryTime:)
    /// Shipment terms.
    /// - Parameter deliveryTime: 01 (Electronic Delivery), 02 (Same day shipping), 03 (Overnight shipping), 04 (Two-day or more shipping)
    public func setDeliveryTime(deliveryTime: String) {
        self.deliveryTime = deliveryTime
    }

    @objc(setDeliveryEmail:)
    /// The email to ship purchased digital content, if the customer chooses email delivery.
    /// - Parameter deliveryEmail
    public func setDeliveryEmail(deliveryEmail: String) {
        self.deliveryEmail = deliveryEmail
    }

    @objc(setAddressUsageIndicator:)
    /// Number of days since the first time usage of the shipping address.
    /// - Parameter addressUsageIndicator: 01 (This transaction), 02 (Less than 30 days), 03 (30−60 days), 04 (More than 60 days)
    public func setAddressUsageIndicator(addressUsageIndicator: String) {
        self.addressUsageIndicator = addressUsageIndicator
    }

    @objc(setAddressUsage:)
    /// First shipping address usage date in the dd-mm-yyyy format.
    /// - Parameter addressUsage: DD-MM-YYYY
    public func setAddressUsage(addressUsage: String) {
        self.addressUsage = addressUsage
    }

    @objc(setCity:)
    /// Shipping city.
    /// - Parameter city
    public func setCity(city: String) {
        self.city = city
    }

    @objc(setCountry:)
    /// Shipping country in the ISO 3166-1 alpha-2 format
    /// - Parameter country
    public func setCountry(country: String) {
        self.country = country
    }

    @objc(setAddress:)
    /// Shipping address.
    /// - Parameter address
    public func setAddress(address: String) {
        self.address = address
    }

    @objc(setPostal:)
    /// Shipping postbox number.
    /// - Parameter postal
    public func setPostal(postal: String) {
        self.postal = postal
    }

    @objc(setRegionCode:)
    /// State, province, or region code in the ISO 3166-2 format.
    /// - Parameter regionCode
    public func setRegionCode(regionCode: String) {
        self.regionCode = regionCode
    }

    @objc(setNameIndicator:)
    /// Shipment recipient flag.
    /// - Parameter nameIndicator: 01 (Account Name identical to shipping Name), 02 (Account Name different than shipping Name)
    public func setNameIndicator(nameIndicator: String) {
        self.nameIndicator = nameIndicator
    }
}

public class ThreeDSecureMpiResultInfo: NSObject {
    @objc public override init() {
        super.init()
    }
    
    public init(acsOperationId: String? = nil, authenticationFlow: String? = nil, authenticationTimestamp: String? = nil) {
        self.acsOperationId = acsOperationId
        self.authenticationFlow = authenticationFlow
        self.authenticationTimestamp = authenticationTimestamp
    }

    public var acsOperationId: String?
    public var authenticationFlow: String?
    public var authenticationTimestamp: String?

    @objc(setAcsOperationId:)
    /// The ID the issuer assigned to the previous customer operation and returned in the acs_operation_id parameter inside the callback with payment processing result.
    /// - Parameter acsOperationId
    public func setAcsOperationId(acsOperationId: String) {
        self.acsOperationId = acsOperationId
    }

    @objc(setAuthenticationFlow:)
    /// The flow the issuer used to authenticate the cardholder in the previous operation and returned in the authentication_flow parameter of the callback with payment processing results.
    /// - Parameter authenticationFlow: 01 (Frictionless authentication occurred by ACS), 02 (Cardholder challenge occurred by ACS)
    public func setAuthenticationFlow(authenticationFlow: String) {
        self.authenticationFlow = authenticationFlow
    }

    @objc(setAuthenticationTimestamp:)
    /// Date and time of the previous successful customer authentication as returned in the mpi_timestamp parameter inside the callback message with payment processing result.
    /// - Parameter authenticationTimestamp
    public func setAuthenticationTimestamp(authenticationTimestamp: String) {
        self.authenticationTimestamp = authenticationTimestamp
    }
}

internal extension ThreeDSecureInfo {
    var coreType: MsdkCore.ThreeDSecureInfo {
        return MsdkCore.ThreeDSecureInfo(
            threeDSecureCustomerInfo: self.threeDSecureCustomerInfo.map({ threeDSecureCustomerInfo in
                MsdkCore.ThreeDSecureCustomerInfo(
                    addressMatch: threeDSecureCustomerInfo.addressMatch,
                    homePhone: threeDSecureCustomerInfo.homePhone,
                    workPhone: threeDSecureCustomerInfo.workPhone,
                    billingRegionCode: threeDSecureCustomerInfo.billingRegionCode,
                    accountInfo: threeDSecureCustomerInfo.accountInfo.map({ threeDSecureAccountInfo in
                        MsdkCore.ThreeDSecureAccountInfo(
                            additional: threeDSecureAccountInfo.additional,
                            ageIndicator: threeDSecureAccountInfo.ageIndicator,
                            date: threeDSecureAccountInfo.date,
                            changeIndicator: threeDSecureAccountInfo.changeIndicator,
                            changeDate: threeDSecureAccountInfo.changeDate,
                            passChangeIndicator: threeDSecureAccountInfo.passChangeIndicator,
                            passChangeDate: threeDSecureAccountInfo.passChangeDate,
                            purchaseNumber: threeDSecureAccountInfo.purchaseNumber.map(KotlinInt.init),
                            provisionAttempts: threeDSecureAccountInfo.provisionAttempts.map(KotlinInt.init),
                            activityDay: threeDSecureAccountInfo.activityDay.map(KotlinInt.init),
                            activityYear: threeDSecureAccountInfo.activityYear.map(KotlinInt.init),
                            paymentAgeIndicator: threeDSecureAccountInfo.paymentAgeIndicator,
                            paymentAge: threeDSecureAccountInfo.paymentAge,
                            suspiciousActivity: threeDSecureAccountInfo.suspiciousActivity,
                            authMethod: threeDSecureAccountInfo.authMethod,
                            authTime: threeDSecureAccountInfo.authTime,
                            authData: threeDSecureAccountInfo.authData)
                    }),
                    shippingInfo: threeDSecureCustomerInfo.shippingInfo.map({ treeDSecureShippingInfo in
                        MsdkCore.ThreeDSecureShippingInfo(
                            type: treeDSecureShippingInfo.type,
                            deliveryTime: treeDSecureShippingInfo.deliveryTime,
                            deliveryEmail: treeDSecureShippingInfo.deliveryEmail,
                            addressUsageIndicator: treeDSecureShippingInfo.addressUsageIndicator,
                            addressUsage: treeDSecureShippingInfo.addressUsage,
                            city: treeDSecureShippingInfo.city,
                            country: treeDSecureShippingInfo.country,
                            address: treeDSecureShippingInfo.address,
                            postal: treeDSecureShippingInfo.postal,
                            regionCode: treeDSecureShippingInfo.regionCode,
                            nameIndicator: treeDSecureShippingInfo.nameIndicator)
                    }),
                    mpiResultInfo: threeDSecureCustomerInfo.mpiResultInfo.map({ threeDSecureMpiResultInfo in
                        MsdkCore.ThreeDSecureMpiResultInfo(
                            acsOperationId: threeDSecureMpiResultInfo.acsOperationId,
                            authenticationFlow: threeDSecureMpiResultInfo.authenticationFlow,
                            authenticationTimestamp: threeDSecureMpiResultInfo.authenticationTimestamp)
                    })
                )
            }),
            threeDSecurePaymentInfo: self.threeDSecurePaymentInfo.map({ threeDSecurePaymentInfo in
                MsdkCore.ThreeDSecurePaymentInfo(
                    reorder: threeDSecurePaymentInfo.reorder,
                    preorderPurchase: threeDSecurePaymentInfo.preorderPurchase,
                    preorderDate: threeDSecurePaymentInfo.preorderDate,
                    challengeIndicator: threeDSecurePaymentInfo.challengeIndicator,
                    challengeWindow: threeDSecurePaymentInfo.challengeWindow,
                    giftCard: threeDSecurePaymentInfo.giftCard.map({ threeDSecureGiftCardInfo in
                        MsdkCore.ThreeDSecureGiftCardInfo(
                            amount: threeDSecureGiftCardInfo.amount.map(KotlinInt.init),
                            currency: threeDSecureGiftCardInfo.currency,
                            count: threeDSecureGiftCardInfo.count.map(KotlinInt.init)
                        )
                    })
                )
            }))
    }
}
