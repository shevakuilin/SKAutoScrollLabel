//
//  ViewController.m
//  SKAutoScrollLabel
//
//  Created by shevchenko on 17/4/10.
//  Copyright © 2017年 shevchenko. All rights reserved.
//

#import "ViewController.h"
#import "SKAutoScrollLabel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 向左滚动
    SKAutoScrollLabel * leftLabel = [[SKAutoScrollLabel alloc] initWithFrame:CGRectMake(50, 50, [UIScreen mainScreen].bounds.size.width - 100, 50)];
    [self.view addSubview:leftLabel];
    leftLabel.backgroundColor = [UIColor blackColor];
    leftLabel.textColor = [UIColor whiteColor];
    leftLabel.font = [UIFont systemFontOfSize:16];
    leftLabel.direction = SK_AUTOSCROLL_DIRECTION_LEFT;
    leftLabel.text = @"这是一个向左自动滚动的UILabel---SKAutoScrollLabel，作者ShevaKuilin";
    
    // 向右滚动
    SKAutoScrollLabel * rightLabel = [[SKAutoScrollLabel alloc] initWithFrame:CGRectMake(50, 110, [UIScreen mainScreen].bounds.size.width - 100, 50)];
    [self.view addSubview:rightLabel];
    rightLabel.backgroundColor = [UIColor blackColor];
    rightLabel.textColor = [UIColor whiteColor];
    rightLabel.font = [UIFont systemFontOfSize:16];
    rightLabel.direction = SK_AUTOSCROLL_DIRECTION_RIGHT;
    rightLabel.text = @"这是一个向右自动滚动的UILabel---SKAutoScrollLabel，作者ShevaKuilin";
    
    // 向上滚动
    SKAutoScrollLabel * topLabel = [[SKAutoScrollLabel alloc] initWithFrame:CGRectMake(50, 170,  50, 200)];
    [self.view addSubview:topLabel];
    topLabel.backgroundColor = [UIColor blackColor];
    topLabel.textColor = [UIColor whiteColor];
    topLabel.font = [UIFont systemFontOfSize:16];
    topLabel.direction = SK_AUTOSCROLL_DIRECTION_TOP;
    topLabel.text = @"这是一个向上自动滚动的UILabel---SKAutoScrollLabel，作者ShevaKuilin";

    // 向下滚动
    SKAutoScrollLabel * bottomLabel = [[SKAutoScrollLabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 100, 170, 50, 200)];
    [self.view addSubview:bottomLabel];
    bottomLabel.backgroundColor = [UIColor blackColor];
    bottomLabel.textColor = [UIColor whiteColor];
    bottomLabel.font = [UIFont systemFontOfSize:16];
    bottomLabel.direction = SK_AUTOSCROLL_DIRECTION_BOTTOM;
    bottomLabel.text = @"这是一个向下自动滚动的UILabel---SKAutoScrollLabel，作者ShevaKuilin";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
