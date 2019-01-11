//
//  WHNavigationController.m
//  EnglishShow
//
//  Created by houjing on 2018/12/13.
//  Copyright © 2018年 houjing. All rights reserved.
//

#import "WHNavigationController.h"

@interface WHNavigationController ()

@end

@implementation WHNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    navigationBar.barTintColor = [UIColor colorWithHexString:kMainHexColorStr];
    
    NSDictionary *dict = @{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont systemFontOfSize:18]};
    navigationBar.titleTextAttributes = dict;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    } else {
        viewController.hidesBottomBarWhenPushed = NO;
    }
    [super pushViewController:viewController animated:animated];
}

@end
