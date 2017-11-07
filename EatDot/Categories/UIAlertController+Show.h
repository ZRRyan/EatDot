//
//  UIAlertController+Show.h
//  Pati
//
//  Created by Ryan on 2017/6/22.
//  Copyright © 2017年 mew. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (Show)

+ (void)showAlertWithTitle: (NSString *)title mess: (NSString *)mess actionTitles: (NSArray *)actionTitles completeHandler: (void(^)(NSInteger actionIndex))completeHandler;

+ (void)showAlertWithTitle: (NSString *)title actionTitles: (NSArray *)actionTitles completeHandler: (void(^)(NSInteger actionIndex))completeHandler;

+ (void)showAlertWithMess: (NSString *)mess actionTitles: (NSArray *)actionTitles completeHandler: (void(^)(NSInteger actionIndex))completeHandler;


+ (void)showAlertWithTitle: (NSString *)title mess: (NSString *)mess actionTitles: (NSArray *)actionTitles vc: (UIViewController *)vc completeHandler: (void(^)(NSInteger actionIndex))completeHandler;

+ (void)showAlertWithTitle: (NSString *)title actionTitles: (NSArray *)actionTitles vc: (UIViewController *)vc completeHandler: (void(^)(NSInteger actionIndex))completeHandler;

+ (void)showAlertWithMess: (NSString *)mess actionTitles: (NSArray *)actionTitles vc: (UIViewController *)vc completeHandler: (void(^)(NSInteger actionIndex))completeHandler;

@end
