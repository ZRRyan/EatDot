//
//  ZROperationView.h
//  EatDot
//
//  Created by Ryan on 2017/10/21.
//  Copyright © 2017年 Ryan. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum : NSUInteger {
    ZROperationViewDirectionUp,
    ZROperationViewDirectionRight,
    ZROperationViewDirectionLeft,
    ZROperationViewDirectionDown
} ZROperationViewDirection;

@class ZROperationView;

@protocol ZROperationViewDelegate<NSObject>

@optional
- (void)operationView: (ZROperationView *)operationView direction: (ZROperationViewDirection)direction;
- (void)operationViewDidStart: (ZROperationView *)operationView;
@end

@interface ZROperationView : UIView

/**
 是否是开启状态
 */
@property (nonatomic, assign) BOOL isStartStatus;


/**
 次数
 */
@property (nonatomic, assign) NSInteger times;

@property (nonatomic, assign) ZROperationViewDirection operationViewDirection;

@property (nonatomic, weak) id<ZROperationViewDelegate> delegate;

- (void)setupTitle: (NSString *)title isStop: (BOOL)isStop;

- (void)setupProgress: (CGFloat)progress;

@end
