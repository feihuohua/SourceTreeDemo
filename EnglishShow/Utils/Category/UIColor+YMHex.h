//
//  UIColor+YMHex.h
//  e网金融
//
//  Created by cym_bj on 15/12/10.
//
//

#import <UIKit/UIKit.h>

@interface UIColor (YMHex)
#define RGBA_COLOR(R, G, B, A) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:A]
#define RGB_COLOR(R, G, B) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:1.0f]

+ (UIColor *)colorWithHex:(NSUInteger)hexColor;

+ (UIColor *)colorWithHex:(NSUInteger)hexColor alpha:(CGFloat)alpha;

+ (UIColor *)colorWithHexString:(NSString *)color;

//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

+ (UIColor *)randomColor;
@end
