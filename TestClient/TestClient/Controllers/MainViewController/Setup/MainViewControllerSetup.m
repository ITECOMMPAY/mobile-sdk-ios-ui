//
//  MainViewControllerSetup.m
//  TestClient
//
//  Created by Ecommpay on 26/11/2018.
//  Copyright © 2018 Ecommpay. All rights reserved.
//

#import "MainViewControllerSetup.h"
#import "TextFieldTableViewCell.h"
#import "ButtonTableViewCell.h"
#import "DataValue.h"
#import "SDKImportHeader.h"

#define SALT                            @"123"
#define CURRENCY_DEFAULT                @"RUB"
//#define PROJECT_ID_DEFAULT              @(439)

#if ODTSDK
    #define PROJECT_ID_DEFAULT              @(75721)
#elif JETPAY
    #define PROJECT_ID_DEFAULT              @(103031)
#else
    #define PROJECT_ID_DEFAULT              @(627)
#endif

#define PAYMENT_AMOUNT_DEFAULT          @(1000)
#define PAYMENT_DESCRIPTION_DEFAULT     @"test"
#define CUSTOMER_ID_DEFAULT             @"12"
#define REGION_CODE_DEFAULT             @"RU"
#define TOKEN_DEFAULT                   @""
#define THEME_DEFAULT                   @"light"
#define LANGUAGE_CODE_DEFAULT           @""
#define FORCE_PAYMENT_METHOD_DEFAULT    @""
#define RECEIPT_DATA_CODE_KEY_DEFAULT   @""
#define APPLE_PAY_DESCRIPTION_KEY_DEFAULT @""

//#define SALT                            @"123456"
//#define CURRENCY_DEFAULT                @"RUB"
//#define PROJECT_ID_DEFAULT              @(36)
//#define PAYMENT_AMOUNT_DEFAULT          @(1000)
//#define PAYMENT_DESCRIPTION_DEFAULT     @""
//#define CUSTOMER_ID_DEFAULT             @"12"
//#define REGION_CODE_DEFAULT             @""
//#define TOKEN_DEFAULT                   @""
//#define THEME_DEFAULT                   @"light"
//#define LANGUAGE_CODE_DEFAULT           @""
//#define FORCE_PAYMENT_METHOD_DEFAULT    @""


#warning("Remember to change to your own params!")
//#define SALT                            @"c3b6ea765a094a20a4f5ee72e9b985cf28adb4fabe371a4e77d6cfb09234e41d267938638a867ef8aa29dbfddb43566fadb109cfea071656bf1c5f627680650a"
//#define CURRENCY_DEFAULT                @"RUB"
//#define PROJECT_ID_DEFAULT              @(188)
//#define PAYMENT_AMOUNT_DEFAULT          @(12345)
//#define PAYMENT_DESCRIPTION_DEFAULT     @""
//#define CUSTOMER_ID_DEFAULT             @"12"
//#define REGION_CODE_DEFAULT             @""
//#define TOKEN_DEFAULT                   @""
//#define THEME_DEFAULT                   @"light"
//#define LANGUAGE_CODE_DEFAULT           @""
//#define FORCE_PAYMENT_METHOD_DEFAULT    @""

//#define API_DEFAULT                     @"https://pp-sdk.westresscode.net/v1"
//#define SOCKET_DEFAULT                  @"wss://paymentpage.westresscode.net/ws"

@implementation MainViewControllerSetup

+ (void)registerTableViewCells:(UITableView *)tableView {
    
    // Data Displaying cells
    UINib *textFieldCell = [UINib nibWithNibName:[TextFieldTableViewCell ID] bundle:nil];
    [tableView registerNib:textFieldCell forCellReuseIdentifier: [TextFieldTableViewCell ID]];
    
    // Buttons
    UINib *buttonCell = [UINib nibWithNibName:[ButtonTableViewCell ID] bundle:nil];
    [tableView registerNib:buttonCell forCellReuseIdentifier: [ButtonTableViewCell ID]];
}

#pragma GCC diagnostic ignored "-Wundeclared-selector"

