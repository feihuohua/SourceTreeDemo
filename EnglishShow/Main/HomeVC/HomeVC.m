//
//  HomeVC.m
//  EnglishShow
//
//  Created by houjing on 2018/12/13.
//  Copyright © 2018年 houjing. All rights reserved.
//

#import "HomeVC.h"

@interface HomeVC ()

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTitleView];
    
    [self setupMainView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - init
- (void)setupTitleView{
    self.navigationItem.title = @"首页";
}

- (void)setupMainView{
    
}

@end
