//
//  ZRHomeVC.m
//  EatDot
//
//  Created by Ryan on 2017/10/23.
//  Copyright © 2017年 Ryan. All rights reserved.
//

#import "ZRHomeVC.h"
#import "ZRPlayVC.h"

@interface ZRHomeVC ()
@property (nonatomic, weak) UIButton *limitEveryTimeBtn;
@property (nonatomic, weak) UIButton *limitAllTimeBtn;
@end

@implementation ZRHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
}

- (void)setupUI {
    
    UIButton *limitEveryTimeBtn = [[UIButton alloc] init];
    [limitEveryTimeBtn setTitle:@"模式1" forState: UIControlStateNormal];
    limitEveryTimeBtn.backgroundColor = [UIColor orangeColor];
    limitEveryTimeBtn.layer.cornerRadius = 20;
    limitEveryTimeBtn.layer.masksToBounds = YES;
    limitEveryTimeBtn.tag = 1;
    [limitEveryTimeBtn addTarget:self action:@selector(modeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:limitEveryTimeBtn];
    self.limitEveryTimeBtn = limitEveryTimeBtn;

    
    UIButton *limitAllTimeBtn = [[UIButton alloc] init];
    [limitAllTimeBtn setTitle:@"模式2" forState: UIControlStateNormal];
    limitAllTimeBtn.backgroundColor = [UIColor orangeColor];
    limitAllTimeBtn.layer.cornerRadius = 20;
    limitAllTimeBtn.layer.masksToBounds = YES;
    limitAllTimeBtn.tag = 2;
    [limitAllTimeBtn addTarget:self action:@selector(modeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:limitAllTimeBtn];
    self.limitAllTimeBtn = limitAllTimeBtn;
}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    CGFloat itemW = self.view.frame.size.width;
    CGFloat itemH = self.view.frame.size.height;
    
    self.limitEveryTimeBtn.frame = CGRectMake((itemW - 100) / 2, 400, 100, 40);
    self.limitAllTimeBtn.frame = CGRectMake((itemW - 100) / 2, CGRectGetMaxY(self.limitEveryTimeBtn.frame) + 20, 100, 40);
}

- (void)modeBtnClick: (UIButton *)sender {
    
    ZRPlayVCMode playMode;
    if (sender.tag == 1) {
        playMode = ZRPlayVCModeEveryTimeLimit;
    } else if (sender.tag == 2) {
        playMode = ZRPlayVCModeAllTimeLimit;
    }
    ZRPlayVC *playVC = [[ZRPlayVC alloc] init];
    playVC.playMode = playMode;
    [self.navigationController pushViewController:playVC animated: YES];
    
}

@end
