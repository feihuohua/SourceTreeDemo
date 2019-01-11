//
//  BaseCollectionViewCell.m
//  RealEstate
//
//  Created by apple on 15/8/10.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "BaseCollectionViewCell.h"

@implementation BaseCollectionViewCell


+ (NSString *)cellReuseIdentifier {
    return NSStringFromClass([self class]);
}


- (void)updateWithCellData:(id)data {
    
}

@end
