//
//  CMMacro.h
//  ContractManage
//
//  Created by Ryan on 15/12/31.
//  Copyright © 2015年 monkey. All rights reserved.
//



#ifdef __OBJC__


#ifdef DEBUG  // 调试阶段

#define ZRLog(...) NSLog(__VA_ARGS__)

#else  // 发布阶段

#define ZRLog(...)

#endif  /* DEBUG */

// 不是debug环境让nslog失去作用
#if (!defined(DEBUG))
#define NSLog(...)
#endif


#define ZRStr(...) [NSString stringWithFormat:__VA_ARGS__]

// 判断当前版本是7.0及其以上
#define VPiOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)

// RGB颜色
#define ZRColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define ZRAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha: (a)]

// rect
#define ZRCGM(x, y, w, h) CGRectMake((x), (y), (w), (h))

// 屏幕宽高
#define APPW [UIScreen mainScreen].bounds.size.width
#define APPH [UIScreen mainScreen].bounds.size.heigh
#define NORMALMARGIN 15.0f



#define JKRed [UIColor colorWithRed:219/255.0 green:54/255.0 blue:54/255.0 alpha:1]
#define JKGray [UIColor colorWithRed:228/255.0 green:229/255.0 blue:230/255.0 alpha:1]


#define JMPUSHNotification @"JMPUSHNotification"


#endif  /* __OBJC__ */

