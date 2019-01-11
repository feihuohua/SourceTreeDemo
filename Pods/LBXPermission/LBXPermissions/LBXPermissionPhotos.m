//
//  LBXPermissionPhotos.m
//  LBXKits
//
//  Created by lbxia on 2017/9/10.
//  Copyright © 2017年 lbx. All rights reserved.
//

#import "LBXPermissionPhotos.h"
#import <Photos/Photos.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>

@implementation LBXPermissionPhotos

+ (BOOL)authorized
{
    return [self authorizationStatus] == 3;
}


/**
 photo permission status

 @return
 0 :NotDetermined
 1 :Restricted
 2 :Denied
 3 :Authorized
 */
+ (NSInteger)authorizationStatus
{
    if (@available(iOS 8,*))
    {
        return  [PHPhotoLibrary authorizationStatus];
    }
    else
    {
        return  [ALAssetsLibrary authorizationStatus];
    }
}

+ (void)authorizeWithCompletion:(void(^)(BOOL granted,BOOL firstTime))completion
{
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    
    switch (status) {
        case PHAuthorizationStatusAuthorized:
        {
            if (completion) {
                completion(YES,NO);
            }
        }
            break;
        case PHAuthorizationStatusRestricted:
        case PHAuthorizationStatusDenied:
        {
            if (completion) {
                completion(NO,NO);
            }
        }
            break;
        case PHAuthorizationStatusNotDetermined:
        {
            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
                if (completion) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        completion(status == PHAuthorizationStatusAuthorized,YES);
                    });
                }
            }];
        }
            break;
        default:
        {
            if (completion) {
                completion(NO,NO);
            }
        }
            break;
    }
}







@end
