//
//  AppConst.h
//  SmartCommunityWuYe
//
//  Created by houjing on 17/11/9.
//  Copyright © 2017年 eresl. All rights reserved.
//

#ifndef AppConst_h
#define AppConst_h

//自定义高效率的 NSLog
//项目开发中，我们会在许多地方加上Log，但是发布的时候又不想用这些Log，我们也不可能一个一个的删除，所以自定义Log是必然的！
#ifdef DEBUG
//#define LRLog(...) NSLog(@"%s 第%d行 \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])

#define LRLog(s,...) printf("class: <%p %s:(%d) > method: %s \n%s\n", self, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:(s), ##__VA_ARGS__] UTF8String] )
#else
//#define LRLog(...)
#define LRLog(s,...)

#endif

//selfLog
#define LOG_SELF_METHOD  NSLog(@"<%@> Called:'%@'",self,NSStringFromSelector(_cmd));


//-------------设备------------
//获取系统版本
#define kSystemVersion   ([[UIDevice currentDevice] systemVersion])
//获取系统版本号
#define kDeviceVersion [[UIDevice currentDevice].systemVersion floatValue]
//获取设备型号
#define IphoneType [[WWCommonHelper shareInstance] getIphoneType]
//获取设备uuid
#define IphoneUUID [[WWCommonHelper shareInstance] uuid]
//获取设备devicesn
#define IphoneDeviceSN [[WWCommonHelper shareInstance] devicesn]

//----------屏幕尺寸----------
//#define ç  [UIScreen mainScreen].bounds.size.width
//
//#define kScreenHeight [UIScreen mainScreen].bounds.size.height

//#define kScreenScale  [UIScreen mainScreen].scale

#define kCGFloatFromPixel(value) value/kScreenScale

#define kScaleFromiPhone5Desgin(_X_) (_X_ * (kScreenWidth/320))

#define kScaleFromiPhone6Desgin(_X_) (_X_ * (kScreenWidth/375))


///适配相关
#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height

#define kSystemNavHeight 44.0

#define kNavbarHeight (kStatusBarHeight+kSystemNavHeight)

#define kTabBarHeight (iPhoneX?(49.f+34.f):(49.f))

//-------------尺寸------------
//#define kDevice_Is_iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
//#define kDevice_Is_iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
//#define kDevice_Is_iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

//设备尺寸分类
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

#define kSCREEN_MAX_LENGTH (MAX(kScreenWidth, kScreenHeight))
#define kSCREEN_MIN_LENGTH (MIN(kScreenWidth, kScreenHeight))

#define IS_IPHONE4 (IS_IPHONE && kSCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE5 (IS_IPHONE && kSCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE6 (IS_IPHONE && kSCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE6P (IS_IPHONE && kSCREEN_MAX_LENGTH == 736.0)
#define iPhoneX (kScreenWidth == 375.0f) && (kScreenHeight == 812.0f) && IS_IPHONE


//应用委托
//#ifdef APP_PLATFORM_IPHONE
//#define kAppDelegate ((AppDelegate_iphone *)[UIApplication sharedApplication].delegate)
//#elif APP_PLATFORM_IPAD
//#define kAppDelegate ((AppDelegate_ipad *)[UIApplication sharedApplication].delegate)
//#endif
#define kAppDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)


//Window UserDefaults NotificationCenter
#define kWindow             [[[UIApplication sharedApplication] windows] lastObject]
#define kKeyWindow          [[UIApplication sharedApplication] keyWindow]
#define kUserDefaults       [NSUserDefaults standardUserDefaults]
#define kNotificationCenter [NSNotificationCenter defaultCenter]

//-------------目录------------
#define kDocumentDirectory [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]

//-------------颜色------------
#define RGBA_COLOR(R, G, B, A) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:A]
#define RGB_COLOR(R, G, B) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:1.0f]
#define RGBFromHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//获取图片资源
#define kGetImage(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]


//类型转换
#define StringFromInteger(i) [NSString stringWithFormat:@"%zi",i]
#define StringFromNumber(num) [NSString stringWithFormat:@"%@",num]
#define StringFromCountNum(num) num >= 10000 ? [NSString stringWithFormat:@"%.1f万", num/10000.0] : [NSString stringWithFormat:@"%zi", num]

//字符串安全
//#define kSafeString(__X__)        [__X__ isKindOfClass:[NSNull class]] ? @"" : [NSString stringWithFormat:@"%@", (__X__)]

//判断字符串是否为空
#define NULLString(string) ((![string isKindOfClass:[NSString class]])||[string isEqualToString:@""] || (string == nil) || [string isEqualToString:@""] || [string isEqualToString:@"(null)"] || [string isKindOfClass:[NSNull class]]||[[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0)


//弱引用
#define kWeakSelf(self) @autoreleasepool{} __weak typeof(self) self##Weak = self;
//强引用
#define kStrongSelf(self) @autoreleasepool{} __strong typeof(self##Weak) self = self##Weak;

#define kNibByName(cellName) [UINib nibWithNibName:cellName bundle:[NSBundle mainBundle]]

#define LRViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]


#pragma mark - 简单警告框

/*! view 用 BAKit_ShowAlertWithMsg */
#define BAKit_ShowAlertWithMsg(msg) [[[UIAlertView alloc] initWithTitle:@"温馨提示" message:(msg) delegate:nil cancelButtonTitle:@"确 定" otherButtonTitles:nil] show];

/*! VC 用 BAKit_ShowAlertWithMsg */
#define BAKit_ShowAlertWithMsg_ios8(msg) UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:msg preferredStyle:UIAlertControllerStyleAlert];\


#endif /* AppConst_h */
