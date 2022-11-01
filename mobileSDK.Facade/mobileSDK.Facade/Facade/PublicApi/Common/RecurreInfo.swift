//
//  RecurreInfo.swift
//  mobileSDK.Facade
//
//  Created by Ivan Krapivtsev on 28.10.2022.
//

import Foundation
@_implementationOnly import MsdkCore

/**
 * Object with the details of COF payment
 */
public class RecurrentInfo: NSObject {
    internal var coreRecurrentInfo: MsdkCore.RecurrentInfo

    @objc public init(register: Bool,
                type: String?,
                expiryDay: String?,
                expiryMonth: String?,
                expiryYear: String?,
                period: String?,
                time: String?,
                startDate: String?,
                scheduledPaymentID: String?,
                amount: NSNumber?,
                schedule: [RecurrentInfoSchedule]?) {
        coreRecurrentInfo = MsdkCore.RecurrentInfo.init(
            register: register,
            type: type,
            expiryDay: expiryDay,
            expiryMonth: expiryMonth,
            expiryYear: expiryYear,
            period: period,
            time: time,
            startDate: startDate,
            scheduledPaymentID: scheduledPaymentID,
            amount: amount.map({ number in
                KotlinLong(value: number.int64Value)
            }),
            schedule: schedule.map({ scheduleList in
                scheduleList.map { scheduleItem in
                    MsdkCore.RecurrentInfoSchedule(facadeSchedule: scheduleItem)
                }
            })
        )
    }

    /**
     * Amount of COF purchase. By default the amount of COF purchase is equal to payment amount
     */
    open var amount: NSNumber? {
        coreRecurrentInfo.amount.map { kotlinLong in
            NSNumber(value: kotlinLong.int64Value)
        }
    }

    /**
     *  Day of recurrent expiration, must be string(2) day in DD format
     */
    open var expiryDay: String? { coreRecurrentInfo.expiryDay }

    /**
     * Month of recurrent expiration, must be string(2) month in MM format
     */
    open var expiryMonth: String? { coreRecurrentInfo.expiryMonth }

    /**
     *  Year of recurrent expiration, must be string(4) month in YYYY format
     */
    open var expiryYear: String? { coreRecurrentInfo.expiryYear }

    /**
     *  Period of payment - Day/Week/Month/Quarter/Year
     */
    open var period: String? { coreRecurrentInfo.period }

    open var register: Bool { coreRecurrentInfo.register_ }

    /**
     * Data and amount of COF purchase. By default the debit of funds is strictly fixed in time and amount
     */
    open var schedule: [RecurrentInfoSchedule]? {
        coreRecurrentInfo.schedule.map { scheduleArray in
            scheduleArray.map { scheduleItem in
                RecurrentInfoSchedule(coreSchedule: scheduleItem)
            }
        }
    }

    /**
     * Payment ID, must be unique within your project
     */
    open var scheduledPaymentID: String? { coreRecurrentInfo.scheduledPaymentID }

    /**
     * Date to start recurrent payment, must be string(10) in DD-MM-YYYY format
     */
    open var startDate: String? { coreRecurrentInfo.startDate }

    /**
     * Time of recurrent payment to charge
     */
    open var time: String? { coreRecurrentInfo.time }

    /**
     * Type of recurrent - R/C/U/I
     */
    open var type: String? { coreRecurrentInfo.type }
}

@objcMembers public class RecurrentInfoSchedule: NSObject {
    public init(amount: NSNumber? = nil, date: String? = nil) {
        self.amount = amount
        self.date = date
    }

    /**
     * Amount to charge, 1000 = 10.00
     */
    open var amount: NSNumber?

    /**
     *  Date of charge in format DD-MM-YYYY
     */
    open var date: String?
}

internal extension RecurrentInfoSchedule {
    convenience init(coreSchedule: MsdkCore.RecurrentInfoSchedule) {
        self.init(amount: coreSchedule.amount.map({ NSNumber(value: $0.int64Value)}),
                  date: coreSchedule.date)
    }
}

internal extension MsdkCore.RecurrentInfoSchedule {
    convenience init(facadeSchedule: RecurrentInfoSchedule) {
        self.init(date: facadeSchedule.date,
                  amount: facadeSchedule.amount.map({ amountNumber in
            KotlinLong(value: amountNumber.int64Value)
        }))
    }
}
