//
//  WHEmptyView.m
//  TradeClub
//
//  Created by houjing on 2018/3/1.
//  Copyright © 2018年 eresl. All rights reserved.
//

#import "WHEmptyView.h"

@implementation WHEmptyView

+ (instancetype)diyEmptyView{
    
    return [self emptyViewWithImageStr:@"noData" titleStr:@"暂无数据" detailStr:@"请稍后再试!"];
}

+ (instancetype)diyEmptyActionViewWithImageName:(NSString *)imageName title:(NSString *)title{
    return [self emptyViewWithImageStr:imageName titleStr:title detailStr:nil];
}

+ (instancetype)diyEmptyActionViewWithTarget:(id)target action:(SEL)action{
    
    return [self emptyActionViewWithImageStr:@"noNetwork" titleStr:@"无网络连接" detailStr:@"请检查你的网络连接是否正确!" btnTitleStr:@"重新加载" target:target action:action];
}

+ (instancetype)diyEmptyActionViewWithImageName:(NSString *)imageName title:(NSString *)title btnTitleStr:(NSString *)btnTitleStr target:(id)target action:(SEL)action{
    
    return [self emptyActionViewWithImageStr:imageName titleStr:title detailStr:nil btnTitleStr:btnTitleStr target:target action:action];
}

- (void)prepare{
    [super prepare];
    
    self.autoShowEmptyView = NO;
    
}

@end
