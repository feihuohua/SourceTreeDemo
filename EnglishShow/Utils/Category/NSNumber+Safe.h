//
//  NSNumber+Safe.h
//  TradeClub
//
//  Created by houjing on 2018/2/8.
//  Copyright © 2018年 eresl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (Safe)

+ (NSNumber *)safeNumber:(NSNumber *)number;

+ (NSString *)safeNumberToString:(NSNumber *)number;
//数据库用
+ (NSString *)safeNumberToNullString:(NSNumber *)number;

@end
