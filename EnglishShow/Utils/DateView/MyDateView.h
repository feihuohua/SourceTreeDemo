//
//  MyDateView.h
//  Up
//
//  Created by houjing on 17/4/7.
//  Copyright © 2017年 李祥. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, UIDateViewMode) {
    UIDateViewModeAll,
    UIDateViewModeBefore,
    UIDateViewModeFuture,
};

typedef void(^DateBlock)(NSString *dateStr, NSDate *date);
typedef void(^DateCancle)(void);

@interface MyDateView : UIView

@property (nonatomic, assign) UIDateViewMode dateViewMode;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, copy) DateBlock dateBlock;
@property (copy,nonatomic) DateCancle cancelBlock;

@end
