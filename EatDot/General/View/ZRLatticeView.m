//
//  ZRLatticeView.m
//  EatDot
//
//  Created by Ryan on 2017/10/21.
//  Copyright © 2017年 Ryan. All rights reserved.
//

#import "ZRLatticeView.h"

@interface ZRLatticeView()
@property (nonatomic, weak) UIView *dotPoint;
@property (nonatomic, weak) UIView *eatPoint;
@end

@implementation ZRLatticeView


#define radius 10
#define eatRadius 15

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        self.userInteractionEnabled = NO;
        
        self.dotX = 0;
        self.dotY = 0;
        self.eatX = 2;
        self.eatY = 2;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self setupDotWithX:self.dotX y:self.dotY];
    [self setupEatWithX:self.eatX y:self.eatY];
}



- (void)drawRect:(CGRect)rect  {
    for (CALayer *layer in self.layer.sublayers) {
        [layer removeFromSuperlayer];
    }

    CGFloat itemW = self.frame.size.width / (maxColunm + 1);
    CGFloat itemH = self.frame.size.height / (maxColunm + 1);

    UIBezierPath *path = [UIBezierPath bezierPath];
    for (int i = 0; i < maxColunm; i ++) {
        for (int j = 0; j < maxColunm; j ++) {
            CGPoint point = CGPointMake(itemW * (i + 1), itemH * (j + 1));

            [path moveToPoint: point];
            [path addLineToPoint: point];
        }
    }
    path.lineWidth = radius * 2;
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinBevel;
    [[UIColor grayColor] set];
    [path stroke];
    
    [self setupUI];
}

- (void)setupUI {
    UIView *dotPoint = [[UIView alloc] init];
    dotPoint.layer.cornerRadius = radius * 2;
    dotPoint.layer.masksToBounds = YES;
    dotPoint.backgroundColor = [UIColor blueColor];
    dotPoint.layer.borderWidth = radius;
    dotPoint.layer.borderColor = [UIColor blackColor].CGColor;
    [self addSubview:dotPoint];
    self.dotPoint = dotPoint;
    
    
    UIView *eatPoint = [[UIView alloc] init];
    eatPoint.layer.cornerRadius = eatRadius;
    eatPoint.layer.masksToBounds = YES;
    eatPoint.backgroundColor = [UIColor whiteColor];
    [self addSubview:eatPoint];
    self.eatPoint = eatPoint;
}


- (void)setupDotWithX: (NSInteger)x y: (CGFloat)y {
    self.dotX = x;
    self.dotY = y;
    
    CGFloat itemW = self.frame.size.width / (maxColunm + 1);
    CGFloat itemH = self.frame.size.height / (maxColunm + 1);
                                              
    [UIView animateWithDuration:0.1 animations:^{
        self.dotPoint.layer.borderColor = [UIColor blueColor].CGColor;
        self.dotPoint.frame = CGRectMake(itemW * (x + 1) - radius * 2, itemH * (y + 1) - radius * 2, radius * 4, radius * 4);
    } completion:^(BOOL finished) {
         self.dotPoint.layer.borderColor = [UIColor blackColor].CGColor;
        
        [UIView animateWithDuration:0.3 animations:^{
            self.dotPoint.layer.borderColor = [UIColor blueColor].CGColor;
        } completion:^(BOOL finished) {
            self.dotPoint.layer.borderColor = [UIColor blackColor].CGColor;
        }];
    }];
}

- (void)setupEatWithX: (NSInteger)x y: (CGFloat)y {
    self.eatX = x;
    self.eatY = y;
    
    CGFloat itemW = self.frame.size.width / (maxColunm + 1);
    CGFloat itemH = self.frame.size.height / (maxColunm + 1);
    
    [UIView animateWithDuration:0.1 animations:^{
        self.eatPoint.frame = CGRectMake(itemW * (x + 1) - eatRadius, itemH * (y + 1) - eatRadius, eatRadius * 2, eatRadius * 2);
    }];
//    self.eatPoint.frame = CGRectMake(itemW * (x + 1) - eatRadius, itemH * (y + 1) - eatRadius, eatRadius * 2, eatRadius * 2);
}

@end
