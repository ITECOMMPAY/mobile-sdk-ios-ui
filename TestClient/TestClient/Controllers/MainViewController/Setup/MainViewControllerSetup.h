//
//  MainViewControllerSetup.h
//  TestClient
//
//  Created by Ecommpay on 26/11/2018.
//  Copyright © 2018 Ecommpay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MainViewControllerSetup : NSObject

/**
 Register needed cells for main table view

 @param tableView table view to register cells for, must be MainViewController
 */
+ (void)registerTableViewCells:(UITableView *)tableView;

/**
 Register for keyboard notifications.

 @param observer of the Notifications, MUST implement keyboardFrameDidChange:
 */
+ (void)registerForKeyboardNotifications:(NSObject*)observer;

/**
 Unregister from Keyboard Notifications
 TODO:// Currently unregister from all notifications

 @param observer of the Notifications
 */
+ (void)unRegisterFromKeyboardNotifications:(NSObject*)observer;

/**
 Get initial items to display and later pass to SDK

 @return Array with items of parameters to display and pass to SDK
 */
+ (NSArray *)getInitialItemsArray;

/**
 Get recurrent items to display and later pass to SDK

 @return Array with items of parameters to display and pass to SDK
 */
+ (NSArray *)getRecurringItemsArray;

/**
 Generate unique payment ID for transaction

 @return Unique String
 */
+ (NSString *)getUniquePaymentID;

/**
 Generate unique scheduled payment ID for transaction

 @return Unique String
 */
+ (NSString *)getUniqueScheduledID;

@end
