//
//  UIButton+Extension.h
//  ContractManage
//
//  Created by Ryan on 15/12/31.
//  Copyright © 2015年 monkey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extension)

+ (instancetype)buttonOnView:(UIView *)view;

+ (instancetype)buttonWithText:(NSString *)text View:(UIView *)view;

+ (instancetype)buttonWithImageName:(NSString *)imageName View:(UIView *)view;

+ (instancetype)buttonWithText:(NSString *)text imageName:(NSString *)imageName View:(UIView *)view;
@end
