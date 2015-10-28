
//
//  MyZoneHeaderView.m
//  YXZone
//
//  Created by 中软mac028 on 15/10/14.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import "MyZoneHeaderView.h"
#import "MyZoneHeaderSubView.h"

@interface MyZoneHeaderView ()
{
    UIImageView* _bgView;
    UIImageView* _headerView;
    
    UIView* _middleView;
    
    MyZoneHeaderSubView* _lastVisitorView;
    MyZoneHeaderSubView* _friendBirthView;
    MyZoneHeaderSubView* _iamMyView;
    
    MyZoneHeaderSubView* _coupleZoneView;
}
@end

@implementation MyZoneHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

- (void) initView {
    _bgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 206)];
    _bgView.image = [UIImage imageNamed:@"top_bg_image.png"];
    [self addSubview:_bgView];
    _headerView = [[UIImageView alloc] initWithFrame:CGRectMake(15, _bgView.frame.size.height*2/3, 60, 60)];
    _headerView.image = [UIImage imageNamed:@"no_login.png"];
    [_bgView addSubview:_headerView];
    
    _middleView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_bgView.frame), Screen_Width ,  176)];
    
    _middleView.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:_middleView];
    
    
    [self initMiddleView];
   
}
- (void) initMiddleView {
    _lastVisitorView = [[MyZoneHeaderSubView alloc] initWithFrame:CGRectMake(10, 0, Screen_Width, 44)];
    _lastVisitorView.headerImageName = @"last_visitor.png";
    _lastVisitorView.headerText = @"最近访问";
   
    [_lastVisitorView updateView];
    
    UIView* sperator1 = [[UIView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(_lastVisitorView.frame), Screen_Width-10, 0.5)];
    sperator1.backgroundColor = [UIColor grayColor];
    [_middleView addSubview:sperator1];
    
    _friendBirthView = [[MyZoneHeaderSubView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(_lastVisitorView.frame)+0.5, Screen_Width, 44)];
    _friendBirthView.headerImageName = @"friend_birth.png";
    _friendBirthView.headerText = @"好友生日";
   
    [_friendBirthView updateView];
    
    UIView* sperator2 = [[UIView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(_friendBirthView.frame), Screen_Width-10, 0.5)];
    sperator2.backgroundColor = [UIColor grayColor];
    [_middleView addSubview:sperator2];
    
    _iamMyView = [[MyZoneHeaderSubView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(_friendBirthView.frame)+0.5, Screen_Width, 44)];
    _iamMyView.headerImageName = @"iam_my.png";
    _iamMyView.headerText = @"我是我的";
    
    [_iamMyView updateView];
    
    UIView* sperator3 = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_iamMyView.frame), Screen_Width, 0.5)];
    sperator3.backgroundColor = [UIColor grayColor];
    [_middleView addSubview:sperator3];
    
    [_middleView addSubview:_lastVisitorView];
    [_middleView addSubview:_friendBirthView];
    [_middleView addSubview:_iamMyView];
    
    _coupleZoneView = [[MyZoneHeaderSubView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(_iamMyView.frame) + 0.5, Screen_Width, 44)];
    _coupleZoneView.headerImageName = @"couple_zone.png";
    _coupleZoneView.headerText = @"情侣空间";
    
    
    [_coupleZoneView updateView];
    
    [_middleView addSubview:_coupleZoneView];
    
}

- (void) updateView
{
    
}

@end
