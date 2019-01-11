//
//  UIBarButtonItem+Item.m
//  BuDeJie19
//
//  Created by hjj on 2016/12/3.
//  Copyright © 2016年 hjjuny. All rights reserved.
//

#import "UIBarButtonItem+Item.h"

@implementation UIBarButtonItem (Item)

+ (instancetype)itemWithFrame:(CGRect )frame Image:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:frame];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:highImage forState:UIControlStateHighlighted];
    //[btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIView *view = [[UIView alloc] initWithFrame:btn.bounds];
    [view addSubview:btn];
    
    return [[UIBarButtonItem alloc] initWithCustomView:view];
}

+ (instancetype)itemWithFrame:(CGRect )frame Image:(UIImage *)image selImage:(UIImage *)selImage target:(id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:frame];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:selImage forState:UIControlStateSelected];
    //[btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIView *view = [[UIView alloc] initWithFrame:btn.bounds];
    [view addSubview:btn];
    
    return [[UIBarButtonItem alloc] initWithCustomView:view];
}

+ (instancetype)itemWithFrame:(CGRect )frame title:(NSString *)title textColor:(UIColor *)color target:(id)target action:(SEL)action{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:frame];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIView *view = [[UIView alloc] initWithFrame:btn.bounds];
    [view addSubview:btn];
    
    return [[UIBarButtonItem alloc] initWithCustomView:view];
}

+ (instancetype)itemWithFrame:(CGRect )frame title:(NSString *)title font:(UIFont *)font textColor:(UIColor *)color target:(id)target action:(SEL)action{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:frame];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    [btn.titleLabel setFont:font];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIView *view = [[UIView alloc] initWithFrame:btn.bounds];
    [view addSubview:btn];
    
    return [[UIBarButtonItem alloc] initWithCustomView:view];
}



@end
