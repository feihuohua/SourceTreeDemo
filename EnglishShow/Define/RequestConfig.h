//
//  RequestConfig.h
//  carsMall
//
//  Created by houjing on 2018/8/20.
//  Copyright © 2018年 eresl. All rights reserved.
//

#ifndef RequestConfig_h
#define RequestConfig_h

//----------服务器地址----------
////陈国栋
//#define HBYZIPURL @"http://192.168.2.8:8080"//内网
//#define HBYZFileIPURL @"http://192.168.2.8:8888"//内网文件地址
//#define HBYZHtmlIPURL @"http://192.168.2.223:80"//html的ip
//严凯
//#define HBYZIPURL @"http://192.168.2.102:8080"//内网
//#define HBYZFileIPURL @"http://192.168.2.102:8888"//内网文件地址
//#define HBYZHtmlIPURL @"http://192.168.2.223:80"//html的ip
//#define HBYZIPURL @"http://58.48.186.40:5900"//外网
//#define HBYZFileIPURL @"http://58.48.186.40:5900"//外网文件地址

//外网
#define HBYZIPURL @"http://123.57.10.245:8083"//外网
#define HBYZFileIPURL @"http://123.57.10.245:9091"//外网文件地址
#define HBYZHtmlIPURL @"http://123.57.10.245:9091"//html的ip
#define HBYZWebURL [NSString stringWithFormat:@"%@/yzcar",HBYZIPURL]
#define HBYZWebIMAGEURL(imageUrl) [NSString stringWithFormat:@"%@%@",HBYZFileIPURL,imageUrl]


//-----------------------注册登录相关------------------------
//登录接口
#define Web_LOGIN @"rest/app/v1/tokens/login"

#endif /* RequestConfig_h */
