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
    NSString * text = @"罗纳尔多，舍甫琴科，亨利，劳尔，克雷斯波，因扎吉，范尼斯特鲁伊，马凯，阿德里亚诺";
    // 向左滚动
    SKAutoScrollLabel * leftLabel = [[SKAutoScrollLabel alloc] initWithFrame:CGRectMake(50, 50, [UIScreen mainScreen].bounds.size.width - 100, 50)];
    [self.view addSubview:leftLabel];
    leftLabel.backgroundColor = [UIColor blackColor];
    leftLabel.textColor = [UIColor whiteColor];
    leftLabel.font = [UIFont systemFontOfSize:16];
    leftLabel.direction = SK_AUTOSCROLL_DIRECTION_LEFT;
    leftLabel.text = text;
    
    // 向右滚动
    SKAutoScrollLabel * rightLabel = [[SKAutoScrollLabel alloc] initWithFrame:CGRectMake(50, 110, [UIScreen mainScreen].bounds.size.width - 100, 50)];
    [self.view addSubview:rightLabel];
    rightLabel.backgroundColor = [UIColor blackColor];
    rightLabel.textColor = [UIColor whiteColor];
    rightLabel.font = [UIFont systemFontOfSize:16];
    rightLabel.direction = SK_AUTOSCROLL_DIRECTION_RIGHT;
    rightLabel.text = text;
    
    // 向上滚动
    SKAutoScrollLabel * topLabel = [[SKAutoScrollLabel alloc] initWithFrame:CGRectMake(50, 170,  50, 200)];
    [self.view addSubview:topLabel];
    topLabel.backgroundColor = [UIColor blackColor];
    topLabel.textColor = [UIColor whiteColor];
    topLabel.font = [UIFont systemFontOfSize:16];
    topLabel.direction = SK_AUTOSCROLL_DIRECTION_TOP;
    topLabel.text = text;

    // 向下滚动
    SKAutoScrollLabel * bottomLabel = [[SKAutoScrollLabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 100, 170, 50, 200)];
    [self.view addSubview:bottomLabel];
    bottomLabel.backgroundColor = [UIColor blackColor];
    bottomLabel.textColor = [UIColor whiteColor];
    bottomLabel.font = [UIFont systemFontOfSize:16];
    bottomLabel.direction = SK_AUTOSCROLL_DIRECTION_BOTTOM;
    bottomLabel.text = text;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
