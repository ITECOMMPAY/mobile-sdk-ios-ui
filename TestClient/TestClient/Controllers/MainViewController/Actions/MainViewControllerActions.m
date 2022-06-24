//
//  MainViewControllerActions.m
//  TestClient
//
//  Created by Ecommpay on 27/11/2018.
//  Copyright © 2018 Ecommpay. All rights reserved.
//

#import "MainViewControllerActions.h"
#import "SDKImportHeader.h"
#import "DataValue.h"

@import UIKit;

@implementation MainViewControllerActions

+ (PaymentInfo *)composePaymentInfoFromItems:(NSArray *)items {
    return [[PaymentInfo alloc] initWithProjectID:[[self getDataValueWith:PROJECT_ID_KEY fromItems:items].value integerValue]
                                        paymentID:[self getDataValueWith:PAYMENT_ID_KEY fromItems:items].value
                                    paymentAmount:[[self getDataValueWith:PAYMENT_AMOUNT_KEY fromItems:items].value integerValue]
                                  paymentCurrency:[self getDataValueWith:PAYMENT_CURRENCY_KEY fromItems:items].value
                               paymentDescription:[self getDataValueWith:PAYMENT_DESCRIPTION_KEY fromItems:items].value
                                       customerID:[self getDataValueWith:CUSTOMER_ID_KEY fromItems:items].value
                                       regionCode:[self getDataValueWith:REGION_CODE_KEY fromItems:items].value];

}

+ (PaymentInfo *)composeOnlyRequiredPaymentInfoFromItems:(NSArray *)items {
    return [[PaymentInfo alloc] initWithProjectID:[[self getDataValueWith:PROJECT_ID_KEY fromItems:items].value integerValue]
                                        paymentID:[self getDataValueWith:PAYMENT_ID_KEY fromItems:items].value
                                    paymentAmount:[[self getDataValueWith:PAYMENT_AMOUNT_KEY fromItems:items].value integerValue]
                                  paymentCurrency:[self getDataValueWith:PAYMENT_CURRENCY_KEY fromItems:items].value];

}

+ (RecurrentInfo *)composeRecurrentInfoFromItems:(NSArray *)items {

    NSString *day = [self getDataValueWith:EXPIR_DAY_KEY fromItems:items].value;
    NSString *month = [self getDataValueWith:EXPIR_MONTH_KEY fromItems:items].value;
    NSString *year = [self getDataValueWith:EXPIR_YEAR_KEY fromItems:items].value;
    NSString *period = [self getDataValueWith:RECURRENT_PERIOD_KEY fromItems:items].value;
    NSString *time = [self getDataValueWith:RECURRENT_TIME_KEY fromItems:items].value;
    NSString *startDate = [self getDataValueWith:RECURRENT_START_DATE fromItems:items].value;
    NSString *scheduledPaymentID = [self getDataValueWith:RECURRENT_SCHEDULED_PAYMENT_ID_KEY fromItems:items].value;

    if (![day isEqual:@""] ||
            ![month isEqual:@""] ||
            ![year isEqual:@""] ||
            ![period isEqual:@""] ||
            ![time isEqual:@""] ||
            ![startDate isEqual:@""] ||
            ![scheduledPaymentID isEqual:@""]) {

        RecurrentInfo *recurrentInfo = [[RecurrentInfo alloc]
                initWithRecurrentType:[self getRecurrentTypeFromString:[self getDataValueWith:RECURRENT_TYPE_KEY fromItems:items].value]
                            expiryDay:day
                          expiryMonth:month
                           expiryYear:year
                               period:[self getRecurrentPeriodFromString:period]
                                 time:time
                            startDate:startDate
                   scheduledPaymentID:scheduledPaymentID];
        NSInteger amount = [[self getDataValueWith:RECURRENT_AMOUNT_KEY fromItems:items].value integerValue];

        if (amount > 0) {
            [recurrentInfo setAmount:amount];
        }
        return recurrentInfo;
    }

    return [[RecurrentInfo alloc]
            initWithRecurrentType:[self getRecurrentTypeFromString:[self getDataValueWith:RECURRENT_TYPE_KEY fromItems:items].value]];
}

+ (DataValue *)getDataValueWith:(NSString *)key fromItems:(NSArray *)items {
    for (DataValue *dataValue in items) {
        if ([dataValue.key isEqualToString:key]) {
            return dataValue;
        }
    }
    return nil;
}

+ (RecurrentType)getRecurrentTypeFromString:(NSString *)string {
    if ([string isEqualToString:@"R"]) {
        return RecurrentTypeRegular;
    } else if ([string isEqualToString:@"C"]) {
        return RecurrentTypeOneClick;
    } else if ([string isEqualToString:@"U"]) {
        return RecurrentTypeAutopayment;
    }

    // Default
    return RecurrentTypeRegular;
}

+ (RecurrentPeriod)getRecurrentPeriodFromString:(NSString *)string {
    if ([string isEqualToString:@"D"]) {
        return RecurrentPeriodDay;
    } else if ([string isEqualToString:@"W"]) {
        return RecurrentPeriodWeek;
    } else if ([string isEqualToString:@"M"]) {
        return RecurrentPeriodMonth;
    } else if ([string isEqualToString:@"Q"]) {
        return RecurrentPeriodQuarter;
    } else if ([string isEqualToString:@"Y"]) {
        return RecurrentPeriodYear;
    }

    // Default
    return RecurrentPeriodMonth;
}

+ (void)presentAlertWith:(NSString *)message fromController:(UIViewController *)controller {
    [self presentAlertWithTitle:@"" andMessage:message fromController:controller];
}

+ (void)presentAlertWithTitle:(NSString *)title andMessage:(NSString *)message fromController:(UIViewController *)controller {
    UIAlertController *alert = [UIAlertController
            alertControllerWithTitle:title
                             message:message
                      preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action) {
                                                          }];

    [alert addAction:defaultAction];
    [controller presentViewController:alert animated:YES completion:nil];
}

@end
