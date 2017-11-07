
//
//  ZRHomeVC.m
//  EatDot
//
//  Created by Ryan on 2017/10/21.
//  Copyright © 2017年 Ryan. All rights reserved.
//

#import "ZRPlayVC.h"
#import "ZRLatticeView.h"
#import "ZROperationView.h"

@interface ZRPlayVC () <ZROperationViewDelegate>
@property (nonatomic, weak) ZRLatticeView *latticeView;
@property (nonatomic, weak) ZROperationView *operationView;

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSInteger timeIndex;
@property (nonatomic, assign) NSInteger timeMaxIndex;
@end

@implementation ZRPlayVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    ZRLatticeView *latticeView = [[ZRLatticeView alloc] init];
    latticeView.backgroundColor = [UIColor blackColor];
    latticeView.layer.cornerRadius = 10;
    latticeView.layer.masksToBounds = YES;
    [self.view addSubview:latticeView];
    self.latticeView = latticeView;
    
    ZROperationView *operationView = [[ZROperationView alloc] init];
    operationView.backgroundColor = [UIColor whiteColor];
    operationView.layer.masksToBounds = YES;
    operationView.delegate = self;
    [self.view addSubview:operationView];
    self.operationView = operationView;

    
    [self setupRandomDot];
    
    self.timeMaxIndex = 60;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    CGFloat itemW = self.view.frame.size.width;
    CGFloat itemH = self.view.frame.size.height;
    
    self.latticeView.frame = CGRectMake(40, 70, itemW - 80, itemW - 80);
    
    self.operationView.frame = CGRectMake(40, itemH - (itemW - 80), itemW - 80, itemW - 80);
    self.operationView.layer.cornerRadius = (itemW - 80) / 2;
}


/**
 生成随机点数
 */
- (void)setupRandomDot {
    arc4random();
    int x = arc4random() % 5 ;
    int y = arc4random() % 5 ;
    if (self.latticeView.eatX == x && self.latticeView.eatY == y) {
        [self setupRandomDot];
        return;
    }
    
    [self.latticeView setupDotWithX:x y:y];
}

#pragma mark - 计时器
- (void)startTimer {
    self.timeIndex = 0;
    NSTimeInterval timeInterval = 1;
    if (self.playMode == ZRPlayVCModeEveryTimeLimit) {
        timeInterval = 0.05;
    }
    
    if (self.timer == nil) {
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(update) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
        [timer fire];
        
        self.timer = timer;
    }
    
}

- (void)update {
    self.timeIndex ++;
    CGFloat progress = self.timeIndex * 1.0 / self.timeMaxIndex;
    [self.operationView setupProgress: progress];

    if (self.timeIndex == self.timeMaxIndex) {
        self.operationView.isStartStatus = NO;
        [self.operationView setupProgress:0];
        [self stopTimer];
        
        
        // 结束
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"游戏结束" message: [NSString stringWithFormat:@"总共完成了%ld次", self.operationView.times] preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"好" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

        }];
        [alertController addAction: action];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

- (void)stopTimer {
    [self.timer invalidate];
    self.timer = nil;
}
#pragma mark - ZROperationViewDelegate
- (void)operationView:(ZROperationView *)operationView direction:(ZROperationViewDirection)direction {
    
    switch (direction) {
        case ZROperationViewDirectionUp:
            self.latticeView.eatY --;
            break;
        case ZROperationViewDirectionLeft:
            self.latticeView.eatX --;
            break;
        case ZROperationViewDirectionRight:
            self.latticeView.eatX ++;
            break;
        case ZROperationViewDirectionDown:
            self.latticeView.eatY ++;
            break;
            
        default:
            break;
    }
    
    if (self.latticeView.eatX < 0) {
        self.latticeView.eatX = 0;
    }
    if (self.latticeView.eatX > maxColunm - 1) {
        self.latticeView.eatX = maxColunm - 1;
    }
    if (self.latticeView.eatY < 0) {
        self.latticeView.eatY = 0;
    }
    if (self.latticeView.eatY > maxColunm - 1) {
        self.latticeView.eatY = maxColunm - 1;
    }
    [self.latticeView setupEatWithX:self.latticeView.eatX y:self.latticeView.eatY];
    
    // 点重合
    if (self.latticeView.eatX == self.latticeView.dotX && self.latticeView.eatY == self.latticeView.dotY) {
        [self setupRandomDot];
        self.operationView.times ++;
        [self.operationView setupTitle:[NSString stringWithFormat:@"%ld", (long)self.operationView.times] isStop:NO];
        if (self.playMode == ZRPlayVCModeEveryTimeLimit) {
            self.timeIndex = 0;
            [self.operationView setupProgress:0];
        }
    }
}


- (void)operationViewDidStart:(ZROperationView *)operationView {
    [self startTimer];
    
}

@end
