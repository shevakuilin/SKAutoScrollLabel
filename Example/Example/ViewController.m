//
//  ViewController.m
//  CADisplayLinkeDemo
//
//  Created by ShevaKuilin on 2018/5/4.
//  Copyright © 2018年 ShevaKuilin. All rights reserved.
//

#import "ViewController.h"
#import "SKAutoScrollLabel.h"

@interface ViewController ()

@property (nonatomic, strong) SKAutoScrollLabel *scrollLabel;
@property (nonatomic, strong) UIButton *pauseBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initElements];
}

- (void)initElements {
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.scrollLabel = [[SKAutoScrollLabel alloc] initWithTextContent:@"你指尖跃动的电光, 是我此生不灭的信仰! 唯我超电磁炮永世长存!! 哔哩哔哩(゜-゜)つロ干杯~-bilibili" direction:self.scrollType];
    if (self.scrollType == 0 || self.scrollType == 1) {
        self.scrollLabel.frame = CGRectMake(10,
                                            ([UIScreen mainScreen].bounds.size.height / 2) - 30,
                                            [UIScreen mainScreen].bounds.size.width - 20,
                                            60);
    } else {
        self.scrollLabel.frame = CGRectMake(self.view.center.x - 30,
                                            100,
                                            60,
                                            self.view.frame.size.height / 2 - 10);
    }
    self.scrollLabel.textColor = [UIColor whiteColor];
    self.scrollLabel.backgroundColor = [UIColor colorWithRed:253/255.0
                                                       green:172/255.0
                                                        blue:201/255.0
                                                       alpha:1.0];
    [self.view addSubview:self.scrollLabel];
    
    self.pauseBtn = [[UIButton alloc] init];
    [self.pauseBtn setTitle:@"PAUSE" forState:UIControlStateNormal];
    [self.pauseBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.pauseBtn setTitle:@"CONTINUE" forState:UIControlStateSelected];
    [self.pauseBtn setTitleColor:[UIColor brownColor] forState:UIControlStateSelected];
    self.pauseBtn.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    self.pauseBtn.frame = CGRectMake(self.view.center.x - 100,
                                     self.view.center.y + 100,
                                     200,
                                     50);
    self.pauseBtn.selected = false;
    [self.pauseBtn addTarget:self action:@selector(clickActionWithBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.pauseBtn];
}

- (void)clickActionWithBtn:(UIButton *)btn {
    self.pauseBtn.selected = !btn.selected;
    if (self.pauseBtn.selected) {
        [self.scrollLabel pauseScroll];
    } else {
        [self.scrollLabel continueScroll];
    }
}

@end
