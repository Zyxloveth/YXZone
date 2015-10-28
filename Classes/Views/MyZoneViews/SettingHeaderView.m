//
//  SettingHeaderView.m
//  YXZone
//
//  Created by 中软mac028 on 15/10/15.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import "SettingHeaderView.h"

@interface SettingHeaderView ()
{
    UIView* _headerView;
    UIView* _bottomView;
}
@end

@implementation SettingHeaderView

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}
- (void) initView
{
    self.backgroundColor = [UIColor whiteColor];
    _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 70)];
    
    [self addSubview:_headerView];
    
    UIView* sperator = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_headerView.frame), Screen_Width, 0.3)];
    sperator.backgroundColor = [UIColor grayColor];
    [self addSubview:sperator];
    
    _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_headerView.frame)+0.3, Screen_Width, 55)];
    
    [self addSubview:_bottomView];
    
    [self initHeaderView];
    [self initBottomView];
}
- (void) initHeaderView {
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 10, 50, 50)];
    imageView.image = [UIImage imageNamed:@"no_login.png"];
    
    [_headerView addSubview:imageView];
    
    UILabel* name = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imageView.frame)+5, CGRectGetMinY(imageView.frame)+7, 150, 20)];
    name.font = [UIFont systemFontOfSize:12];
    name.text = @"梦醒了";
    
    [_headerView addSubview:name];
    
    UILabel* account = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imageView.frame)+5, CGRectGetMaxY(name.frame), 150, 18)];
    account.font = [UIFont systemFontOfSize:12];
    account.textColor = [UIColor colorWithRed:100/255.0f green:100/255.0f blue:100/255.0f alpha:1.0f];
    account.text = @"我是主角谁都不好使";
    [_headerView addSubview:account];
    
    UIImageView* arrow = [[UIImageView alloc] initWithFrame:CGRectMake(Screen_Width-15, 60/2- 14 / 2, 8, 14)];
    arrow.image = [UIImage imageNamed:@"arrow.png"];
    [_headerView addSubview:arrow];
}
- (void) initBottomView {
    NSArray* imageArray = [NSArray arrayWithObjects:@"setting@2x.png", @"setting@2x.png",@"setting@2x.png",nil];
    NSArray* nameArray = [NSArray arrayWithObjects:@"通用设置",@"权限隐私",@"消息通知", nil];

    for (int i = 0; i < 3; i++) {
        [self createButtonWithFrame:CGRectMake(104*i + 30,0,44,44) imageName:[imageArray objectAtIndex:i] labelText:[nameArray objectAtIndex:i]];
    }
}
- (void) createButtonWithFrame:(CGRect) frame imageName:(NSString*) imageName labelText:(NSString*) labelText{
    UIButton* button = [[UIButton alloc] initWithFrame:frame];
    
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x-5, CGRectGetMaxY(button.frame), frame.size.width+10, 10)];
    label.font = [UIFont systemFontOfSize:10];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = labelText;
    
    [_bottomView addSubview:button];
    [_bottomView addSubview:label];
}
@end
