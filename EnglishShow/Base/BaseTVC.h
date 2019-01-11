//
//  BaseTVC.h
//  TradeClub
//
//  Created by houjing on 2018/1/11.
//  Copyright © 2018年 eresl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTVC : UITableViewCell

@property (nonatomic, assign) CGFloat cellEdge;

/**
 *  功能:获取cell的唯一标识符
 */
+ (NSString *)cellReuseIdentifier;

/**
 *    功能:cell根据数据显示ui
 */
- (void)updateWithCellData:(id)data;

@end
