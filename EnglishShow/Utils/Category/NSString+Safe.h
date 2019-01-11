//
//  NSString+Safe.h
//  TradeClub
//
//  Created by houjing on 2018/1/17.
//  Copyright © 2018年 eresl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Safe)

+ (NSString *)safeString:(NSString *)str;

//数据库用
+ (NSString *)safeStringToNull:(NSString *)str;

@end
