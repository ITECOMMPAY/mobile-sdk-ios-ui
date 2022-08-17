//
//  ViewController.m
//  TestClient
//
//  Created by Ecommpay on 10/30/17.
//  Copyright © 2017 Ecommpay. All rights reserved.
//

#import "MainViewController.h"
#import "TextFieldTableViewCell.h"
#import "ButtonTableViewCell.h"
#import "DataValue.h"

#import "SDKImportHeader.h"

#import "MainViewControllerSetup.h"
#import "MainViewControllerDelegate.h"
#import "MainViewControllerActions.h"

@import CoreLocation;

@class ThreeDSecureParamsHelper;
@class ThreeDSecureDTO;
@class TestClass;

@interface MainViewController () <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, ScheduleViewControllerDelegate, FieldsViewControllerDelegate, RecipientInfoViewControllerDelegate, ThreeDSecureViewControllerDelegate, SettingViewControllerDelegate, CallbackDelegate, ApplePaySettingViewControllerDelegate>

@property(weak, nonatomic) IBOutlet UITableView *tableView;
@property(weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;

@property(nonatomic, strong) NSMutableArray *items;
@property(nonatomic, strong) NSArray *scheduleItems;
@property(nonatomic, strong) NSArray *additionalFields;
@property(nonatomic, strong) SDKFacadeType *paymentSDK;
@property(nonatomic, strong) ThreeDSecureDTO *threeDSecureDTO;
@property(nonatomic) BOOL hideSavedWallets;
@property(nonatomic, strong) NSArray *screenDisplayModes;
@property(nonatomic, strong) RecipientInfo *recipientInfo;

@end

@implementation MainViewController

CLLocationManager *locationManager;
bool isOpen = true;

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];

    // Setup Data
    self.items = [[MainViewControllerSetup getInitialItemsArray] mutableCopy];

    // Setup UI
    [MainViewControllerSetup registerTableViewCells:self.tableView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [MainViewControllerSetup registerForKeyboardNotifications:self];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [MainViewControllerSetup unRegisterFromKeyboardNotifications:self];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Actions

- (void)buyButtonClick:(ActionType)action {
    if (isOpen) {
        // Reset Keyboard
        [self.view endEditing:true];

        // Init SDK
        self.paymentSDK = [[SDKFacadeType alloc]
                           initWithApi:[MainViewControllerActions getDataValueWith:API_URL_KEY fromItems:self.items].value
                           socket:[MainViewControllerActions getDataValueWith:SOCKET_URL_KEY fromItems:self.items].value
                           callback:self];
        #if !ODTSDK && !JETPAY
        [self.paymentSDK setTheme:ThemeSetup.shared.theme];
        #endif

        // Compose Params
        PaymentOptions *paymentInfo = [MainViewControllerActions composePaymentInfoFromItems:self.items];
        //[paymentInfo setMockModeType: MockModeTypeSuccess];
        [paymentInfo setAdditionalFields:[self getArrayOfNonEmptyAdditionalFieldsItems]];
        [paymentInfo setRecipientInfo:self.recipientInfo];
        ////
        // Set token if needed
        NSString *token = [MainViewControllerActions getDataValueWith:TOKEN_CODE_KEY fromItems:self.items].value;
        //        token = @"26ee027e6ee0265bd2ce16f9a03c6482449783d636e0bd8ca4b8195be0df726d";
        if (![token isEqualToString:@""]) {
            [paymentInfo setToken:token];
        }

        NSString *languageCode = [MainViewControllerActions getDataValueWith:LANGUAGE_CODE_KEY fromItems:self.items].value;

        if (![languageCode isEqualToString:@""]) {
            [paymentInfo setLanguageCode:languageCode];
        }

        NSString *forcePaymentMethod = [MainViewControllerActions getDataValueWith:FORCE_PAYMENT_METHOD_KEY fromItems:self.items].value;

        if (![forcePaymentMethod isEqual:@""]) {
            [paymentInfo setForcePaymentMethod:forcePaymentMethod];
        }

        if (self.threeDSecureDTO != NULL) {
            if ([self.threeDSecureDTO isSendParams]) {
                [paymentInfo setSecureInfo:[self.threeDSecureDTO getThreeDSecureObject]];
            }
        }

        if (self.screenDisplayModes != NULL) {
            for (NSString *modeStr in _screenDisplayModes) {
                [paymentInfo addScreenDisplayModeString:modeStr];
            }
        }

        [paymentInfo setApplePayMerchantID:@"merchant.ecommpayDemo.sdk"];

        NSString *receipt_data = [MainViewControllerActions getDataValueWith:RECEIPT_DATA_CODE_KEY fromItems:self.items].value;
        if (![receipt_data isEqualToString:@""]) {
            [paymentInfo setReceiptData:receipt_data];
        }

        if (self.hideSavedWallets != NULL) {
            [paymentInfo setHideSavedWallets:self.hideSavedWallets];
        }

        NSString *applePayDescription = [MainViewControllerActions getDataValueWith:APPLE_PAY_DESCRIPTION_KEY fromItems:self.items].value;
        if (![applePayDescription isEqualToString:@""]) {
            [paymentInfo setApplePayDescription:applePayDescription];
        }
 

        NSString *paramsForSignature = [paymentInfo getParamsForSignature];

        // Compose Signature
        //    NSString *signature = [Utils signatureWithParams:params secret:[MainViewControllerActions getDataValueWith:SALT_KEY fromItems:self.items].value ignoreParamKeys: @[]];
        NSString *signature = [Utils signatureWithParams:paramsForSignature secret:[MainViewControllerActions getDataValueWith:SALT_KEY fromItems:self.items].value];
        //    signature = [NSString stringWithFormat:@"%@fsdfsdf",signature]; // test wrong signature
        [paymentInfo setSignature:signature];

        // Setup sale/auth for credit card, by default its Sale

        [paymentInfo setAction:action];

        // Setup recurrent if needed
        if ([self isRecurrentActive]) {
            RecurrentInfo *recurrentInfo = [MainViewControllerActions composeRecurrentInfoFromItems:self.items];

            // Recurrent schedule
            if (self.scheduleItems != NULL && self.scheduleItems.count > 0) {
                [recurrentInfo setSchedule:self.scheduleItems];
            }

            [paymentInfo setRecurret:recurrentInfo];
        }


        // Call action to buy
        isOpen = false;
        [self.paymentSDK presentPaymentAt:self paymentOptions:paymentInfo completionHandler:^(PaymentResulType *result) {
            if (result.error != nil) { // If error
                id code = [result.error.userInfo objectForKey:SDKFacadeType.kSDKInitErrorCodeKey];
                NSString *title = [NSString stringWithFormat: @"ErrorCode: %@", code ?: @"empty"];
                [MainViewControllerActions presentAlertWithTitle:title
                                                     andMessage:result.error.localizedDescription
                                                 fromController:self];
                isOpen = true;
            } else if (result.token != nil) { // If token
                UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
                pasteboard.string = result.token;
                [MainViewControllerActions presentAlertWith:result.token fromController:self];
                isOpen = true;
            } else { // Anything else
                [MainViewControllerActions presentAlertWith:[NSString stringWithFormat:@"Finish with status:%li", result.status] fromController:self];
                isOpen = true;
            }
            NSLog(@"mobileSDK finished with status %ld", (long) result.status);
            isOpen = true;
        }];
    }
}

- (void)resetPaymentId {
    DataValue *payment_id = [MainViewControllerActions getDataValueWith:PAYMENT_ID_KEY fromItems:self.items];
    payment_id.value = [MainViewControllerSetup getUniquePaymentID];
    [self.tableView reloadData];
}

- (void)toggleSalt {
    DataValue *salt = [MainViewControllerActions getDataValueWith:SALT_KEY fromItems:self.items];
    salt.isSecure = !salt.isSecure;
    [self.tableView reloadData];
}

- (void)swithcTheme {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"ThemeViewController"];
    [self presentViewController:vc animated:true completion:nil];
}

