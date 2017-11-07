//
//  ZRHomeVC.h
//  EatDot
//
//  Created by Ryan on 2017/10/21.
//  Copyright © 2017年 Ryan. All rights reserved.
//

#import "ZRBaseVC.h"


typedef enum : NSUInteger {
    ZRPlayVCModeAllTimeLimit,
    ZRPlayVCModeEveryTimeLimit
} ZRPlayVCMode;

@interface ZRPlayVC : ZRBaseVC


/**
 模式
 */
@property (nonatomic, assign) ZRPlayVCMode playMode;

@end
