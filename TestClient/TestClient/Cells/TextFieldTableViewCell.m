//
//  TextFieldTableViewCell.m
//  TestClient
//
//  Created by Ecommpay on 5/31/18.
//  Copyright © 2018 Ecommpay. All rights reserved.
//

#import "TextFieldTableViewCell.h"

@implementation TextFieldTableViewCell

+ (NSString *)ID {
    return @"TextFieldTableViewCell";
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
