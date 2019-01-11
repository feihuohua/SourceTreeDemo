//
//  WHEmptyView.h
//  TradeClub
//
//  Created by houjing on 2018/3/1.
//  Copyright © 2018年 eresl. All rights reserved.
//

#import "LYEmptyView.h"

@interface WHEmptyView : LYEmptyView

+ (instancetype)diyEmptyView;

+ (instancetype)diyEmptyActionViewWithTarget:(id)target action:(SEL)action;

+ (instancetype)diyEmptyActionViewWithImageName:(NSString *)imageName title:(NSString *)title;

+ (instancetype)diyEmptyActionViewWithImageName:(NSString *)imageName title:(NSString *)title btnTitleStr:(NSString *)btnTitleStr target:(id)target action:(SEL)action;

@end
