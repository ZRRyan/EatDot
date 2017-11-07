//
//  UIAlertController+Show.m
//  Pati
//
//  Created by Ryan on 2017/6/22.
//  Copyright © 2017年 mew. All rights reserved.
//

#import "UIAlertController+Show.h"

@implementation UIAlertController (Show)

+ (void)showAlertWithTitle: (NSString *)title mess: (NSString *)mess actionTitles: (NSArray *)actionTitles completeHandler: (void(^)(NSInteger actionIndex))completeHandler {
    [UIAlertController showAlertWithTitle:title mess: mess actionTitles:actionTitles completeHandler:^(NSInteger actionIndex) {
        completeHandler(actionIndex);
    }];
}

+ (void)showAlertWithTitle: (NSString *)title actionTitles: (NSArray *)actionTitles completeHandler: (void(^)(NSInteger actionIndex))completeHandler {
    [UIAlertController showAlertWithTitle:title actionTitles:actionTitles completeHandler:^(NSInteger actionIndex) {
        completeHandler(actionIndex);
    }];
}

+ (void)showAlertWithMess: (NSString *)mess actionTitles: (NSArray *)actionTitles completeHandler: (void(^)(NSInteger actionIndex))completeHandler {
    [UIAlertController showAlertWithMess:mess actionTitles:actionTitles completeHandler:^(NSInteger actionIndex) {
        completeHandler(actionIndex);
    }];
}

+ (void)showAlertWithTitle: (NSString *)title mess: (NSString *)mess actionTitles: (NSArray *)actionTitles vc: (UIViewController *)vc completeHandler: (void(^)(NSInteger actionIndex))completeHandler {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:mess preferredStyle:UIAlertControllerStyleAlert];
    for (NSString *actionTitle in actionTitles) {
        NSInteger index = [actionTitles indexOfObject:actionTitle];
        UIAlertAction *action = [UIAlertAction actionWithTitle:actionTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            completeHandler(index);
        }];
        [alertController addAction: action];
    }
    
    [vc presentViewController:alertController animated:YES completion:nil];
}

+ (void)showAlertWithTitle: (NSString *)title actionTitles: (NSArray *)actionTitles vc: (UIViewController *)vc completeHandler: (void(^)(NSInteger actionIndex))completeHandler {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message: @"" preferredStyle:UIAlertControllerStyleAlert];
    for (NSString *actionTitle in actionTitles) {
        NSInteger index = [actionTitles indexOfObject:actionTitle];
        UIAlertAction *action = [UIAlertAction actionWithTitle:actionTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            completeHandler(index);
        }];
        [alertController addAction: action];
    }
    
    [vc presentViewController:alertController animated:YES completion:nil];
}

+ (void)showAlertWithMess: (NSString *)mess actionTitles: (NSArray *)actionTitles vc: (UIViewController *)vc completeHandler: (void(^)(NSInteger actionIndex))completeHandler {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:mess preferredStyle:UIAlertControllerStyleAlert];
    for (NSString *actionTitle in actionTitles) {
        NSInteger index = [actionTitles indexOfObject:actionTitle];
        UIAlertAction *action = [UIAlertAction actionWithTitle:actionTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            completeHandler(index);
        }];
        [alertController addAction: action];
    }
    
    [vc presentViewController:alertController animated:YES completion:nil];
}

@end
