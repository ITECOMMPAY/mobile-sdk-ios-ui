//
//  DataValue.h
//  TestClient
//
//  Created by Ecommpay on 5/31/18.
//  Copyright © 2018 Ecommpay. All rights reserved.
//

#import <Foundation/Foundation.h>

// REVIEW: Создать для данных структуры и использовать их
@interface DataValue : NSObject

@property(nonatomic, strong) NSString *key;
@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) id value;
@property(nonatomic, assign) BOOL isSecure;
@property(nonatomic, assign) BOOL isImmutable;

+ (DataValue *)dataValueWith:(NSString *)title andKey:(NSString *)key andValue:(id)value isSecure:(BOOL)isSecure;
+ (DataValue *)dataValueWith:(NSString *)title
                      andKey:(NSString *)key
                    andValue:(id)value
                    isSecure:(BOOL)isSecure
                 isImmutable:(BOOL)isImmutable;

@end
