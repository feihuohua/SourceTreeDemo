//
//  BaseViewController.m
//  FrameDemo
//
//  Created by houjing on 16/7/5.
//  Copyright © 2016年 eresl. All rights reserved.
//

#import "BaseViewController.h"

//selfLog
#define LOG_SELF_METHOD  NSLog(@"<%@> Called:'%@'",self,NSStringFromSelector(_cmd));

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //self.view.backgroundColor = RGB_COLOR(236, 236, 236);
    self.view.backgroundColor = [UIColor colorWithHexString:@"f5f5f5"];
    
    _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_backButton setFrame:CGRectMake(0, 0, 30, 30)];
    [_backButton setImage:[UIImage imageNamed:@"navback"] forState:UIControlStateNormal];
    [_backButton addTarget:self action:@selector(backButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_backButton setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 10)];
    
    self.navigationItem.leftBarButtonItem=nil;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_backButton];
    
    _backButton.hidden = (self.navigationController.viewControllers.count == 1) ? YES : NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - backButtonClicked
- (void)backButtonClicked:(id)sender
{
    LOG_SELF_METHOD;
    [self.navigationController popViewControllerAnimated:YES];
}


@end