+ (void)registerForKeyboardNotifications:(NSObject*)observer {
     [[NSNotificationCenter defaultCenter] addObserver:observer selector:@selector(keyboardFrameDidChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

+ (void)unRegisterFromKeyboardNotifications:(NSObject*)observer {
    [[NSNotificationCenter defaultCenter] removeObserver:observer];
}

+ (NSString *)sdkName {
    return [[NSStringFromClass(SDKFacadeType.class) componentsSeparatedByString:@"."] firstObject];
}

+ (NSArray *)getInitialItemsArray {
    return @[
        [DataValue dataValueWith: @"SDK" andKey:@"SDK" andValue:[self sdkName]  isSecure: NO isImmutable:YES],
        [DataValue dataValueWith: @"SDK VERSION" andKey:SDK_VERSION andValue:SDKFacadeType.sdkVersion isSecure: NO isImmutable:YES],
        [DataValue dataValueWith: @"BUILD NUMBER" andKey:BUILD_NUMBER andValue:SDKFacadeType.buildNumber isSecure: NO isImmutable:YES],
        [DataValue dataValueWith: @"URL API" andKey:API_URL_KEY andValue:[SDKFacadeType.apiURL absoluteString] isSecure: NO],
        [DataValue dataValueWith: @"URL SOCKET" andKey:SOCKET_URL_KEY andValue:[SDKFacadeType.socketURL absoluteString] isSecure: NO],
        [DataValue dataValueWith: PROJECT_ID_KEY andKey: PROJECT_ID_KEY andValue: PROJECT_ID_DEFAULT isSecure: NO],
        [DataValue dataValueWith: PAYMENT_ID_KEY
                          andKey: PAYMENT_ID_KEY
                        andValue: ([[NSUserDefaults standardUserDefaults] stringForKey:PAYMENT_ID_KEY] ?: [self getUniquePaymentID])
                        isSecure: NO],
        [DataValue dataValueWith: @"Reset Payment ID" andKey:BUTTON_PAYMENT andValue: nil isSecure: NO], // extract
        [DataValue dataValueWith: PAYMENT_AMOUNT_KEY andKey:PAYMENT_AMOUNT_KEY andValue: PAYMENT_AMOUNT_DEFAULT isSecure: NO],
        [DataValue dataValueWith: PAYMENT_DESCRIPTION_KEY andKey: PAYMENT_DESCRIPTION_KEY andValue: PAYMENT_DESCRIPTION_DEFAULT isSecure: NO],
        [DataValue dataValueWith: PAYMENT_CURRENCY_KEY andKey: PAYMENT_CURRENCY_KEY andValue: CURRENCY_DEFAULT isSecure: NO],
        [DataValue dataValueWith: CUSTOMER_ID_KEY andKey: CUSTOMER_ID_KEY andValue: CUSTOMER_ID_DEFAULT isSecure: NO],
        [DataValue dataValueWith: REGION_CODE_KEY andKey: REGION_CODE_KEY andValue: REGION_CODE_DEFAULT isSecure: NO],
        [DataValue dataValueWith: SALT_KEY andKey: SALT_KEY andValue: SALT isSecure: YES],
        [DataValue dataValueWith: TOKEN_CODE_KEY andKey: TOKEN_CODE_KEY andValue: TOKEN_DEFAULT isSecure: NO],
        [DataValue dataValueWith: LANGUAGE_CODE_KEY andKey: LANGUAGE_CODE_KEY andValue: LANGUAGE_CODE_DEFAULT isSecure: NO],
        [DataValue dataValueWith: FORCE_PAYMENT_METHOD_KEY andKey: FORCE_PAYMENT_METHOD_KEY andValue: FORCE_PAYMENT_METHOD_DEFAULT isSecure: NO],
        [DataValue dataValueWith: RECEIPT_DATA_CODE_KEY andKey: RECEIPT_DATA_CODE_KEY andValue: RECEIPT_DATA_CODE_KEY_DEFAULT isSecure: NO],
        [DataValue dataValueWith: APPLE_PAY_DESCRIPTION_KEY andKey: APPLE_PAY_DESCRIPTION_KEY andValue: APPLE_PAY_DESCRIPTION_KEY_DEFAULT isSecure: NO],
        [DataValue dataValueWith: @"Setting" andKey: BUTTON_SETTING andValue: nil isSecure: NO],
        [DataValue dataValueWith: @"Apple Pay settings" andKey: BUTTON_APPLE_PAY_SETTING andValue: nil isSecure: NO],
        #if !ODTSDK && !JETPAY
        [DataValue dataValueWith: @"Theme Setup" andKey: BUTTON_THEME_SWITCH andValue: nil isSecure: NO],
        #endif
        [DataValue dataValueWith: @"Additional Fields" andKey: BUTTON_ADDITIONAL_FIELDS andValue: nil isSecure: NO],
        [DataValue dataValueWith: @"Recipient Info" andKey: BUTTON_RECIPIENT_INFO andValue: nil isSecure: NO],
        [DataValue dataValueWith: @"3Ds Secure" andKey: BUTTON_THREE_D_SECURE andValue: nil isSecure: NO],
        [DataValue dataValueWith: @"Toggle Secure Salt" andKey: BUTTON_TOGGLE_SALT andValue: nil isSecure: NO],
        [DataValue dataValueWith: @"Toggle Recurrent" andKey:BUTTON_RECURRENT andValue: nil isSecure: NO],
        [DataValue dataValueWith: @"Request Location" andKey:BUTTON_REQUEST_LOCATION andValue: nil isSecure: NO],
        [DataValue dataValueWith: @"SALE" andKey:BUTTON_SALE andValue: nil isSecure: NO],
        [DataValue dataValueWith: @"Auth" andKey:BUTTON_AUTH andValue: nil isSecure: NO],
        [DataValue dataValueWith: @"Tokenize" andKey:BUTTON_TOKENIZE andValue: nil isSecure: NO],
        [DataValue dataValueWith: @"Verification" andKey:BUTTON_VERIFY andValue: nil isSecure: NO]
    ];
    //TODO extract buttons!!!
}

+ (NSArray *)getRecurringItemsArray {
    return @[
              [DataValue dataValueWith: @"Recurrent type" andKey:RECURRENT_TYPE_KEY andValue: @"R" isSecure: NO],
              [DataValue dataValueWith: @"Expir day" andKey:EXPIR_DAY_KEY andValue: @"07" isSecure: NO],
              [DataValue dataValueWith: @"Expir month" andKey:EXPIR_MONTH_KEY andValue: @"11" isSecure: NO],
              [DataValue dataValueWith: @"Expir year" andKey:EXPIR_YEAR_KEY andValue: @"2023" isSecure: NO],
              [DataValue dataValueWith: @"Period" andKey:RECURRENT_PERIOD_KEY andValue: @"D" isSecure: NO],
              [DataValue dataValueWith: @"Time" andKey:RECURRENT_TIME_KEY andValue: @"12:00:00" isSecure: NO],
              [DataValue dataValueWith: @"Start Date" andKey:RECURRENT_START_DATE andValue: @"12-09-2023" isSecure: NO],
              [DataValue dataValueWith: @"Scheduled Payment ID" andKey:RECURRENT_SCHEDULED_PAYMENT_ID_KEY andValue: [self getUniqueScheduledID] isSecure: NO],
              [DataValue dataValueWith: @"Amount" andKey:RECURRENT_AMOUNT_KEY andValue: @"" isSecure: NO],
              [DataValue dataValueWith: @"Schedule" andKey:BUTTON_RECURRENT_SCHEDULE andValue: @"" isSecure: NO]
             ];
}

+ (NSString *)getUniquePaymentID {
    NSString* paymentID = [NSString stringWithFormat: @"sdk_ios_%0.0f", [[NSDate date] timeIntervalSince1970]];
    [[NSUserDefaults standardUserDefaults] setObject: paymentID forKey: PAYMENT_ID_KEY];
    return paymentID;
}

+ (NSString *)getUniqueScheduledID {
    return [NSString stringWithFormat:@"scheduled_ios_%0.0f", [[NSDate date] timeIntervalSince1970]];
}


+ (NSString *)buildNumber {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey: (NSString *)kCFBundleVersionKey];
}
@end

