//
//  ZROperationView.m
//  EatDot
//
//  Created by Ryan on 2017/10/21.
//  Copyright © 2017年 Ryan. All rights reserved.
//

#import "ZROperationView.h"
#import "ZRCycleProgressView.h"

@interface ZROperationView ()

@property (nonatomic, weak) UIButton *leftBtn;
@property (nonatomic, weak) UIButton *rightBtn;
@property (nonatomic, weak) UIButton *upBtn;
@property (nonatomic, weak) UIButton *downBtn;
@property (nonatomic, weak) UIButton *startBtn;

@property (nonatomic, weak) ZRCycleProgressView *cycleProgressView;
@end

@implementation ZROperationView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
     
        [self setupUI];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat itemW = self.frame.size.width;
    CGFloat itemH = self.frame.size.height;
    
    CGFloat btnW = itemW / 3;
    CGFloat btnH = itemH / 3;
    
    self.leftBtn.frame = CGRectMake(0, btnH, btnW, btnH);
    self.upBtn.frame = CGRectMake(btnW, 0, btnW, btnH);
    self.downBtn.frame = CGRectMake(btnW, btnH * 2, btnW, btnH);
    self.rightBtn.frame = CGRectMake(btnW * 2, btnH, btnW, btnH);
    
    CGFloat radius = itemW / 4;
    CGFloat startW = (radius - 4) * 2;
    self.cycleProgressView.frame = CGRectMake(itemW / 2 - radius, itemH / 2 - radius, radius * 2, radius * 2);
    self.startBtn.frame = CGRectMake(4, 4, startW, startW);
    self.cycleProgressView.layer.cornerRadius = radius;
    self.startBtn.layer.cornerRadius = startW / 2;
}


- (void)setupUI {
    UIButton *leftBtn = [[UIButton alloc] init];
    [leftBtn setTitle:@"LEFT" forState:UIControlStateNormal];
    leftBtn.backgroundColor = [UIColor blackColor];
    leftBtn.tag = 0;
    [leftBtn addTarget:self action:@selector(directionBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:leftBtn];
    self.leftBtn = leftBtn;
    
    UIButton *rightBtn = [[UIButton alloc] init];
    [rightBtn setTitle:@"RIGHT" forState:UIControlStateNormal];
    rightBtn.backgroundColor = [UIColor blackColor];
    rightBtn.tag = 1;
    [rightBtn addTarget:self action:@selector(directionBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:rightBtn];
    self.rightBtn = rightBtn;
    
    UIButton *upBtn = [[UIButton alloc] init];
    [upBtn setTitle:@"UP" forState:UIControlStateNormal];
    upBtn.backgroundColor = [UIColor blackColor];
    upBtn.tag = 2;
    [upBtn addTarget:self action:@selector(directionBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:upBtn];
    self.upBtn = upBtn;
    
    UIButton *downBtn = [[UIButton alloc] init];
    [downBtn setTitle:@"DOWN" forState:UIControlStateNormal];
    downBtn.backgroundColor = [UIColor blackColor];
    downBtn.tag = 3;
    [downBtn addTarget:self action:@selector(directionBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:downBtn];
    self.downBtn = downBtn;

    ZRCycleProgressView *cycleProgressView = [[ZRCycleProgressView alloc] init];
    cycleProgressView.layer.masksToBounds = YES;
    [self addSubview:cycleProgressView];
    self.cycleProgressView = cycleProgressView;
    
    UIButton *startBtn = [[UIButton alloc] init];
    [startBtn setTitle:@"START" forState:UIControlStateNormal];
    startBtn.backgroundColor = [UIColor blackColor];
    [startBtn addTarget:self action:@selector(startBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [cycleProgressView addSubview:startBtn];
    self.startBtn = startBtn;
}

- (void)directionBtnClick: (UIButton *)sender {
    
    if (!self.isStartStatus) {
        return;
    }
    
    switch (sender.tag) {
        case 0:
            self.operationViewDirection = ZROperationViewDirectionLeft;
            break;
        case 1:
            self.operationViewDirection = ZROperationViewDirectionRight;
            break;
        case 2:
            self.operationViewDirection = ZROperationViewDirectionUp;
            break;
        case 3:
            self.operationViewDirection = ZROperationViewDirectionDown;
            break;
        default:
            break;
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(operationView:direction:)]) {
        [self.delegate operationView:self direction:self.operationViewDirection];
    }
}


- (void)startBtnClick: (UIButton *)sender {
    
    if (self.isStartStatus) {
        return;
    }
    
    self.isStartStatus = !self.isStartStatus;
    
    self.times = 0;
    if (self.delegate && [self.delegate respondsToSelector:@selector(operationViewDidStart:)]) {
        [self.delegate operationViewDidStart:self];
    }
}


- (void)setupTitle: (NSString *)title isStop: (BOOL)isStop {
    
    if (isStop) {
        [self.startBtn setTitle:@"START" forState: UIControlStateNormal];
        self.isStartStatus = NO;
    } else {
        [self.startBtn setTitle: title forState: UIControlStateNormal];
    }
    
}

- (void)setIsStartStatus:(BOOL)isStartStatus {
    _isStartStatus = isStartStatus;
    NSString *title = self.isStartStatus ? @"0" : @"START";
    [self.startBtn setTitle:title forState:UIControlStateNormal];
}

- (void)setupProgress: (CGFloat)progress {
    self.cycleProgressView.progress = progress;
    
}

@end
