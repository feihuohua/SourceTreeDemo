//
//  MineVC.m
//  EnglishShow
//
//  Created by houjing on 2018/12/13.
//  Copyright © 2018年 houjing. All rights reserved.
//

#import "MineVC.h"

@interface MineVC ()

@end

@implementation MineVC

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
    self.navigationItem.title = @"我的";
}

- (void)setupMainView{
    
}

@end
