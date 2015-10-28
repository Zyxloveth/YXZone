//
//  ExpressCoverView.m
//  YXZone
//
//  Created by 中软mac028 on 15/10/14.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import "ExpressCoverView.h"


@interface ExpressCoverView ()
{
    UIView* _dateView;
    UILabel* _feelLabel;
    
    UIView* _contentView;
    
    UIImageView* _expressImage;
}
@end

@implementation ExpressCoverView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
        
    }
    return self;
}


- (void) initView {
    _expressImage = [[UIImageView alloc] initWithFrame:CGRectMake(Screen_Width * 0.2 * 2 + 12, Screen_Height - 45, 40, 40)];
    
    _expressImage.image = [UIImage imageNamed:@"express.png"];
    
    [self addSubview:_expressImage];
    
    
    
    _dateView = [[UIView alloc] initWithFrame:CGRectMake(20, 64, 100, 50)];
    
    [self addSubview:_dateView];
    
    UILabel* day = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 45, 45)];
    day.text = @"14";
    day.font = [UIFont systemFontOfSize:40];
    day.textAlignment = NSTextAlignmentRight;
    day.textColor = [UIColor colorWithRed:110/255.0f green:110/255.0f blue:110/255.0f alpha:1.0f];
    
    [_dateView addSubview:day];
    
    UILabel* week = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(day.frame) + 10, CGRectGetMinY(day.frame) + 7.5, 45, 10)];
    week.textColor = [UIColor colorWithRed:150/255.0f green:150/255.0f blue:150/255.0f alpha:1.0f];
    week.font = [UIFont systemFontOfSize:10];
    week.text = @"星期三";
    
    [_dateView addSubview:week];
    
    UILabel* speratorLine = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(day.frame) + 12, CGRectGetMaxY(week.frame), 10, 10)];
    
    speratorLine.textColor = [UIColor colorWithRed:150/255.0f green:150/255.0f blue:150/255.0f alpha:1.0f];
    speratorLine.font = [UIFont systemFontOfSize:10];
    speratorLine.text = @"/";
    
    [_dateView addSubview:speratorLine];
    
    UILabel* yearMonth = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(day.frame) + 10, CGRectGetMaxY(speratorLine.frame), 45, 10)];
    yearMonth.textColor = [UIColor colorWithRed:150/255.0f green:150/255.0f blue:150/255.0f alpha:1.0f];
    yearMonth.font = [UIFont systemFontOfSize:10];
    yearMonth.text = @"2015-10";
    
    [_dateView addSubview:yearMonth];
    
    _feelLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(_dateView.frame), 100, 60)];
    _feelLabel.font = [UIFont systemFontOfSize:12];
    _feelLabel.textAlignment = NSTextAlignmentLeft;
    _feelLabel.numberOfLines = 0;
    _feelLabel.text = @"没有网络的痛\n\n我比谁都懂";
    [self addSubview:_feelLabel];
    
    UIImageView* huangli = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_dateView.frame), CGRectGetMinY(_dateView.frame)+5, 36, 36)];
    huangli.image = [UIImage imageNamed:@"huangli.png"];
    [self addSubview:huangli];
    [self initContentView];
}
- (void) initContentView {
    
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(10, 300, Screen_Width - 20, 150)];
    
    
    [self addSubview:_contentView];
    NSArray* imageArray = [NSArray arrayWithObjects:@"shuoshuo.png", @"picture.png",@"camera.png",@"video.png",@"signin.png",@"cloud.png",@"pintu.png",@"speech.png",nil];
    NSArray* nameArray = [NSArray arrayWithObjects:@"说说",@"相片",@"贴纸相机",@"视频",@"签到",@"云备份",@"拼图",@"语音", nil];
    int index = 0;
    for (int i = 0; i < 2; i++) {
        for (int j = 0;  j < 4; j++) {
            [self createButtonWithFrame:CGRectMake(j*(Screen_Width/4 - 15) + 10, i*((Screen_Width/4 - 15) + 20) + 300, Screen_Width/4 -15, Screen_Width/4 -15) imageName:[imageArray objectAtIndex:index] labelText:[nameArray objectAtIndex:index] tag:index+1000];
            index++;
        }
    }
    
}
- (void) createButtonWithFrame:(CGRect) frame imageName:(NSString*) imageName labelText:(NSString*) labelText tag:(NSInteger) tag{
    UIButton* button = [[UIButton alloc] initWithFrame:frame];
    button.tag = tag;
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x, CGRectGetMaxY(button.frame) + 5, frame.size.width, 10)];
    label.tag = 1000+tag;
    label.font = [UIFont systemFontOfSize:10];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = labelText;
    
    [_contentView addSubview:button];
    [_contentView addSubview:label];
}
- (void) startAnimation {
    [UIView animateWithDuration:0.5 animations:^(){
        _expressImage.transform = CGAffineTransformMakeRotation(M_PI_4);
    }];
    for (int i = 0; i < 8; i++) {
        if (i == 0 || i == 3 || i == 4 || i == 7) {
            [UIView animateWithDuration:1 delay:0.1 usingSpringWithDamping:2 initialSpringVelocity:15 options:UIViewAnimationOptionLayoutSubviews animations:^(){
                UIButton* btn = (UIButton*)[_contentView viewWithTag:i + 1000];
                UILabel* label = (UILabel*)[_contentView viewWithTag:i + 2000];
                btn.frame = CGRectMake(btn.frame.origin.x, btn.frame.origin.y - 300, btn.frame.size.width, btn.frame.size.height);
                label.frame = CGRectMake(btn.frame.origin.x, CGRectGetMaxY(btn.frame) + 5, btn.frame.size.width, 10);
            }completion:^(BOOL finished){}];
        } else {
            [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:2 initialSpringVelocity:15 options:UIViewAnimationOptionLayoutSubviews animations:^(){
                UIButton* btn = (UIButton*)[_contentView viewWithTag:i + 1000];
                UILabel* label = (UILabel*)[_contentView viewWithTag:i + 2000];
                btn.frame = CGRectMake(btn.frame.origin.x, btn.frame.origin.y - 300, btn.frame.size.width, btn.frame.size.height);
                label.frame = CGRectMake(btn.frame.origin.x, CGRectGetMaxY(btn.frame) + 5, btn.frame.size.width, 10);
            }completion:^(BOOL finished){
                
            }];
        }
       
    }
    
    
}
- (void) endAnimation {
    
        _expressImage.transform = CGAffineTransformMakeRotation(0);
   
    for (int i = 0; i < 8; i++) {
        if (i == 0 || i == 3 || i == 4 || i == 7) {
            [UIView animateWithDuration:1 delay:0.1 usingSpringWithDamping:2 initialSpringVelocity:15 options:UIViewAnimationOptionLayoutSubviews animations:^(){
                UIButton* btn = (UIButton*)[_contentView viewWithTag:i + 1000];
                UILabel* label = (UILabel*)[_contentView viewWithTag:i + 2000];
                btn.frame = CGRectMake(btn.frame.origin.x, btn.frame.origin.y + 300, btn.frame.size.width, btn.frame.size.height);
                label.frame = CGRectMake(btn.frame.origin.x, CGRectGetMaxY(btn.frame) + 5, btn.frame.size.width, 10);
            }completion:^(BOOL finished){}];
        } else {
            [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:2 initialSpringVelocity:15 options:UIViewAnimationOptionLayoutSubviews animations:^(){
                UIButton* btn = (UIButton*)[_contentView viewWithTag:i + 1000];
                UILabel* label = (UILabel*)[_contentView viewWithTag:i + 2000];
                btn.frame = CGRectMake(btn.frame.origin.x, btn.frame.origin.y + 300, btn.frame.size.width, btn.frame.size.height);
                label.frame = CGRectMake(btn.frame.origin.x, CGRectGetMaxY(btn.frame) + 5, btn.frame.size.width, 10);
            }completion:^(BOOL finished){
                
            }];
        }
        
    }

}
@end
