//
//  BaseCollectionViewCell.h
//  RealEstate
//
//  Created by apple on 15/8/10.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCollectionViewCell : UICollectionViewCell

/**
 *  功能:获取cell的唯一标识符
 */
+ (NSString *)cellReuseIdentifier;

/**
 *	功能:cell根据数据显示ui
 */
- (void)updateWithCellData:(id)data;

@end