- (void)showSchedule {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"ScheduleViewController"];
    ((ScheduleViewController *) vc).delegate = self;
    if (self.scheduleItems != NULL) {
        ((ScheduleViewController *) vc).items = self.scheduleItems;
    }
    [self presentViewController:vc animated:true completion:nil];
}

- (void)showThreeDSecureParams {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"ThreeDSecureViewController"];
    ((ThreeDSecureViewController *) vc).delegate = self;
    [self presentViewController:vc animated:true completion:nil];
}

- (void)showSetting {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"SettingViewController"];
    ((SettingViewController *) vc).delegate = self;
    [self presentViewController:vc animated:true completion:nil];
}

- (void)showApplePaySettings {
    UIViewController *vc = [[[ApplePaySettingConfiguration alloc] init] configure];
    ((ApplePaySettingViewController *) vc).delegate = self;
    UINavigationController *navigationController =
            [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:navigationController animated:true completion:nil];
}

- (void)showAdditionalFields {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"FieldsViewController"];
    ((FieldsViewController *) vc).delegate = self;
    if (self.additionalFields != NULL) {
        ((FieldsViewController *) vc).fieldObjects = self.additionalFields;
    }
    [self presentViewController:vc animated:true completion:nil];
}

- (void)showRecipientInfoView {
    RecipientInfoViewController *vc = [RecipientInfoViewController intantiateWithInfo: self.recipientInfo];
    vc.delegate = self;
    [self presentViewController:vc animated:true completion:nil];
}

- (void)requestLocation {
    locationManager = [[CLLocationManager alloc] init];
    [locationManager requestWhenInUseAuthorization];
}

- (NSArray *)getArrayOfNonEmptyAdditionalFieldsItems {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    if (self.additionalFields == NULL) {
        return [array copy];
    }

    for (AdditionalField *field in self.additionalFields) {
        if (![field.value isEqualToString:@""]) {
            [array addObject:field];
        }
    }

    return [array copy];
}

