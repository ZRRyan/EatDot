//
//  ZRLatticeView.h
//  EatDot
//
//  Created by Ryan on 2017/10/21.
//  Copyright © 2017年 Ryan. All rights reserved.
//

#import <UIKit/UIKit.h>

#define maxColunm 5


@interface ZRLatticeView : UIView

@property (nonatomic, assign) NSInteger dotX;
@property (nonatomic, assign) NSInteger dotY;
@property (nonatomic, assign) NSInteger eatX;
@property (nonatomic, assign) NSInteger eatY;

- (void)setupDotWithX: (NSInteger)x y: (CGFloat)y;

- (void)setupEatWithX: (NSInteger)x y: (CGFloat)y;

@end
