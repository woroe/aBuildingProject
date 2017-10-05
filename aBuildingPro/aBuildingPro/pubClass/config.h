//
//  config.h
//  Created by hong Li on 2017/10/5.
//  Copyright © 2017年 hong LiaBuilding. All rights reserved.
//
#ifndef config_h
#define config_h
// Documents目录路径
#define PATH_DOCUMENT           [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
#define SCREEN_WIDTH            [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT           [[UIScreen mainScreen] bounds].size.height    //屏幕高度
#define WS(weakSelf)  			__weak __typeof(&*self)weakSelf = self;

#define DBName                  @"LHApple.db"
#define RGBCOLOR(r,g,b)         [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:1.f]

#define RandNumber              arc4random_uniform(256)/255.0                                               //随机数
#define RandomColor             [UIColor colorWithRed:RandNumber green:RandNumber blue:RandNumber alpha:1.0]//随机色
#define IsIOS7Later             ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)               //是否iOS7或以上
#define FourInch                ([UIScreen mainScreen].bounds.size.height==568.0)                           //是否为4英寸
#define IS_IPAD                 (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)                      //是否是iPad

//使用NSLocalizedString(@"key", nil)获取国际化内容的话，文件名必须是：Localizable.strings，
//如果是其他名称的，就只能用NSLocalizedStringFromTable(@"key",@"你的国际化文件名", nil)。
#define BuildString(str)		NSLocalizedStringFromTable(str,@"myLanguage",nil)

#endif /* config_h */
