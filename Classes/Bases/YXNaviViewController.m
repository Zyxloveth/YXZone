//
//  YXNaviViewController.m
//  YXZone
//
//  Created by 中软mac028 on 15/10/8.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import "YXNaviViewController.h"

@interface YXNaviViewController ()
{
    UIViewController* _viewController;
}

@end

@implementation YXNaviViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (void) pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    _viewController = viewController;
    [self initController];
    [super pushViewController:viewController animated:animated];
    
}

- (void) initController {
    _viewController.navigationItem.hidesBackButton = YES;
    if (self.viewControllers.count > 0) {
        _viewController.hidesBottomBarWhenPushed = YES;
        
    }
}

@end