- (void)toggleRecurrent {
    NSArray *recurringItems = [MainViewControllerSetup getRecurringItemsArray];

    if ([self isRecurrentActive]) {
        [self.items removeObjectsInArray:recurringItems];
    } else {
        [self.items addObjectsFromArray:recurringItems];
    }

    [self.tableView reloadData];
}

- (BOOL)isRecurrentActive {
    return [self.items containsObject:[MainViewControllerSetup getRecurringItemsArray].firstObject];
}

#pragma mark - Delegate Keyboard

- (void)keyboardFrameDidChange:(NSNotification *)notification {
    [MainViewControllerDelegate keyboardFrameDidChange:notification bottomConstraint:self.bottomConstraint rootView:self.view];
}

#pragma mark - Delegate TableView

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [MainViewControllerDelegate tableView:tableView cellForRowAtIndexPath:indexPath items:self.items textViewDelegate:self];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [MainViewControllerDelegate tableView:tableView numberOfRowsInSection:section items:self.items];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DataValue *value = self.items[indexPath.row];
    if ([value.key isEqualToString:BUTTON_PAYMENT]) {
        [self resetPaymentId];
    } else if ([value.key isEqualToString:BUTTON_TOGGLE_SALT]) {
        [self toggleSalt];
    } else if ([value.key isEqualToString:BUTTON_RECURRENT]) {
        [self toggleRecurrent];
    } else if ([value.key isEqualToString:BUTTON_REQUEST_LOCATION]) {
        [self requestLocation];
    } else if ([value.key isEqualToString:BUTTON_SALE]) {
        [self buyButtonClick:ActionTypeSale];
    } else if ([value.key isEqualToString:BUTTON_AUTH]) {
        [self buyButtonClick:ActionTypeAuth];
    } else if ([value.key isEqualToString:BUTTON_TOKENIZE]) {
        [self buyButtonClick:ActionTypeTokenize];
    }  else if ([value.key isEqualToString:BUTTON_VERIFY]) {
        [self buyButtonClick:ActionTypeVerify];
    }  else if ([value.key isEqualToString:BUTTON_THEME_SWITCH]) {
        [self swithcTheme];
    } else if ([value.key isEqualToString:BUTTON_RECURRENT_SCHEDULE]) {
        [self showSchedule];
    } else if ([value.key isEqualToString:BUTTON_ADDITIONAL_FIELDS]) {
        [self showAdditionalFields];
    } else if ([value.key isEqualToString:BUTTON_RECIPIENT_INFO]) {
        [self showRecipientInfoView];
    } else if ([value.key isEqualToString:BUTTON_THREE_D_SECURE]) {
        [self showThreeDSecureParams];
    } else if ([value.key isEqualToString:BUTTON_SETTING]) {
        [self showSetting];
    }  else if ([value.key isEqualToString:BUTTON_APPLE_PAY_SETTING]) {
        [self showApplePaySettings];
    }
}

#pragma mark - Delegate TextField

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    DataValue *updatedDataValue = [MainViewControllerDelegate textField:textField shouldChangeCharactersInRange:range replacementString:string tableView:self.tableView items:self.items];
    if (updatedDataValue != nil) {
        for (int i = 0; i < self.items.count; i++) {
            if ([((DataValue *) self.items[i]).key isEqualToString:updatedDataValue.key]) {
                self.items[i] = updatedDataValue;
            }
        }
    }

    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return [MainViewControllerDelegate textFieldShouldReturn:textField];
}

#pragma mark - Delegate Schedule

- (void)onCloseWithItems:(NSArray<RecurrentInfoSchedule *> *)items {
    self.scheduleItems = items;
}

#pragma mark - Delegate Additional Fields

- (void)onCloseAdditionalFieldsWithItems:(NSArray<AdditionalField *> *)items {
    self.additionalFields = items;
}

#pragma mark - Delegate 3Ds Secure

- (void)onDoneThreeDSecureParamsWithItem:(ThreeDSecureDTO *_Nonnull)item {
    self.threeDSecureDTO = item;
}

#pragma mark - Delegate Setting

- (void)onSetupHideSavedWalletsWithValue:(BOOL)value {
    self.hideSavedWallets = value;
}

- (void)onSetupScreenModeWithScreenDisplayModes:(NSArray<NSString *> *)screenDisplayModes {
    self.screenDisplayModes = screenDisplayModes;
}

- (void)onPaymentResult:(id)paymentData {
    NSLog(@"Ecommpay framework callback: \n");
    NSLog(@"%@", [Utils mapPaymentDataToStringWithPaymentData:paymentData]);
}

- (void)onFinishWithData:(NSArray<Data *> *_Nonnull)data {

}

- (void)onCloseWith:(RecipientInfo * _Nullable)info {
    self.recipientInfo = info;
}

@end
