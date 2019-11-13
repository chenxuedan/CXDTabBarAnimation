//
//  CXDHeaderMacro.h
//  FireEyesAssistant
//
//  Created by xiao zude on 2019/6/13.
//  Copyright © 2019 zxycloud. All rights reserved.
//

#ifndef CXDHeaderMacro_h
#define CXDHeaderMacro_h


/*
 1火警 2预警 3启动 4监管 5反馈 6故障 7屏蔽 96离线 99正常
*/
//正常 88b04b
#define ZXYNormalColor RGB(136, 176, 75)
//异常  故障 屏蔽 f7be35
#define ZXYPlaceAbnormalColor RGB(247,190,53)
//离线 999999
#define ZXYOfflineColor RGB(153,153,153)
//事件（#35b5f7）
#define ZXYEventColor RGB(53,181,247)
//预警 ef7133
#define ZXYEarlyAlarmColor RGB(239, 113, 51)
//火警  启动 监管 反馈   ed4848
#define ZXYFireAlarmColor RGB(237, 72, 72)

//浅蓝色 圆角视图阴影颜色   201, 229, 244
#define ZXYRadiusShadowColor [UIColor colorWithHexString:@"#c9e5f4"]
//蓝色  item分项颜色          35b5f7    ef7133
#define ZXYBlueLineColor RGB(53,181,247)

//场所标题   4f4f57  场所列表一级标题色
#define ZXYPlaceTitleColor RGB(79,79,87)
//背景色  淡蓝色        f8fdfd
#define ZXYListBackgroungColor RGB(248,253,253)


//主题色 ef7133
#define CXDThemeColor RGB(239,113,51)

//标题色
#define CXDTitleColor RGB(60,60,67)
//333333
#define CXDTextColor RGB(21,21,21)
//666666
#define CXDContentColor RGB(102,102,102)
// 999999
#define CXDDetailColor RGB(153,153,153)
// cccccc
#define CXDCCCGrayColor RGB(204,204,204)
//dddddd
#define CXDHomeLineColor RGB(221,221,221)
//f0f0f0
#define CXDGrayLineColor RGB(240,240,240)
//浅灰色分割线颜色   d8d8d8
#define CXDLightGrayColor RGB(216,216,216)

#define CXDLargeTitleFont [UIFont systemFontOfSize:22.f]

#define ZXYNavTitleFont 20
#define ZXYTitleFontSize 18
#define ZXYContentFontSize 17
#define ZXYDetailFontSize 16
#define ZXYTextFontSize 15


#define CXDTitleFont [UIFont systemFontOfSize:18]
#define CXDContentFont [UIFont systemFontOfSize:16]
#define CXDDetailFont [UIFont systemFontOfSize:15]

//#define CXDFont(x) [UIFont systemFontOfSize:x]

#define CXDPadding 20
#define CXDSpace 15


#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

//----------------------------获取设备大小------------------------------
// NavBar高度
#define CXDNavigationBarHeight (self.navigationController.navigationBar.height)
// 状态栏高度
#define CXDStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
// 顶部高度     (iPhoneXLater ? 88 : 64)   (CXDNavigationBarHeight + CXDStatusBarHeight)
#define CXDTopHeight ((iPhoneXLater) ? 88 : 64)


// 底部 TabBar 高度     (iPhoneXLater ? 83 : 49)   (self.tabBarController.tabBar.height)
#define CXDTabBarHeight ((iPhoneXLater) ? 83 : 49)

// 动态获取屏幕宽高
#define kScreenHeight ([UIScreen mainScreen].bounds.size.height)
#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)

#define CXDButtonHeight 49


#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
//传入RGB三个参数，得到颜色
#define RGB(r,g,b) RGBA(r,g,b,1.f)
//取得随机颜色
#define RandomColor RGB(arc4random()%256,arc4random()%256,arc4random()%256)

//debug下打印， release下不打印
#ifndef __OPTIMIZE__
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...) {}
#endif


#define CXD_APPDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)

//适配大小
//根据ip6的屏幕来拉伸
#define CXDScaleW(width) ((width)*(kScreenWidth/375.0f))
#define CXDScaleH(height)  (height)*(kScreenHeight/667.0f)
#define CXDFontScale(R) [UIFont systemFontOfSize:(R)*(kScreenWidth)/375.0f]

#define CXDFont(R) [UIFont systemFontOfSize:(R)]

//设置字体
#define CXDSetFont(fontName, font) [UIFont fontWithName:(fontName) size:(font)]

//懒加载
#define CXD_LAZY(object, assignment) (object = object ?: assignment)

//----------------------------是否开启打印------------------------------
/**
 *  是否开启自定义打印
 *    1.开启 0.关闭
 */
#define isShowLog 1
#if isShowLog
#define CXDLog(Format, ...) fprintf(stderr,"%s: %s->%d\n%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __FUNCTION__, __LINE__, [[NSString stringWithFormat:Format, ##__VA_ARGS__] UTF8String])
#else
#define CXDLog(Format, ...)
#endif

#define iPhoneXLater ([UIScreen mainScreen].bounds.size.height >= 812) ? YES : NO

#define iPhoneX ([UIScreen mainScreen].bounds.size.height == 812) ? YES : NO

#define iPHone6Plus ([UIScreen mainScreen].bounds.size.height == 736) ? YES : NO

#define iPHone6 ([UIScreen mainScreen].bounds.size.height == 667) ? YES : NO

#define iPHone5 ([UIScreen mainScreen].bounds.size.height == 568) ? YES : NO

#define iPHone4 ([UIScreen mainScreen].bounds.size.height == 480) ? YES : NO

#define iPhone7Later ([UIScreen mainScreen].bounds.size.height >= 667) ? YES : NO

#define iPhone7PlusLater ([UIScreen mainScreen].bounds.size.height >= 736) ? YES : NO

#define iOS7  [[UIDevice currentDevice] systemVersion].floatValue >= 7.0f
#define iOS8  [[UIDevice currentDevice] systemVersion].floatValue >= 8.0f
#define iOS9  [[UIDevice currentDevice] systemVersion].floatValue >= 9.0f
#define iOS11 [[UIDevice currentDevice] systemVersion].floatValue >= 11.0f

#endif /* CXDHeaderMacro_h */
