//
//  UIViewController+Helper.m
//  mmrsios
//
//  Created by jqk on 2016/11/14.
//  Copyright © 2016年 FiberHome. All rights reserved.
//

#import "UIViewController+Helper.h"

@implementation UIViewController (Helper)

+ (UIViewController*)currentDisPlayViewController{
    UIViewController *result = nil;

    UIWindow * window = [[UIApplication sharedApplication] delegate].window;
    //UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }

    UIView *frontView = [[window subviews] firstObject];
    id nextResponder = [frontView nextResponder];

    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;

    return result;
}

- (UINavigationController*)fh_navigationController
{
    UINavigationController* nav = nil;
    if ([self isKindOfClass:[UINavigationController class]]) {
        nav = (id)self;
    }
    else {
        if ([self isKindOfClass:[UITabBarController class]]) {
            nav = [((UITabBarController*)self).selectedViewController fh_navigationController];
        }
        else {
            nav = self.navigationController;
        }
    }
    return nav;
}

@end
