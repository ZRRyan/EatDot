//
//  UIButton+Extension.m
//  ContractManage
//
//  Created by Ryan on 15/12/31.
//  Copyright © 2015年 monkey. All rights reserved.
//

#import "UIButton+Extension.h"

@implementation UIButton (Extension)

+ (instancetype)buttonOnView:(UIView *)view
{
    UIButton *button = [[self alloc] init];
    [view addSubview:button];
    return button;
}

+ (instancetype)buttonWithText:(NSString *)text View:(UIView *)view
{
    UIButton *button = [[self alloc] init];
    [button setTitle:text forState:UIControlStateNormal];
    button.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [view addSubview:button];
    return button;
}

+ (instancetype)buttonWithImageName:(NSString *)imageName View:(UIView *)view
{
    UIButton *button = [[self alloc] init];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    button.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [view addSubview:button];
    return button;
}

+ (instancetype)buttonWithText:(NSString *)text imageName:(NSString *)imageName View:(UIView *)view
{
    UIButton *button = [[self alloc] init];
    [button setTitle:text forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    button.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [view addSubview:button];
    return button;
}
@end
