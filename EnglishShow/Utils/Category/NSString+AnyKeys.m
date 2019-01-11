//
//  NSString+AnyKeys.m
//  TradeClub
//
//  Created by houjing on 2018/1/26.
//  Copyright © 2018年 eresl. All rights reserved.
//

#import "NSString+AnyKeys.h"

@implementation NSString (AnyKeys)

+ (NSString *)getAnyKeysStringFromArray:(NSArray *)array key:(NSString *)key{
    
    NSMutableString *string = [NSMutableString string];
    for (NSObject *vo in array) {
        if (string.length == 0) {
            [string appendString:[vo valueForKey:key]];
        }else{
            [string appendFormat:@",%@",[vo valueForKey:key]];
        }
    }
    return string;
}

@end
