//
//  UserModel.m
//  CarsMall
//
//  Created by houjing on 2018/8/23.
//  Copyright © 2018年 eresl. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

MJCodingImplementation;

/* 实现该方法，说明数组中存储的模型数据类型 */
+ (NSDictionary *)mj_objectClassInArray{
    return @{@"user" : @"User"};
}

+(void)saveUserInfo:(UserModel *)model{
    //1.获取文件路径
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath = [docPath stringByAppendingPathComponent:@"user.plist"];
    //NSLog(@"filePath=%@",filePath);
    [NSKeyedArchiver archiveRootObject:model toFile:filePath];
}

+(UserModel *)readUserInfo{
    //1.获取文件路径
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath = [docPath stringByAppendingPathComponent:@"user.plist"];
    
    UserModel *model = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    
    return model;
}

@end

@implementation User

MJCodingImplementation;

/* 设置模型属性名和字典key之间的映射关系 */
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{@"userId" : @"id"};
}

@end
