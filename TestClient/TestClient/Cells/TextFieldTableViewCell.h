//
//  TextFieldTableViewCell.h
//  TestClient
//
//  Created by Ecommpay on 5/31/18.
//  Copyright © 2018 Ecommpay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextFieldTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *textField;

+ (NSString *)ID;

@end
