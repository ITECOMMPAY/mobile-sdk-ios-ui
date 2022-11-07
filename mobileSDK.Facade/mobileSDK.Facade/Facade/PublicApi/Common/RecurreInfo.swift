//
//  RecurrentInfo.swift
//  mobilesdk-ios
//
//  Created by Deniss Kaibagarovs on 09/01/2019.
//  Copyright © 2019 Ecommpay. All rights reserved.
//

import Foundation
#if !DEVELOPMENT
@_implementationOnly import MsdkCore
#else
import MsdkCore
#endif

public class RecurrentInfoSchedule: NSObject {
    @objc public let date: String
    @objc public let amount: Int

    @objc public init(date: String, amount: Int) {
        self.date = date
        self.amount = amount
    }

    func toDict() -> [String: Any] {
        return [
            "date": date,
            "amount": amount
        ]
    }
}

public class RecurrentInfo: NSObject, Codable {

    /// Init Recurrent Info with all params
    ///
    /// - Parameters:
    ///   - type: Type of recurrent - R/C/U/I
    ///   - expiryDay: Day of recurrent expiration, must be string(2) month in DD format
    ///   - expiryMonth: Month of recurrent expiration, must be string(2) month in MM format
    ///   - expiryYear: Year of recurrent expiration, must be string(4) month in YYYY format.
    ///   - period: Period of payment - Day/Week/Month/Quarter/Year
    ///   - time: Time of recurrent payment to charge
    ///   - startDate: Date to start recurrent payment, must be string(10) in DD-MM-YYYY format
    ///   - scheduledPaymentID: Recurring payment ID
    public init(type: RecurrentType, expiryDay: String?, expiryMonth: String?, expiryYear: String?, period: RecurrentPeriod?, time: String?, startDate: String?, scheduledPaymentID: String?, amount: Int? = nil, schedule: [RecurrentInfoSchedule]? = nil) {
        self.type = type
        self.expiryDay = expiryDay
        self.expiryMonth = expiryMonth
        self.expiryYear = expiryYear
        self.period = period
        self.time = time
        self.startDate = startDate
        self.scheduledPaymentID = scheduledPaymentID
        self.amount = amount
        self.schedule = schedule
    }

    /// indicate if needed to be registered for recurrent
    private let register: Bool = true
    /// Type of recurrent - R/C/U/I
    public let type: RecurrentType
    /// Day of recurrent expiration, must be string(2) dat in DD format
    public let expiryDay: String?
    /// Month of recurrent expiration, must be string(2) month in MM format
    public let expiryMonth: String?
    /// Year of recurrent expiration, must be string(4) month in YYYY format.
    public let expiryYear: String?
    /// Period of payment - Day/Week/Month/Quarter/Year
    public let period: RecurrentPeriod?
    /// Time of recurrent payment to charge
    public let time: String?
    /// Date to start recurrent payment, must be string(10) in DD-MM-YYYY format
    public let startDate: String?
    /// Recurring payment ID
    public let scheduledPaymentID: String?
    /// Amount measured in minors, if not set -> payment amount is taken
    public var amount: Int?
    /// Custom intervals and amount to charge, if not set -> would change until expiryYear and expiryMonth
    public var schedule: [RecurrentInfoSchedule]?

    /// Init Recurrent Info with all params
    ///
    /// - Parameters:
    ///   - type: Type of recurrent - R/C/U/I
    ///   - expiryDay: Day of recurrent expiration, must be string(2) month in DD format
    ///   - expiryMonth: Month of recurrent expiration, must be string(2) month in MM format
    ///   - expiryYear: Year of recurrent expiration, must be string(4) month in YYYY format.
    ///   - period: Period of payment - Day/Week/Month/Quarter/Year
    ///   - time: Time of recurrent payment to charge
    ///   - startDate: Date to start recurrent payment, must be string(10) in DD-MM-YYYY format
    ///   - scheduledPaymentID: Recurring payment ID
    @objc(initWithRecurrentType:expiryDay:expiryMonth:expiryYear:period:time:startDate:scheduledPaymentID:)
    public init(type: RecurrentType,
                expiryDay: String,
                expiryMonth: String,
                expiryYear: String,
                period: RecurrentPeriod,
                time: String,
                startDate: String,
                scheduledPaymentID: String) {
        self.type = type
        self.expiryDay = expiryDay
        self.expiryMonth = expiryMonth
        self.expiryYear = expiryYear
        self.period = period
        self.scheduledPaymentID = scheduledPaymentID

        let date = Date()
        let formatter = DateFormatter()

        if time == "" {
            formatter.dateFormat = "HH:mm:ss"
            self.time = formatter.string(from: date)
        } else {
            self.time = time
        }

        if startDate == "" {
            formatter.dateFormat = "dd-MM-yyyy"
            self.startDate = formatter.string(from: date)
        } else {
            self.startDate = startDate
        }

        super.init()
    }

