//
//  WHTabBarController.m
//  EnglishShow
//
//  Created by houjing on 2018/12/13.
//  Copyright © 2018年 houjing. All rights reserved.
//

#import "WHTabBarController.h"
#import "WHNavigationController.h"
#import "HomeVC.h"
#import "ShowVC.h"
#import "MineVC.h"

@interface WHTabBarController ()

@end

@implementation WHTabBarController

- (instancetype)init {
    if (!(self = [super init])) {
        return nil;
    }
    /**
     * 以下两行代码目的在于手动设置让TabBarItem只显示图标，不显示文字，并让图标垂直居中。
     * 等效于在 `-tabBarItemsAttributesForController` 方法中不传 `CYLTabBarItemTitle` 字段。
     * 更推荐后一种做法。
     */
    //UIEdgeInsets imageInsets = UIEdgeInsetsZero;//UIEdgeInsetsMake(4.5, 0, -4.5, 0);
    //UIOffset titlePositionAdjustment = UIOffsetMake(0, -3.5);
    CYLTabBarController *tabBarController = [CYLTabBarController tabBarControllerWithViewControllers:self.viewControllers
                                                                               tabBarItemsAttributes:self.tabBarItemsAttributesForController
                                                                                         imageInsets:UIEdgeInsetsZero
                                                                             titlePositionAdjustment:UIOffsetZero
                                                                                             context:nil
                                             ];
    return (self = (WHTabBarController *)tabBarController);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
    [UITabBar appearance].translucent = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (void)initialize{
    //获取当前页面下所有的item
    UITabBarItem *barBarItem = [UITabBarItem appearance];
    
    //设置当前页面下所有item的颜色
    NSDictionary *dict = @{NSForegroundColorAttributeName:[UIColor colorWithHexString:kMainHexColorStr]};
    [barBarItem setTitleTextAttributes:dict forState:UIControlStateSelected];
    
    // 通过normal状态设置字体大小
    // 字体大小 跟 normal
    NSMutableDictionary *attrnor = [NSMutableDictionary dictionary];
    // 设置字体
    attrnor[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [barBarItem setTitleTextAttributes:attrnor forState:UIControlStateNormal];
}

- (NSArray *)viewControllers {
    HomeVC *homeVC = [[HomeVC alloc] init];
    UIViewController *firstNavigationController = [[WHNavigationController alloc]
                                                   initWithRootViewController:homeVC];
    
    ShowVC *showVC = [[ShowVC alloc] init];
    UIViewController *secondNavigationController = [[WHNavigationController alloc]
                                                    initWithRootViewController:showVC];
    
    MineVC *mineVC = [[MineVC alloc] init];
    UIViewController *thirdNavigationController = [[WHNavigationController alloc]
                                                   initWithRootViewController:mineVC];
    
    NSArray *viewControllers = @[
                                 firstNavigationController,
                                 secondNavigationController,
                                 thirdNavigationController
                                 ];
    return viewControllers;
}

- (NSArray *)tabBarItemsAttributesForController {
    
    NSDictionary *firstTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"首页",
                                                 CYLTabBarItemImage : @"home_normal",
                                                 CYLTabBarItemSelectedImage : @"home_highlight"
                                                 };
    
    NSDictionary *secondTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"英语秀",
                                                  CYLTabBarItemImage : @"fishpond_normal",
                                                  CYLTabBarItemSelectedImage : @"fishpond_highlight"
                                                  };
    
    NSDictionary *thirdTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"我的",
                                                 CYLTabBarItemImage : @"message_normal",
                                                 CYLTabBarItemSelectedImage : @"message_highlight"
                                                 };
    
    NSArray *tabBarItemsAttributes = @[
                                       firstTabBarItemsAttributes,
                                       secondTabBarItemsAttributes,
                                       thirdTabBarItemsAttributes
                                       ];
    return tabBarItemsAttributes;
}

@end
