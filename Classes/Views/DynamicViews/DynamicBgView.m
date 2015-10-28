//
//  DynamicBgView.m
//  YXZone
//
//  Created by 中软mac028 on 15/10/11.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//



#import "DynamicBgView.h"


#define Visit_View_X Screen_Width * 7 / 10
#define Visit_View_Y _bgView.frame.size.height-40
#define Data_Label_Color [UIColor colorWithRed:1.0f green:182/255.0f blue:0.0f alpha:1.0f];

@interface DynamicBgView ()
{
    UIImageView* _bgView;
    UIImageView* _headerView;
    UIImageView* _visitView;
    UIView* _expressView;
    
    UIImageView* _firstLuckyView;
    UIImageView* _secondLuckyView;
    UIImageView* _thirdLuckyView;
    
    UIView* _recordView;
    UILabel* _nowdayVisitorLabel;
    UILabel* _allOfVisitorLabel;
    UILabel* _goOnLoginDaysLabel;
}
@end

@implementation DynamicBgView

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
    _bgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, self.frame.size.height-44)];
    _bgView.image = [UIImage imageNamed:@"top_bg_image.png"];
    _bgView.userInteractionEnabled = YES;
    [self addSubview:_bgView];
    
    
    
    _headerView = [[UIImageView alloc] initWithFrame:CGRectMake(15, _bgView.frame.size.height*2/3, 60, 60)];
    _headerView.image = [UIImage imageNamed:@"no_login.png"];
    [_bgView addSubview:_headerView];
//    if (self.data.t) {
//        <#statements#>
//    }
    _expressView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-44, Screen_Width, 44)];
    _expressView.userInteractionEnabled = YES;
    _expressView.backgroundColor = [UIColor whiteColor];
    [self initExpressView];
    [self addSubview:_expressView];
    _visitView = [[UIImageView alloc] initWithFrame:CGRectMake(Visit_View_X, Visit_View_Y, 30, 30)];
    _visitView.image = [UIImage imageNamed:@"vistor.png"];
    [_bgView addSubview:_visitView];
    
    
     _firstLuckyView = [self createStarViewWithFrame:CGRectMake(Visit_View_X + 2, Visit_View_Y - 8 , 7, 7)];
    _firstLuckyView.image = [UIImage imageNamed:@"level2.png"];
    
    _secondLuckyView = [self createStarViewWithFrame:CGRectMake(Visit_View_X + 11, Visit_View_Y - 12 , 7, 7)];
    _secondLuckyView.image = [UIImage imageNamed:@"level2.png"];
    
    _thirdLuckyView = [self createStarViewWithFrame:CGRectMake(Visit_View_X + 20, Visit_View_Y - 8 , 7, 7)];
    _thirdLuckyView.image = [UIImage imageNamed:@"level2.png"];
    
    _recordView = [[UIView alloc] initWithFrame:CGRectMake(Visit_View_X + 33, Visit_View_Y - 7, 55, 35)];
    
    [self initRecordView];
    
    [self addSubview:_recordView];
}

- (void) initRecordView {
    
    CGFloat labelWidth = _recordView.frame.size.width * 3 / 5;
    CGFloat labelHeight = _recordView.frame.size.height / 3;
    CGFloat dataWidth = _recordView.frame.size.width * 2 / 5;
    
    UILabel* label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelWidth, labelHeight)];
    label1.text = @"今日访客";
    label1.textColor = [UIColor whiteColor];
    label1.font = [UIFont systemFontOfSize:8];
    
    _nowdayVisitorLabel = [[UILabel alloc] initWithFrame:CGRectMake(labelWidth, 0, dataWidth, labelHeight)];
    _nowdayVisitorLabel.font = [UIFont systemFontOfSize:8];
    _nowdayVisitorLabel.textColor = Data_Label_Color;
    _nowdayVisitorLabel.text = @"1111";
    
    UILabel* label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, labelHeight, labelWidth, labelHeight)];
    label2.text = @"访客总量";
    label2.textColor = [UIColor whiteColor];
    label2.font = [UIFont systemFontOfSize:8];
    
    _allOfVisitorLabel = [[UILabel alloc] initWithFrame:CGRectMake(labelWidth, labelHeight, dataWidth, labelHeight)];
    _allOfVisitorLabel.text = @"1111";
    _allOfVisitorLabel.font = [UIFont systemFontOfSize:8];
    _allOfVisitorLabel.textColor = Data_Label_Color;
    
    UILabel* label3 = [[UILabel alloc] initWithFrame:CGRectMake(0, labelHeight * 2, labelWidth, labelHeight)];
    label3.text = @"连续登录";
    label3.textColor = [UIColor whiteColor];
    label3.font = [UIFont systemFontOfSize:8];
    
    _goOnLoginDaysLabel = [[UILabel alloc] initWithFrame:CGRectMake(labelWidth, labelHeight * 2, dataWidth, labelHeight)];
    _goOnLoginDaysLabel.text = @"1111";
    _goOnLoginDaysLabel.font = [UIFont systemFontOfSize:8];
    _goOnLoginDaysLabel.textColor = Data_Label_Color;
    
    [_recordView addSubview:label1];
    [_recordView addSubview:label2];
    [_recordView addSubview:label3];
    
    [_recordView addSubview:_nowdayVisitorLabel];
    [_recordView addSubview:_allOfVisitorLabel];
    [_recordView addSubview:_goOnLoginDaysLabel];
    
}

- (void) initExpressView {
    
    UILabel* express = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, Screen_Width-44, 44)];
    express.backgroundColor = [UIColor whiteColor];
    express.textColor = [UIColor colorWithRed:100/255.0f green:100/255.0f blue:100/255.0f alpha:0.5f];
    express.text = @"说点什么吧...";
    express.userInteractionEnabled = YES;
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sayLittle:)];
    [express addGestureRecognizer:tap];
    
    UIButton* photo = [[UIButton alloc] initWithFrame:CGRectMake(Screen_Width-44, 0, 44, 44)];
    
    photo.backgroundColor = [UIColor colorWithRed:245/255.0f green:245/255.0f blue:245/255.0f alpha:1.0f];
    [photo setImage:[UIImage imageNamed:@"express_photo_normal.png"] forState:UIControlStateNormal];
    
    [_expressView addSubview:express];
    [_expressView addSubview:photo];
    
}
- (void) sayLittle: (id) sender {
    if (sender && [sender isKindOfClass:[UITapGestureRecognizer class]]) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(sayLittleAction)]) {
            [self.delegate sayLittleAction];
        }
    }
}
- (UIImageView*) createStarViewWithFrame:(CGRect) frame {
    
    UIImageView* luckyView = [[UIImageView alloc] initWithFrame:frame];
    
    [_bgView addSubview:luckyView];
    
    return luckyView;
}
- (void) updateView {
    
}
@end
