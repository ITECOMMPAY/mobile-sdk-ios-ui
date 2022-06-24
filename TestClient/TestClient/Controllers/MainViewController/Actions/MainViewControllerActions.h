//
//  MainViewControllerActions.h
//  TestClient
//
//  Created by Ecommpay on 27/11/2018.
//  Copyright © 2018 Ecommpay. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PaymentInfo;
@class RecurrentInfo;
@class DataValue;
@class UIViewController;

@interface MainViewControllerActions : NSObject

+ (PaymentInfo *)composePaymentInfoFromItems:(NSArray *)items;
+ (PaymentInfo *)composeOnlyRequiredPaymentInfoFromItems:(NSArray *)items;
+ (RecurrentInfo *)composeRecurrentInfoFromItems:(NSArray *)items;

+ (DataValue *)getDataValueWith: (NSString *)key fromItems:(NSArray *)items;
+ (void)presentAlertWithTitle:(NSString *)title andMessage:(NSString *)message fromController:(UIViewController *)controller;
+ (void)presentAlertWith:(NSString *)message fromController:(UIViewController *)controller;
+ (enum ForcePaymentMethodType) getForcePaymentMethodType: (NSString *)string;

@end

