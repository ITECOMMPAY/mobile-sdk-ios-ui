//
//  ViewController.m
//  IntegrationExampleObjc
//
//  Created by Deniss Kaibagarovs on 07/02/2019.
//  Copyright © 2019 Ecommpay. All rights reserved.
//

#import "ViewController.h"
#import "IntegrationExampleObjc-Swift.h"

#import <EcommpaySDK/EcommpaySDK.h>

#define SECRET @"your_secret"
#define PROJECT_ID 10 // your project id

@interface ViewController ()
@property (nonatomic, strong) EcommpaySDK *ecommpaySDK;
@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // Init SDK
    self.ecommpaySDK = [[EcommpaySDK alloc] init];
    
    // Create payment info with product information
    PaymentOptions *paymentOptions = [self getPaymentOptionsAllParams];
    
    // Set action type if needed
    [paymentOptions setAction: ActionTypeSale];
    
    #warning("Signature should be generated on your server and delivered to your app")
    NSString *signature = [self getSignature:paymentOptions.paramsForSignature];

    // Sign payment info
    [paymentOptions setSignature:signature];

    //enable test environment
    paymentOptions.mockModeType = MockModeTypeSuccess; // built in mocks will be used instead of making real server requests to server
    
    [self.ecommpaySDK presentPaymentAt:self paymentOptions:paymentOptions completionHandler:^(PaymentResult *result) {
        NSLog(@"ecommpaySDK finished with status %ld", (long)result.status);
        switch (result.status) {
            case PaymentStatusSuccess:
            case PaymentStatusDecline:
                NSLog(@"payment id: %@", result.payment.id);
                NSLog(@"payment date: %@", result.payment.date);
                NSLog(@"payment sum: %lld", result.payment.sum);
                NSLog(@"payment currency: %@", result.payment.currency);
                break;
            case PaymentStatusCancelled:
                NSLog(@"payment is cancelled by user");
                break;
            case PaymentStatusError:
                if (result.error != NULL) {
                    [ViewController handleError: result.error];
                }
                break;
        }
    }];
}

#pragma mark - Payment Info

- (PaymentOptions *)getPaymentOptionsOnlyRequiredParams {
    return [[PaymentOptions alloc] initWithProjectID:PROJECT_ID // project ID that is assigned to you
                                        paymentID:@"internal_payment_id_1" // payment ID to identify payment in your system
                                    paymentAmount:1999 // 19.99
                                  paymentCurrency:@"USD"];
}

- (PaymentOptions *)getPaymentOptionsAllParams {
    return [[PaymentOptions alloc] initWithProjectID:PROJECT_ID // project ID that is assigned to you
                                        paymentID:@"internal_payment_id_1" // payment ID to identify payment in your system
                                    paymentAmount:1999 // 19.99
                                  paymentCurrency:@"USD"
                               paymentDescription:@"T-shirt with dog print"
                                       customerID:@"10" // unique ID assigned to your customer
                                       regionCode:@""
                                            token:nil]; // saved card token for tokenized actions
}

#pragma mark - Signature

- (NSString *)getSignature:(NSString *)stringToSign {
    return [Utils signature:stringToSign secret:SECRET];
}

#pragma mark - Additionals

- (void)setReceiptData:(PaymentOptions *)paymentOptions {
    [paymentOptions setReceiptData:@"receipt data"];
}

// if you want to hide the saved cards, pass the value - YES
- (void)setHideSavedWallets:(PaymentOptions *)paymentOptions {
    [paymentOptions setHideSavedWallets:NO];
}

// For forced opening of the payment method, pass its code. Example: card, apple_pay_core
- (void)setForcePaymentMethod:(PaymentOptions *)paymentOptions {
    [paymentOptions setForcePaymentMethod:@"card"];
}

- (void)setApplePaySettings:(PaymentOptions *)paymentOptions {
    PaymentOptionsForApplePay *applePayOptions = [[PaymentOptionsForApplePay alloc]
                                                  initWithApplePayMerchantID:@"merchant.example.com"
                                                  applePayDescription:@"Shop"
                                                  countryCode:@"US"];
}

- (void)setRecurrent:(PaymentOptions *)paymentOptions {
    RecurrentInfo *recurrentInfo = [[RecurrentInfo alloc] initWithRecurrentType:RecurrentTypeAutopayment
                                                                      expiryDay:@"20"
                                                                    expiryMonth:@"11"
                                                                     expiryYear:@"2030"
                                                                         period:RecurrentPeriodMonth
                                                                           time:@"12:00:00"
                                                                      startDate:@"12-02-2020"
                                                             scheduledPaymentID:@"your_recurrent_id"];
    /*Additional options if needed
    [recurrentInfo setAmount:1000];
    [recurrentInfo setSchedule:@[[[RecurrentInfoSchedule alloc] initWithDate:@"10-10-2020" amount:1200],
                                 [[RecurrentInfoSchedule alloc] initWithDate:@"10-11-2020" amount:1000]]];
    */
    [paymentOptions setRecurrentInfo:recurrentInfo];
}

- (void)setKnownAdditionalFields:(PaymentOptions *)paymentOptions {
    [paymentOptions setAdditionalFields:@[[[AdditionalField alloc] initWithType:customer_first_name value:@"Mark"],
                                       [[AdditionalField alloc] initWithType:billing_country value:@"US"]]];
}

#pragma mark - Theme

- (void)setBrandColor:(PaymentOptions *)paymentOptions {
    [paymentOptions setBrandColor: UIColor.greenColor];
}

- (void)setLogoImage:(PaymentOptions *)paymentOptions {
    paymentOptions.logoImage = [UIImage imageNamed:@"ExampleLogo"];
}


#pragma mark - 3D Secure parameters

- (void)setThreeDSecureParams:(PaymentOptions *)paymentOptions {
    ThreeDSecureInfo *threeDSecureInfo = [[ThreeDSecureInfo alloc] init];
     
    ThreeDSecurePaymentInfo *threeDSecurePaymentInfo = [[ThreeDSecurePaymentInfo alloc] init];
    ThreeDSecureCustomerInfo *threeDSecureCustomerInfo = [[ThreeDSecureCustomerInfo alloc] init];
     
    ThreeDSecureGiftCardInfo *giftCard = [[ThreeDSecureGiftCardInfo alloc] init];
    giftCard.amount = 12345;
    giftCard.currency = @"USD";
    giftCard.count = 1;
     
    threeDSecurePaymentInfo.challengeIndicator = @"01";
    threeDSecurePaymentInfo.challengeWindow = @"01";
    threeDSecurePaymentInfo.preorderDate = @"01-10-2020";
    threeDSecurePaymentInfo.preorderPurchase = @"01";
    threeDSecurePaymentInfo.reorder = @"01";
    threeDSecurePaymentInfo.giftCard = giftCard;
     
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
     
    [paymentOptions setThreeDSecureInfo: threeDSecureInfo];
}

//MARK: - Advanced error codes handling
+ (void)handleError:(PaymentError* )error
{
    switch (error.code) {
        case PaymentErrorCodePaymentMethodNotAvailable:
            NSLog(@"Error: payment method is not available");
            break;
        default:
            NSLog(@"Error code: %@ with message: %@", error.codeString, error.message);
            break;
    }
}

@end
