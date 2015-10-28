//
//  PlayBarViewController.m
//  YXZone
//
//  Created by 中软mac028 on 15/10/8.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import "PlayBarViewController.h"
#import "PlayView.h"
#import "LookView.h"
#import "SoundView.h"

#define Label_Width Screen_Width/3
#define Label_Height 44
#define Label_Press_Color [UIColor colorWithRed:86/255.0f green:170/255.9f blue:212/255.0f alpha:1.0f]
#define Label_Normal_Color [UIColor blackColor]

@interface PlayBarViewController ()
{
    UIView* _bottomLine;
    PlayView* _playView;
    PlayView* _lookView;
    PlayView* _soundView;
    UILabel* _playLabel;
    UILabel* _lookLabel;
    UILabel* _soundLabel;
}

@end

@implementation PlayBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.frame = CGRectMake(0, 0, Screen_Width, Screen_Height);
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initNavigationBar];
    _bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, 63, Label_Width, 1)];
    
    _bottomLine.backgroundColor = Label_Press_Color;
    
    [self.customView addSubview:_bottomLine];
    [self defaultView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self initNavigationBar];
    
}
//添加自定义NavigationBar布局
- (void) initNavigationBar {
    
    
    
    
    
    _playLabel = [self createLabel:@"玩玩" frame:CGRectMake(0, 20, Label_Width, Label_Height)];
    _playLabel.textColor = Label_Press_Color;
    
    _lookLabel = [self createLabel:@"看看" frame:CGRectMake(Label_Width, 20 , Label_Width, Label_Height)];
    _lookLabel.textColor = Label_Normal_Color;
    
    _soundLabel = [self createLabel:@"听听" frame:CGRectMake(Label_Width * 2, 20, Label_Width, Label_Height)];
    _soundLabel.textColor = Label_Normal_Color;

}
//默认View
- (void) defaultView {
    
    if (_playView == nil) {
         _playView = [[PlayView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height)];
    }
    [self.view addSubview:_playView];
}
#pragma mark - CreateLabel
- (UILabel*) createLabel:(NSString*) title frame:(CGRect)frame {
    
    UILabel* label = [[UILabel alloc] initWithFrame:frame];
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelClick:)];
    
    label.text = title;
    label.textAlignment = NSTextAlignmentCenter;
    label.userInteractionEnabled = YES;
    [label addGestureRecognizer:tap];
    
    [self.customView addSubview:label];
    
    return label;
    
}

#pragma mark - LabelClick

- (void) labelClick:(id) sender {
    
    if (sender && [sender isKindOfClass:[UITapGestureRecognizer class]]) {
        
        UITapGestureRecognizer* tap = (UITapGestureRecognizer*) sender;
        UILabel* label = (UILabel*)tap.view;
        
        if ([label.text isEqualToString:@"玩玩"]) {
            
            [self playClick:label];
            
        } else if([label.text isEqualToString:@"看看"]) {
            
            [self lookClick:label];
            
        } else if([label.text isEqualToString:@"听听"]) {
            
            [self soundClick:label];
            
        }
    }
}
//点击玩玩时的动作
- (void) playClick:(UILabel*) label{
    
    _playLabel.textColor = Label_Press_Color;
    _lookLabel.textColor = Label_Normal_Color;
    _soundLabel.textColor = Label_Normal_Color;
    
    _bottomLine.frame = CGRectMake(0, 63, Label_Width, 1);
    
    if (_playView == nil) {
        _playView = [[PlayView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height)];
    }
    
    [self.view addSubview:_playView];
    
}
//点击看看时的动作
- (void) lookClick:(UILabel*) label {
    
    _playLabel.textColor = Label_Normal_Color;
    _lookLabel.textColor = Label_Press_Color;
    _soundLabel.textColor = Label_Normal_Color;

    _bottomLine.frame = CGRectMake(Screen_Width/3*1, 63, Screen_Width/3, 1);
    
    if (_lookView == nil) {
        _lookView = [[PlayView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height)];
    }
    
    [self.view addSubview:_lookView];
}
//点击听听时的动作
- (void) soundClick:(UILabel*) label {
   
    _playLabel.textColor = Label_Normal_Color;
    _lookLabel.textColor = Label_Normal_Color;
    _soundLabel.textColor = Label_Press_Color;
    
    _bottomLine.frame = CGRectMake(Label_Width * 2, 63, Label_Width, 1);
    
    if (_soundView == nil) {
        _soundView = [[PlayView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height)];
    }
    
    
    [self.view addSubview:_soundView];
    
}

@end
