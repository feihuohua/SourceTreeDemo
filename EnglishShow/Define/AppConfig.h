//
//  AppConfig.h
//  SmartCommunityWuYe
//
//  Created by houjing on 17/11/9.
//  Copyright © 2017年 eresl. All rights reserved.
//

#ifndef AppConfig_h
#define AppConfig_h

#import "RequestConfig.h"

//----------背景色----------
//@"4179f2" 主色
//@"1986dd"
#define kMainHexColorStr  @"f85d00"
#define kMainColor  [UIColor colorWithHexString:kMainHexColorStr]
#define kVCBgColorHex @"eeeeee"
#define kVCBgColor [UIColor colorWithHexString:kVCBgColorHex]
#define kBornerColorHex @"f88743"
#define kBornerColor [UIColor colorWithHexString:kBornerColorHex]
#define kLineBgColor [UIColor colorWithHexString:@"F0F0F0"]
#define kFuncButtonBgColor [UIColor colorWithHexString:kMainHexColorStr]
#define kClearColor [UIColor clearColor]
#define kWhiteColor [UIColor whiteColor]

#define kWordNormalColor [UIColor colorWithHexString:@"333333"] //标准字体颜色
#define kWordWarnColor [UIColor colorWithHexString:@"666666"] //提醒字体颜色

//----------App颜色配置----------
//自定义颜色
#define COLOR_HEX(hex) [UIColor colorWithHexString:hex]
//定义rgb 色值
#define RGB(r,g,b,a)  [ UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define kNavRightColor [UIColor colorWithHexString:@"1986dd"]

//----------安全检测----------
#define kSafeString(str)  [NSString safeString:str]
#define kSafeNumber(num)  [NSNumber safeNumber:num]
#define kSafeArray(array)  [NSArray safeArray:array]

#define kSafeNumberToString(num)  [NSNumber safeNumberToString:num]

//数据库用
#define kSafeStringToNull(str)  [NSString safeStringToNull:str]
#define kSafeNumberToNullString(num)  [NSNumber safeNumberToNullString:num]

//----------字体----------
#define Font(num) [UIFont systemFontOfSize:num]
#define kGetFont(num) [UIFont systemFontOfSize:num]
#define kNavRightFont kGetFont(15)
#define kFuncButtonFont kGetFont(17)





//----------国际化----------
#define ChangeLanguage(text) NSLocalizedString(text, nil)

//加载xib文件
#define LOADXIB(name) [[NSBundle mainBundle]loadNibNamed:name owner:self options:nil][0]



/*----------------------自定义宏-------------------------*/

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
//宽高比(高/宽)（黄金分割比）
#define AspectRatio 0.618

//设备号
#define DEVICESN   [[WWCommonHelper shareInstance] devicesn]

//判断字符串是否为空
#define IsBlank(text) [[WWCommonHelper shareInstance] isBlankString:text]
//提示框
//定义toast提示(屏幕中央)
#define TOAST(text)  [JRToast showWithText:text bottomOffset:320]
//#define TOAST(text) [[MOToast sharedInstance] toast:text]
//加载img
#define IMAGE(text) [UIImage imageNamed:text]

#define NotNeedLaunchView [[NSUserDefaults standardUserDefaults] boolForKey:@"notNeedLaunchView"]

//定义沙盒路径
#define PATH  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0]
#define FILE_PATH(x) [PATH stringByAppendingPathComponent:x]  //路径

//打印输出
#ifdef DEBUG
#define DDLog(format, ...) printf("class: <%p %s:(%d) > method: %s \n%s\n", self, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String] )
#else
#define DDLog(format, ...)
#endif

/*------------------------------------------------------*/





//分享
#define kShareUrl         @"www.baidu.com"
#define kShareTitle       @"湖北一专"
#define kShareContent     @"汽配购物平台"
#define kShareImage       @"mine_dfh"

//友盟分享
#define kUmengAppkey      @"5b86127df43e48527a00021c"
#define kQQAppID          @"1107813910"//@"101493932"
#define kQQAppKey         @"iqAQmhVFt4jwjwYr"//@"7699be2c4e32e25b1cf97eb4f7a83fa2"

//微信 分享
#define kWxAppID          @"wx5c35a27274fe2d59"
#define kWxAppSecret      @"c9f2306440e51f6e91c58064b1371ed8"

//百度地图key
#define kBMAppkey         @""

//环信key
#define kEMAppkey         @"1149180424177661#hongshan"
#define kEM_Cer_Develop       @"develop"
#define kEM_Cer_Distribution       @"distribution"

//极光推送
#define kJpushAppKey      @"4f27e7efd71cb54847b57486"


// 商户PID
#define PARTNER  @"2018072560813272"
// 商户收款账号
#define SELLER  @"2973838660@qq.com"

//----------RSA公钥----------
#define LoginRSAPublicKey @""

#define LoginRSAPrivateKey @""


#endif /* AppConfig_h */
