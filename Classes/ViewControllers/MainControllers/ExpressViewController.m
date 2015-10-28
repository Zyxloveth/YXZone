//
//  ExpressViewController.m
//  YXZone
//
//  Created by 中软mac028 on 15/10/8.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import "ExpressViewController.h"
#import "ExpressCoverView.h"

@interface ExpressViewController ()

@end

@implementation ExpressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    self.view.backgroundColor = [UIColor clearColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) initView {
    [UIView animateWithDuration:0.2f animations:^(){
        UIWindow* window = [UIApplication sharedApplication].keyWindow;
        ExpressCoverView* cover = [[ExpressCoverView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(coverClick:)];
        [cover addGestureRecognizer:tap];
        cover.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.97f];
        
        [window addSubview:cover];
    }];
    
    
}
- (void) coverClick:(id) sender
{
    if (sender && [sender isKindOfClass:[UITapGestureRecognizer class]]) {
        UITapGestureRecognizer* tap = (UITapGestureRecognizer*) sender;
        ExpressCoverView* cover = (ExpressCoverView*)tap.view;
        [self dismissViewControllerAnimated:NO completion:^(){}];
        [cover removeFromSuperview];
    }
    
}
@end
