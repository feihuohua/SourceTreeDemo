//
//  MyDateView.m
//  Up
//
//  Created by houjing on 17/4/7.
//  Copyright © 2017年 李祥. All rights reserved.
//

#import "MyDateView.h"
#import "DateView.h"

#define kWinH [[UIScreen mainScreen] bounds].size.height
#define kWinW [[UIScreen mainScreen] bounds].size.width

// pickerView高度
#define kPVH 260

@interface MyDateView ()

@property (strong, nonatomic) UIButton *bgButton;
@property (nonatomic, strong) DateView *dateView;
@property (nonatomic, strong) NSDateFormatter *dateFormatter;

@end

@implementation MyDateView

- (instancetype )init{
    
    if (self = [super initWithFrame:[[UIScreen mainScreen] bounds]]) {
        [[[UIApplication sharedApplication] keyWindow] addSubview:self];
        
        _bgButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_bgButton setFrame:self.bounds];
        _bgButton.backgroundColor = [UIColor blackColor];
        _bgButton.alpha = 0;
        [_bgButton addTarget:self action:@selector(cancelIt) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_bgButton];
        
        _dateView = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([DateView class]) owner:self options:nil].lastObject;
        _dateView.frame = CGRectMake(0, kWinH, kWinW, kPVH);
        
        [_dateView.cancelBtn addTarget:self action:@selector(cancelIt) forControlEvents:UIControlEventTouchUpInside];
        [_dateView.confirmBtn addTarget:self action:@selector(confirmBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_dateView];
        
        [self animationShow];
    }
    
    return self;
}

- (void)setDateViewMode:(UIDateViewMode)dateViewMode{
    _dateViewMode = dateViewMode;
    
    if (_dateViewMode == UIDateViewModeBefore) {
        _dateView.datePicker.maximumDate = [NSDate date];
    }
    else if (_dateViewMode == UIDateViewModeFuture){
        _dateView.datePicker.minimumDate = [NSDate date];
    }
}

-(void)setTitle:(NSString *)title{
    
    _title = title;
    
    self.dateView.titleLB.text = title;
}

#pragma mark -
- (void)confirmBtnClicked{
    
    if (self.dateBlock) {
        
        self.dateBlock([self.dateFormatter stringFromDate:_dateView.datePicker.date], _dateView.datePicker.date);
    }
    
    [self hideView];
}

- (void)cancelIt{
    
    if (self.cancelBlock) {
        self.cancelBlock();
    }
    
    [self hideView];
}

#pragma mark - getter
- (NSDateFormatter *)dateFormatter{
    
    if (_dateFormatter == nil) {
        _dateFormatter = [[NSDateFormatter alloc] init];
        [_dateFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"zh_CN"]];
        [_dateFormatter setDateFormat:@"yyyy-MM-dd"];
    }
    return _dateFormatter;
}

#pragma mark - 显示／隐藏
- (void )animationShow{
    
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.3 animations:^{
        weakSelf.dateView.frame = CGRectMake(0, kWinH-kPVH, kWinW, kPVH);
        weakSelf.bgButton.alpha = 0.2;
    }];
}

- (void )hideView{
    
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.3 animations:^{
        weakSelf.dateView.frame = CGRectMake(0, kWinH, kWinW, kPVH);
        weakSelf.bgButton.alpha = 0.0;
    } completion:^(BOOL finished) {
        [weakSelf.dateView removeFromSuperview];
        [weakSelf.bgButton removeFromSuperview];
        [weakSelf removeFromSuperview];
    }];
}

@end
