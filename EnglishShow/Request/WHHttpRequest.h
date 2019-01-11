//
//  WHHttpRequest.h
//  CarsMall
//
//  Created by houjing on 2018/8/20.
//  Copyright © 2018年 eresl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WHHttpRequest : NSObject

/**
 *  发送get请求
 *
 *  @param URLString  请求的基本的url
 *  @param parameters 请求的参数字典
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+ (void)GET:(NSString *)URLString parameters:(id)parameters isToken:(BOOL )isToken success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 *  发送post请求
 *
 *  @param URLString  请求的基本的url
 *  @param parameters 请求的参数字典
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+(void)Post:(NSString *)URLString parameters:(id)parameters isToken:(BOOL )isToken success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

@end
