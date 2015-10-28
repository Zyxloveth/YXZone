//
//  YXBaseViewController.m
//  YXZone
//
//  Created by 中软mac028 on 15/10/8.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import "YXBaseViewController.h"

#define Navigation_Title_Width 150

@interface YXBaseViewController ()

@end

@implementation YXBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initCustomView];
     self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self initCustomView];
}

#pragma mark - InitCustom
- (void) initCustomView {
   
    if (self->_customView == nil) {
        
        _customView = [[UIView alloc] initWithFrame:CGRectMake(0, -20, Screen_Width, 64)];
        _customView.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.0f];
        
    }
    [self.navigationController.navigationBar addSubview:_customView];

    
}

- (void) createRightButtonWithImage:(NSString*) imageName {
    if (_rightButton == nil) {
         _rightButton = [[UIButton alloc] initWithFrame:CGRectMake(Screen_Width - 44, 20, 44, 44)];
        [_rightButton setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
 
    }
     [_customView addSubview:_rightButton];
    
 
}
- (void) createRightButtonWithTitle:(NSString*) title {
    if (_rightButton == nil) {
        _rightButton = [[UIButton alloc] initWithFrame:CGRectMake(Screen_Width - 54, 20, 44, 44)];
        
        [_rightButton setTitle:title forState:UIControlStateNormal];
        [_rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
       
    }
     [_customView addSubview:_rightButton];
    
}

- (void) createNavigationTitle:(NSString*) title {
    if (_navigationTitle == nil) {
        _navigationTitle = [[UILabel alloc] initWithFrame:CGRectMake(Screen_Width/2 - Navigation_Title_Width/2, 20, Navigation_Title_Width, 44)];
        
        _navigationTitle.textAlignment = NSTextAlignmentCenter;
        _navigationTitle.text = title;
        _navigationTitle.font = [UIFont fontWithName:@"Arial-BoldMT" size:18];

    }
     [_customView addSubview:_navigationTitle];
}

- (void) createLeftButtonWithImage:(NSString*) imageName {
    if (_leftButton == nil) {
        _leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 20, 44, 44)];
        
        [_leftButton setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        
       
    }
    
    [_customView addSubview:_leftButton];
}
- (void) createLeftButtonWithTitle:(NSString*) title {
    if (_leftButton == nil) {
        _leftButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 20, 44, 44)];
        
        [_leftButton setTitle:title forState:UIControlStateNormal];
        [_leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
    }
    [_customView addSubview:_leftButton];


}

@end
