//
//  UILabel+Extension.m
//  ContractManage
//
//  Created by Ryan on 15/12/31.
//  Copyright © 2015年 monkey. All rights reserved.
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)
+ (instancetype)labelOnView:(UIView *)view
{
    UILabel *label = [[UILabel alloc] init];
    [view addSubview:label];
    return label;
}

+ (instancetype)labelWithText:(NSString *)text fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor View:(UIView *)view
{
    UILabel *label = [[self alloc] init];
    label.text = text;
    label.textColor = textColor;
    label.font = [UIFont systemFontOfSize:fontSize];
    [view addSubview:label];
    return label;
}

+ (instancetype)labelWithFontSize:(CGFloat)fontSize textColor:(UIColor *)textColor View:(UIView *)view
{
    UILabel *label = [[self alloc] init];
    label.textColor = textColor;
    label.font = [UIFont systemFontOfSize:fontSize];
    [view addSubview:label];
    return label;
}

+ (instancetype)labelWithFontSize:(CGFloat)fontSize View:(UIView *)view
{
    UILabel *label = [[self alloc] init];
    label.font = [UIFont systemFontOfSize:fontSize];
    [view addSubview:label];
    return label;
}

+ (instancetype)labelWithText:(NSString *)text fontSize:(CGFloat)fontSize View:(UIView *)view
{
    UILabel *label = [[self alloc] init];
    label.text = text;
    label.font = [UIFont systemFontOfSize:fontSize];
    [view addSubview:label];
    return label;
}
@end
