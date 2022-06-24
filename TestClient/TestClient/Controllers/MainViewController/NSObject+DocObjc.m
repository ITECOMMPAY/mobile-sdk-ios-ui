//
//  NSObject+DocObjc.m
//  TestClient
//
//  Created by Виталий Морозов on 08.05.2020.
//  Copyright © 2020 Ecommpay. All rights reserved.
//

#import "NSObject+DocObjc.h"
#import "SDKImportHeader.h"

@implementation NSObject (DocObjc)
    
- (void)doc {
    ThreeDSecureInfo *threeDSecureInfo = [[ThreeDSecureInfo alloc] init];

    ThreeDSecurePaymentInfo *threeDSecurePaymentInfo = [[ThreeDSecurePaymentInfo alloc] init];
    ThreeDSecureCustomerInfo *threeDSecureCustomerInfo = [[ThreeDSecureCustomerInfo alloc] init];

    ThreeDSecureGiftCardInfo *gifCard = [[ThreeDSecureGiftCardInfo alloc] init];
    gifCard.amount = 12345;
    gifCard.currency = @"USD";
    gifCard.count = 1;
    
    threeDSecurePaymentInfo.challengeIndicator = @"01";
    threeDSecurePaymentInfo.challengeWindow = @"01";
    threeDSecurePaymentInfo.preorderDate = @"01-10-2020";
    threeDSecurePaymentInfo.preorderPurchase = @"01";
    threeDSecurePaymentInfo.reorder = @"01";
    threeDSecurePaymentInfo.giftCard = gifCard;
    
    ThreeDSecureAccountInfo *threeDSecureAccountInfo = [[ThreeDSecureAccountInfo alloc] init];
    
    threeDSecureAccountInfo.additional = @"gamer12345";
    threeDSecureAccountInfo.ageIndicator = @"01";
    threeDSecureAccountInfo.date = @"01-01-2020";
    threeDSecureAccountInfo.changeIndicator = @"01";
    threeDSecureAccountInfo.changeDate = @"01-10-2019";
    threeDSecureAccountInfo.passChangeIndicator = @"01";
    threeDSecureAccountInfo.passChangeDate = @"01-10-2020";
    threeDSecureAccountInfo.purchaseNumber = 12;
    threeDSecureAccountInfo.provisionAttempts = 16;
    threeDSecureAccountInfo.provisionAttempts = 22;
    threeDSecureAccountInfo.provisionAttempts = 222;
    threeDSecureAccountInfo.paymentAgeIndicator = @"01";
    threeDSecureAccountInfo.paymentAge = @"01-10-2019";
    threeDSecureAccountInfo.suspiciousActivity = @"01";
    threeDSecureAccountInfo.authMethod = @"01";
    threeDSecureAccountInfo.authTime = @"01-10-201913:12";
    threeDSecureAccountInfo.authData = @"login_0102";
    
    ThreeDSecureShippingInfo *threeDSecureShippingInfo = [[ThreeDSecureShippingInfo alloc] init];
    
    threeDSecureShippingInfo.type = @"01";
    threeDSecureShippingInfo.deliveryTime = @"01";
    threeDSecureShippingInfo.deliveryEmail = @"test@gmail.com";
    threeDSecureShippingInfo.addressUsageIndicator = @"01";
    threeDSecureShippingInfo.addressUsage = @"01-10-2019";
    threeDSecureShippingInfo.city = @"Moscow";
    threeDSecureShippingInfo.country = @"RU";
    threeDSecureShippingInfo.address = @"Lenina street 12";
    threeDSecureShippingInfo.postal = @"109111";
    threeDSecureShippingInfo.regionCode = @"MOW";
    threeDSecureShippingInfo.nameIndicator = @"01";
    
    ThreeDSecureMpiResultInfo *threeDSecureMpiResultInfo = [[ThreeDSecureMpiResultInfo alloc] init];
    
    threeDSecureMpiResultInfo.acsOperationId = @"00000000-0005-5a5a-8000-016d3ea31d54";
    threeDSecureMpiResultInfo.authenticationFlow = @"01";
    threeDSecureMpiResultInfo.authenticationTimestamp = @"201812141050";
    
    threeDSecureCustomerInfo.addressMatch = @"Y";
    threeDSecureCustomerInfo.homePhone = @"79105211111";
    threeDSecureCustomerInfo.workPhone = @"73105219876";
    threeDSecureCustomerInfo.billingRegionCode = @"ABC";
    
    threeDSecureCustomerInfo.accountInfo = threeDSecureAccountInfo;
    threeDSecureCustomerInfo.shippingInfo = threeDSecureShippingInfo;
    threeDSecureCustomerInfo.mpiResultInfo = threeDSecureMpiResultInfo;
    
    threeDSecureInfo.threeDSecurePaymentInfo = threeDSecurePaymentInfo;
    threeDSecureInfo.threeDSecureCustomerInfo = threeDSecureCustomerInfo;
}

@end
