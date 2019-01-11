//
//  WHHttpRequest.m
//  CarsMall
//
//  Created by houjing on 2018/8/20.
//  Copyright © 2018年 eresl. All rights reserved.
//

#import "WHHttpRequest.h"

@implementation WHHttpRequest

+ (void)GET:(NSString *)URLString parameters:(id)parameters isToken:(BOOL )isToken success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure{
    
    NSString *url = [NSString stringWithFormat:@"%@/%@",HBYZWebURL,URLString];
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [manager.requestSerializer setValue:@"application/json;charset=utf-8;" forHTTPHeaderField:@"Content-Type"];
    if (isToken) {
        UserModel *userModel = [UserModel readUserInfo];
        if (!NULLString(userModel.token)) {
            [manager.requestSerializer setValue:userModel.token forHTTPHeaderField:@"X-AUTH-TOKEN"];
        }
    }
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", nil];//设置相应内容类型
    
    [manager GET:url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure) {
            failure(error);
        }
    }];
}

+(void)Post:(NSString *)URLString parameters:(id)parameters isToken:(BOOL )isToken success:(void (^)(id))success failure:(void (^)(NSError *error))failure
{
    
    NSString *url = [NSString stringWithFormat:@"%@/%@",HBYZWebURL,URLString];
    
    //创建请求管理者
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [manager.requestSerializer setValue:@"application/json;charset=utf-8;" forHTTPHeaderField:@"Content-Type"];
    if (isToken) {
        UserModel *userModel = [UserModel readUserInfo];
        if (!NULLString(userModel.token)) {
            [manager.requestSerializer setValue:userModel.token forHTTPHeaderField:@"X-AUTH-TOKEN"];
        }
    }
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", @"text/json",@"text/plain",nil];//设置相应内容类型
    
    [manager POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        //LRLog(@"url------%@",url);
        //LRLog(@"parame------%@",parameters);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //LRLog(@"return---%@", responseObject);
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //LRLog(@"------%@",error);
        if (failure) {
            failure(error);
        }
        
    }];
}

@end
