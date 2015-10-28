//
//  WriteShuoViewController.m
//  YXZone
//
//  Created by 中软mac028 on 15/10/15.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import "WriteShuoViewController.h"

@interface WriteShuoViewController ()

@end

@implementation WriteShuoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createLeftButtonWithTitle:@"取消"];
    [self createRightButtonWithTitle:@"发表"];
    [self createNavigationTitle:@"写说说"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self createLeftButtonWithTitle:@"取消"];
    [self createRightButtonWithTitle:@"发表"];
    [self createNavigationTitle:@"写说说"];
}
- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.customView removeFromSuperview];
}
- (void) createLeftButtonWithTitle:(NSString *)title
{
    [super createLeftButtonWithTitle:title];
    [self.leftButton addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
}
- (void) createRightButtonWithTitle:(NSString *)title
{
    [super createRightButtonWithTitle:title];
}
- (void) createNavigationTitle:(NSString *)title
{
    [super createNavigationTitle:title];
}
- (void)leftButtonClick:(id) sender
{
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
