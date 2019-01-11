//
//  BaseTVC.m
//  TradeClub
//
//  Created by houjing on 2018/1/11.
//  Copyright © 2018年 eresl. All rights reserved.
//

#import "BaseTVC.h"

@implementation BaseTVC

- (void)setFrame:(CGRect)frame
{
    CGRect rc = CGRectMake(frame.origin.x + self.cellEdge, frame.origin.y, frame.size.width - self.cellEdge * 2, frame.size.height);
    [super setFrame:rc];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (NSString *)cellReuseIdentifier {
    return NSStringFromClass([self class]);
}


- (void)updateWithCellData:(id)data {
    
}

@end
