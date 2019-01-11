//
//  ClearCachesTool.m
//  FrameDemo
//
//  Created by houjing on 16/7/7.
//  Copyright © 2016年 eresl. All rights reserved.
//

#import "ClearCachesTool.h"
#import "SDImageCache.h"

@implementation ClearCachesTool


//获取缓存文件路径
+ (NSString *)getCachesPath{
    
    NSString *identifier = [[NSBundle mainBundle] bundleIdentifier];
    
    // 获取Caches目录路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachesDir = [paths objectAtIndex:0];
    
    //NSString *filePath = [cachesDir stringByAppendingPathComponent:@"com.ereal.FrameDemo"];
    NSString *filePath = [cachesDir stringByAppendingPathComponent:identifier];
    
    return filePath;
}
/*
//计算单个文件大小
+(float)fileSizeAtPath:(NSString *)path{
    NSFileManager *fileManager=[NSFileManager defaultManager];
    if([fileManager fileExistsAtPath:path]){
        long long size=[fileManager attributesOfItemAtPath:path error:nil].fileSize;
        return size/1024.0/1024.0;
    }
    return 0;
}

//计算目录大小
+(float)folderSizeAtPath:(NSString *)path{
    NSFileManager *fileManager=[NSFileManager defaultManager];
    float folderSize;
    if ([fileManager fileExistsAtPath:path]) {
        NSArray *childerFiles=[fileManager subpathsAtPath:path];
        for (NSString *fileName in childerFiles) {
            NSString *absolutePath=[path stringByAppendingPathComponent:fileName];
            folderSize +=[ClearCachesTool fileSizeAtPath:absolutePath];
        }
        //SDWebImage框架自身计算缓存的实现
        folderSize+=[[SDImageCache sharedImageCache] getSize]/1024.0/1024.0;
        return folderSize;
    }
    return 0;
}
 */

///计算缓存文件的大小的M
+(float)fileSizeAtPath:(NSString *)filePath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        //        //取得一个目录下得所有文件名
        //        NSArray *files = [manager subpathsAtPath:filePath];
        //        NSLog(@"files1111111%@ == %ld",files,files.count);
        //
        //        // 从路径中获得完整的文件名（带后缀）
        //        NSString *exe = [filePath lastPathComponent];
        //        NSLog(@"exeexe ====%@",exe);
        //
        //        // 获得文件名（不带后缀）
        //        exe = [exe stringByDeletingPathExtension];
        //
        //        // 获得文件名（不带后缀）
        //        NSString *exestr = [[files objectAtIndex:1] stringByDeletingPathExtension];
        //        NSLog(@"files2222222%@  ==== %@",[files objectAtIndex:1],exestr);
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
}
+(float)folderSizeAtPath:(NSString *)folderPath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:folderPath]) return 0;
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];//从前向后枚举器／／／／//
    NSString* fileName;
    long long folderSize = 0;
    while ((fileName = [childFilesEnumerator nextObject]) != nil){
        NSLog(@"fileName ==== %@",fileName);
        NSString* fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        NSLog(@"fileAbsolutePath ==== %@",fileAbsolutePath);
        folderSize += [self fileSizeAtPath:fileAbsolutePath];
    }
    NSLog(@"folderSize ==== %lld",folderSize);
    return folderSize/(1024.0*1024.0);
}

//清理缓存文件
+(void)clearCache:(NSString *)path withSuccess:(void (^)(CGFloat size))success{
    NSFileManager *fileManager=[NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path]) {
        NSArray *childerFiles=[fileManager subpathsAtPath:path];
        for (NSString *fileName in childerFiles) {
            //如有需要，加入条件，过滤掉不想删除的文件
            NSString *absolutePath=[path stringByAppendingPathComponent:fileName];
            [fileManager removeItemAtPath:absolutePath error:nil];
        }
    }
//#warning 方法失效 3.8.0才有
    [[SDImageCache sharedImageCache] cleanDisk];
    
    success([self folderSizeAtPath:path]);
}

@end
