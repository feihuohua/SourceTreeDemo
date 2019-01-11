#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "LBXPermission.h"
#import "LBXPermissionCalendar.h"
#import "LBXPermissionCamera.h"
#import "LBXPermissionContacts.h"
#import "LBXPermissionData.h"
#import "LBXPermissionHealth.h"
#import "LBXPermissionLocation.h"
#import "LBXPermissionMicrophone.h"
#import "LBXPermissionPhotos.h"
#import "LBXPermissionReminders.h"
#import "LBXPermissionSetting.h"

FOUNDATION_EXPORT double LBXPermissionVersionNumber;
FOUNDATION_EXPORT const unsigned char LBXPermissionVersionString[];

