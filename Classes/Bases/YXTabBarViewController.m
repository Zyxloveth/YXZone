//
//  YXTabBarViewController.m
//  YXZone
//
//  Created by 中软mac028 on 15/10/8.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import "YXTabBarViewController.h"
#import "AboutMeViewController.h"
#import "DynamicViewController.h"
#import "ExpressViewController.h"
#import "MyZoneViewController.h"
#import "PlayBarViewController.h"
#import "YXNaviViewController.h"

@interface YXTabBarViewController ()

@end

@implementation YXTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTabBar];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - CreateViewController
- (void) createViewController:(UIViewController*) viewController title:(NSString*) title imageName: (NSString*)imageName selectImageName:(NSString*)selectImageName{
    
    YXNaviViewController* naviController = [[YXNaviViewController alloc] initWithRootViewController:viewController];
    
    if ([viewController isKindOfClass:[ExpressViewController class]]) {
        viewController.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
        viewController.navigationController.navigationBar.hidden = YES;
    }
    
    NSDictionary* dic = @{NSForegroundColorAttributeName:[UIColor blackColor]};
    
    [viewController.tabBarItem setTitleTextAttributes:dic forState:UIControlStateSelected];
    [viewController.tabBarItem setTitleTextAttributes:dic forState:UIControlStateNormal];
    viewController.tabBarItem.title = title;
    viewController.navigationController.navigationBar.translucent = YES;
    
    
    UIImage* normalImage = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.image = normalImage;
    
    UIImage* pressImage = [[UIImage imageNamed:selectImageName] imageWithRenderingMode:21];
    viewController.tabBarItem.selectedImage = pressImage;
    
    [self addChildViewController:naviController];
    
    
}

#pragma mark - InitTabBar
- (void) initTabBar {
    
    [self createViewController:[[DynamicViewController alloc] init] title:@"动态" imageName:@"dynamic_normal.png" selectImageName:@"dynamic_press.png"];
    
    [self createViewController:[[AboutMeViewController alloc] init] title:@"与我相关" imageName:@"aboutme_normal.png" selectImageName:@"aboutme_press.png"];
    
    [self createViewController:[[ExpressViewController alloc] init] title:@"" imageName:@"express.png" selectImageName:@"express`.png"];
    
    [self createViewController:[[MyZoneViewController alloc] init] title:@"我的空间" imageName:@"myzone_normal.png" selectImageName:@"myzone_press.png"];
    
    [self createViewController:[[PlayBarViewController alloc] init] title:@"玩吧" imageName:@"playbar_normal.png" selectImageName:@"playbar_press.png"];
    
}

@end
