//
//  ClearCachesTool.h
//  FrameDemo
//
//  Created by houjing on 16/7/7.
//  Copyright © 2016年 eresl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClearCachesTool : NSObject

//获取缓存文件路径
+ (NSString *)getCachesPath;

//计算单个文件大小
+(float)fileSizeAtPath:(NSString *)path;

//计算目录大小
+(float)folderSizeAtPath:(NSString *)path;

//清理缓存文件
+(void)clearCache:(NSString *)path withSuccess:(void (^)(CGFloat size))success;

@end
