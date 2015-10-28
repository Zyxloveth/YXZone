//
//  YXBaseViewController.h
//  YXZone
//
//  Created by 中软mac028 on 15/10/8.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YXBaseViewController : UIViewController

@property (nonatomic,strong,readonly) UIButton* leftButton;
@property (nonatomic,strong,readonly) UIButton* rightButton;
@property (nonatomic,strong,readonly) UILabel* navigationTitle;
@property (nonatomic,strong,readonly) UIView* customView;

- (void) createRightButtonWithImage:(NSString*) imageName;
- (void) createRightButtonWithTitle:(NSString*) title;

- (void) createNavigationTitle:(NSString*) title;

- (void) createLeftButtonWithImage:(NSString*) imageName;
- (void) createLeftButtonWithTitle:(NSString*) title;

@end
