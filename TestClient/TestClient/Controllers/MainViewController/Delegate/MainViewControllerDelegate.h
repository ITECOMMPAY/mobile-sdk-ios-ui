//
//  MainViewControllerDelegate.h
//  TestClient
//
//  Created by Ecommpay on 26/11/2018.
//  Copyright © 2018 Ecommpay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class DataValue;

@interface MainViewControllerDelegate : NSObject

// Table View
+ (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath items:(NSArray *)items textViewDelegate:(id<UITextFieldDelegate>)delegate;
+ (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section items:(NSArray *)items;

// TexField
+ (DataValue *)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string tableView:(UITableView *)tableView items:(NSArray *)items;
+ (BOOL)textFieldShouldReturn:(UITextField *)textField;

// Keyboard
+ (void)keyboardFrameDidChange:(NSNotification *)notification bottomConstraint:(NSLayoutConstraint*)bottomConstraint rootView:(UIView *)view;

@end

