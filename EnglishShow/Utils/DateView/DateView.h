//
//  DateView.h
//  Up
//
//  Created by houjing on 17/4/7.
//  Copyright © 2017年 李祥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DateView : UIView

@property (weak, nonatomic) IBOutlet UILabel *titleLB;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UIButton *confirmBtn;
@end
