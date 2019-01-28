//
//  RootViewController.m
//  CADisplayLinkeDemo
//
//  Created by ShevaKuilin on 2018/5/8.
//  Copyright © 2018年 ShevaKuilin. All rights reserved.
//

#import "ViewController.h"
#import "RootViewController.h"

static NSString *const ReuseIdentifier = @"cell";

@interface RootViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *optionListView;
@property (nonatomic, strong) NSArray *optionList;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initConfig];
    [self initElement];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.optionListView.frame = self.view.bounds;
}

- (void)initConfig {
    self.title = @"CHOOSE SCROLL TYPE";
    self.optionList = @[@"RIGHT", @"LEFT", @"TOP", @"BOTTOM"];
}

- (void)initElement {
    self.optionListView = [[UITableView alloc] init];
    self.optionListView.delegate = self;
    self.optionListView.dataSource = self;
    self.optionListView.showsVerticalScrollIndicator = false;
    self.optionListView.scrollEnabled = false;
    self.optionListView.tableFooterView = [UIView new];
    [self.view addSubview:self.optionListView];
    
    [self registerCell];
}

- (void)registerCell {
    [self.optionListView registerClass:[UITableViewCell class] forCellReuseIdentifier:ReuseIdentifier];
}

- (void)toNextVcWithIndex:(NSInteger)index {
    ViewController *nextVc = [[ViewController alloc] init];
    nextVc.scrollType = index;
    [self.navigationController showViewController:nextVc sender:nil];
}

#pragma mark -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.optionList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ReuseIdentifier];
    cell.textLabel.text = self.optionList[indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self toNextVcWithIndex:indexPath.row];
}


@end
