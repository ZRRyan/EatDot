//
//  UILabel+Extension.h
//  ContractManage
//
//  Created by Ryan on 15/12/31.
//  Copyright © 2015年 monkey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Extension)
+ (instancetype)labelOnView:(UIView *)view;

+ (instancetype)labelWithText:(NSString *)text fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor View:(UIView *)view;

+ (instancetype)labelWithFontSize:(CGFloat)fontSize textColor:(UIColor *)textColor View:(UIView *)view;

+ (instancetype)labelWithFontSize:(CGFloat)fontSize View:(UIView *)view;

+ (instancetype)labelWithText:(NSString *)text fontSize:(CGFloat)fontSize View:(UIView *)view;
@end
