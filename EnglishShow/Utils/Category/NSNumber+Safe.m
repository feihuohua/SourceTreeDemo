//
//  NSNumber+Safe.m
//  TradeClub
//
//  Created by houjing on 2018/2/8.
//  Copyright © 2018年 eresl. All rights reserved.
//

#import "NSNumber+Safe.h"

@implementation NSNumber (Safe)

+ (NSNumber *)safeNumber:(NSNumber *)number{
    NSNumber *num = number;
    if (num == nil || num == NULL) {
        return @(0);
    }
    if ([num isKindOfClass:[NSNull class]]) {
        return @(0);
    }
    
    return num;
}

+ (NSString *)safeNumberToString:(NSNumber *)number{
    
    if (number == nil || number == NULL) {
        return @"";
    }
    if ([number isKindOfClass:[NSNull class]]) {
        return @"";
    }
    
    return [NSString stringWithFormat:@"%@",number];
}

//数据库用
+ (NSString *)safeNumberToNullString:(NSNumber *)number{
    if (number == nil || number == NULL) {
        return @"null";
    }
    if ([number isKindOfClass:[NSNull class]]) {
        return @"null";
    }
    
    return [NSString stringWithFormat:@"%@",number];
}

@end
