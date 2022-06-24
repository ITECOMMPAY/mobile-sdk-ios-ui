//
//  MainViewControllerDelegate.m
//  TestClient
//
//  Created by Ecommpay on 26/11/2018.
//  Copyright © 2018 Ecommpay. All rights reserved.
//

#import "MainViewControllerDelegate.h"
#import "ButtonTableViewCell.h"
#import "TextFieldTableViewCell.h"
#import "DataValue.h"

@implementation MainViewControllerDelegate

#pragma mark - Delegate TableView

+ (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath items:(NSArray *)items textViewDelegate:(id<UITextFieldDelegate>)delegate {
    if (indexPath.row < items.count) {
        DataValue *value = items[indexPath.row];
        if ([value.key isEqualToString:BUTTON_PAYMENT] ||
            [value.key isEqualToString:BUTTON_TOGGLE_SALT] ||
            [value.key isEqualToString:BUTTON_RECURRENT] ||
            [value.key isEqualToString:BUTTON_REQUEST_LOCATION] ||
            [value.key isEqualToString:BUTTON_SALE] ||
            [value.key isEqualToString:BUTTON_AUTH] ||
            [value.key isEqualToString:BUTTON_TOKENIZE] ||
            [value.key isEqualToString:BUTTON_VERIFY] ||
            [value.key isEqualToString:BUTTON_THEME_SWITCH] ||
            [value.key isEqualToString:BUTTON_ADDITIONAL_FIELDS] ||
            [value.key isEqualToString:BUTTON_RECIPIENT_INFO] ||
            [value.key isEqualToString:BUTTON_RECURRENT_SCHEDULE] ||
            [value.key isEqualToString:BUTTON_THREE_D_SECURE] ||
            [value.key isEqualToString:BUTTON_SETTING] ||
            [value.key isEqualToString:BUTTON_APPLE_PAY_SETTING]) {
            ButtonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[ButtonTableViewCell ID] forIndexPath:indexPath];
            cell.titleLabel.text = value.title;
            if([value.key isEqualToString:BUTTON_SALE]) {
                cell.accessibilityLabel = @"buttonSale";
            } else {
                cell.accessibilityLabel = @"";
            }
            return cell;
        }
        TextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: [TextFieldTableViewCell ID] forIndexPath: indexPath];
        cell.titleLabel.text = value.title;
        
        cell.textField.delegate = delegate;
        
        if ([value.value isKindOfClass: [NSString class]]) {
            cell.textField.text = value.value;
        }
        if ([value.value isKindOfClass: [NSNumber class]]) {
            cell.textField.text = [((NSNumber *)value.value) stringValue];
        }
        cell.textField.secureTextEntry = value.isSecure;
        cell.textField.enabled = !value.isImmutable;
                
        return cell;
    }
    
    return nil;
}

+ (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section items:(NSArray *)items {
    return items.count;
}

#pragma mark - Delegate TextField

+ (DataValue *)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string tableView:(UITableView *)tableView items:(NSArray *)items {
    if (textField.text) {
        NSString *finalText = [textField.text stringByReplacingCharactersInRange:range withString:string];
        CGPoint point = [tableView convertPoint:textField.center fromView:textField.superview];
        NSIndexPath *indexPath = [tableView indexPathForRowAtPoint:point];
        DataValue *dataValue = items[indexPath.row];
        if ([dataValue.key isEqualToString:PROJECT_ID_KEY] ||
            [dataValue.key isEqualToString:PAYMENT_AMOUNT_KEY] ||
            [dataValue.key isEqualToString:RECURRENT_AMOUNT_KEY]) {
            
            dataValue.value =  @(finalText.integerValue);
        } else if([dataValue.key isEqualToString:PAYMENT_ID_KEY] ||
                  [dataValue.key isEqualToString:CUSTOMER_ID_KEY] ||
                  [dataValue.key isEqualToString:PAYMENT_DESCRIPTION_KEY] ||
                  [dataValue.key isEqualToString:PAYMENT_CURRENCY_KEY] ||
                  [dataValue.key isEqualToString:REGION_CODE_KEY] ||
                  [dataValue.key isEqualToString:SALT_KEY] ||
                  [dataValue.key isEqualToString:API_URL_KEY] ||
                  [dataValue.key isEqualToString:SOCKET_URL_KEY] ||
                  [dataValue.key isEqualToString:TOKEN_CODE_KEY] ||
                  [dataValue.key isEqualToString:LANGUAGE_CODE_KEY] ||
                  [dataValue.key isEqualToString:FORCE_PAYMENT_METHOD_KEY] ||
                  [dataValue.key isEqualToString:RECEIPT_DATA_CODE_KEY] ||
                  [dataValue.key isEqualToString:APPLE_PAY_DESCRIPTION_KEY] ||

                  [dataValue.key isEqualToString:RECURRENT_TYPE_KEY] ||
                  [dataValue.key isEqualToString:EXPIR_DAY_KEY] ||
                  [dataValue.key isEqualToString:EXPIR_MONTH_KEY] ||
                  [dataValue.key isEqualToString:EXPIR_YEAR_KEY] ||
                  [dataValue.key isEqualToString:RECURRENT_PERIOD_KEY] ||
                  [dataValue.key isEqualToString:RECURRENT_TIME_KEY] ||
                  [dataValue.key isEqualToString:RECURRENT_START_DATE] ||
                  [dataValue.key isEqualToString:RECURRENT_SCHEDULED_PAYMENT_ID_KEY]) {
            
            dataValue.value = finalText;
        }
        
        return dataValue;
    }
    return nil;
}

+ (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

+ (void)keyboardFrameDidChange:(NSNotification *)notification bottomConstraint:(NSLayoutConstraint*)bottomConstraint rootView:(UIView *)view {
    NSValue *value = notification.userInfo[UIKeyboardFrameEndUserInfoKey];
    NSNumber *animationDuration = notification.userInfo[UIKeyboardAnimationDurationUserInfoKey];
    CGRect frame = value.CGRectValue;
    CGFloat centerConstraintValue = view.bounds.size.height - frame.origin.y;
    if (centerConstraintValue < 0) {
        centerConstraintValue = 0;
    }
    
    [UIView animateWithDuration: animationDuration.floatValue animations:^{
        bottomConstraint.constant = centerConstraintValue;
        [view layoutIfNeeded];
    }];
}

@end