    @objc(initWithRecurrentType:)
    public init(type: RecurrentType) {
        self.type = type
        expiryDay = nil
        expiryMonth = nil
        expiryYear = nil
        period = nil
        scheduledPaymentID = nil
        time = nil
        startDate = nil

        super.init()
    }

    @objc(setAmount:)
    /// Custom amount to charge (by default paymentInfo.amount is charged)
    /// - Parameter amount: Amount to charge for recurrent
    public func setAmount(amount: Int) {
        self.amount = amount
    }

    @objc(setSchedule:)
    /// Set custom schedule with custom amount to charge over time
    /// - Parameter schedule: Custom schedule for recurrent payments
    public func setSchedule(schedule: [RecurrentInfoSchedule]) {
        self.schedule = schedule
    }

    /// Represent Object in Dictionary  [String : Any]
    ///
    /// - Returns: Dictionary representation
    @objc(dictionaryRepresentation)
    public func dictionaryRepresentation() -> [String: Any]? {
        do {
            let data = try JSONEncoder().encode(self)
            let dict = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            return dict
        } catch {
        }
        return nil
    }

    private enum CodingKeys: String, CodingKey {
        case register = "register"
        case type = "type"
        case expiryDay = "expiry_day"
        case expiryMonth = "expiry_month"
        case expiryYear = "expiry_year"
        case period = "period"
        case time = "time"
        case startDate = "start_date"
        case scheduledPaymentID = "scheduled_payment_id"
        case amount = "amount"
    }

    var json: [String: Any] {
        get {
            var dict = [
                "register": register,
                "type": type.rawValue
            ] as [String: Any]

            if let expiryDay = expiryDay {
                dict["expiry_day"] = expiryDay
            }

            if let expiryMonth = expiryMonth {
                dict["expiry_month"] = expiryMonth
            }

            if let expiryYear = expiryYear {
                dict["expiry_year"] = expiryYear
            }

            if let period = period {
                dict["period"] = period.rawValue
            }

            if let time = time {
                dict["time"] = time
            }

            if let startDate = startDate {
                dict["start_date"] = startDate
            }

            if let scheduledPaymentID = scheduledPaymentID {
                dict["scheduled_payment_id"] = scheduledPaymentID
            }

            if let amount = amount, amount > 0 {
                dict["amount"] = amount
            }

            if let schedule = schedule, schedule.count > 0 {
                var array = [[String: Any]]()
                for sc in schedule {
                    array.append(sc.toDict())
                }
                dict["schedule"] = array
            }

            return dict
        }
        set {
        }
    }
}

// Objc does not allow String enums
// TODO: PP-4049 2
@objc public enum RecurrentType: Int, RawRepresentable, Codable {
    case Regular
    case OneClick
    case Autopayment

    public typealias RawValue = String

    public var rawValue: RawValue {
        switch self {
        case .Regular:
            return "R"
        case .OneClick:
            return "C"
        case .Autopayment:
            return "U"
        }
    }

    public init?(rawValue: RawValue) {
        switch rawValue {
        case "R":
            self = .Regular
        case "C":
            self = .OneClick
        case "U":
            self = .Autopayment
        default:
            self = .Regular
        }
    }
}

// Objc does not allow String enums
@objc public enum RecurrentPeriod: Int, RawRepresentable, Codable {
    case Day
    case Week
    case Month
    case Quarter
    case Year

    public typealias RawValue = String?

    public var rawValue: RawValue {
        switch self {
        case .Day:
            return "D"
        case .Week:
            return "W"
        case .Month:
            return "M"
        case .Quarter:
            return "Q"
        case .Year:
            return "Y"
        }
    }

    public init?(rawValue: RawValue) {
        switch rawValue {
        case "D":
            self = .Day
        case "W":
            self = .Week
        case "M":
            self = .Month
        case "Q":
            self = .Quarter
        case "Y":
            self = .Year
        default:
            return nil
        }
    }
}

internal extension RecurrentInfo {
    var coreRecurrentInfo: MsdkCore.RecurrentInfo {
        MsdkCore.RecurrentInfo(
            register: register,
            type: type.rawValue,
            expiryDay: expiryDay,
            expiryMonth: expiryMonth,
            expiryYear: expiryYear,
            period: period?.rawValue,
            time: time,
            startDate: startDate,
            scheduledPaymentID: scheduledPaymentID,
            amount: amount.map(KotlinLong.init),
            schedule: schedule?.map({ scheduleItem in
                MsdkCore.RecurrentInfoSchedule(
                    date: scheduleItem.date,
                    amount: KotlinLong(integerLiteral: scheduleItem.amount)
                )
            })
        )
    }
}
