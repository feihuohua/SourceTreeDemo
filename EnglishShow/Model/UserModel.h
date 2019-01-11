//
//  UserModel.h
//  CarsMall
//
//  Created by houjing on 2018/8/23.
//  Copyright © 2018年 eresl. All rights reserved.
//

#import <Foundation/Foundation.h>
@class User;

@interface UserModel : NSObject

@property (nonatomic, copy) NSString *token;
@property (nonatomic, strong) User *user;

@property (nonatomic, assign) BOOL isLogin;
@property (nonatomic, assign) BOOL isRemenber;

+(void)saveUserInfo:(UserModel *)model;
+(UserModel *)readUserInfo;

@end

@interface User : NSObject

@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *mobilePhone;
@property (nonatomic, copy) NSString *portrait;
@property (nonatomic, copy) NSString *realName;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, strong) NSNumber *userType;
@property (nonatomic, strong) NSNumber *total_integral;
@property (nonatomic, copy) NSString *sex;

@end


