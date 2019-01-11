//
//  NSString+Safe.m
//  TradeClub
//
//  Created by houjing on 2018/1/17.
//  Copyright © 2018年 eresl. All rights reserved.
//

#import "NSString+Safe.h"

@implementation NSString (Safe)

+ (NSString *)safeString:(NSString *)str {
    NSString *string = str;
    if (string == nil || string == NULL) {
        return @"";
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return @"";
    }
    if ([string isEqualToString:@"null"]) {
        return @"";
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return @"";
    }
    
    return string;
}

//数据库用
+ (NSString *)safeStringToNull:(NSString *)str{
    NSString *string = str;
    if (string == nil || string == NULL) {
        return @"null";
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return @"null";
    }
    if ([string isEqualToString:@"null"]) {
        return @"null";
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return @"null";
    }
    
    return string;
}

@end
