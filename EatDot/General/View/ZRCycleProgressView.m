//
//  ZRCycleProgressView.m
//  EatDot
//
//  Created by Ryan on 2017/10/23.
//  Copyright © 2017年 Ryan. All rights reserved.
//

#import "ZRCycleProgressView.h"

@interface ZRCycleProgressView()



@end


@implementation ZRCycleProgressView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.progress = 0;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    CGPoint center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    CGFloat radius = self.frame.size.width / 2;
    CGFloat startA = - M_PI_2;  //设置进度条起点位置
    CGFloat endA = -M_PI_2 + M_PI * 2 * self.progress;  //设置进度条终点位置
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    [[UIColor clearColor] setFill];
    [[UIColor blueColor] setStroke];
    
    path.lineWidth = 8;
    [path stroke];
}

- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    [self setNeedsDisplay];
    
}

@end
