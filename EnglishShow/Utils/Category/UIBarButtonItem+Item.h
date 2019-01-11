//
//  UIBarButtonItem+Item.h
//  BuDeJie19
//
//  Created by hjj on 2016/12/3.
//  Copyright © 2016年 hjjuny. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Item)

+ (instancetype)itemWithFrame:(CGRect )frame Image:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action;

+ (instancetype)itemWithFrame:(CGRect )frame Image:(UIImage *)image selImage:(UIImage *)selImage target:(id)target action:(SEL)action;

+ (instancetype)itemWithFrame:(CGRect )frame title:(NSString *)title textColor:(UIColor *)color target:(id)target action:(SEL)action;

+ (instancetype)itemWithFrame:(CGRect )frame title:(NSString *)title font:(UIFont *)font textColor:(UIColor *)color target:(id)target action:(SEL)action;



@end
