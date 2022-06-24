//
//  DataValue.m
//  TestClient
//
//  Created by Ecommpay on 5/31/18.
//  Copyright © 2018 Ecommpay. All rights reserved.
//

#import "DataValue.h"

@implementation DataValue

+ (DataValue *)dataValueWith:(NSString *)title andKey:(NSString *)key andValue:(id)value isSecure:(BOOL)isSecure {
    return [self dataValueWith:title andKey:key andValue:value isSecure:isSecure isImmutable:NO];
}

+ (DataValue *)dataValueWith:(NSString *)title
                      andKey:(NSString *)key
                    andValue:(id)value
                    isSecure:(BOOL)isSecure
                 isImmutable:(BOOL)isImmutable {
    DataValue *data = [[DataValue alloc] init];
    data.title = title;
    data.key = key;
    data.value = value;
    data.isSecure = isSecure;
    data.isImmutable = isImmutable;
    return data;
}


- (BOOL)isEqual:(id)other {
    return [((DataValue *) other).key isEqualToString:self.key];;
}

- (NSUInteger)hash {
    return [self.key hash];
}

@end
