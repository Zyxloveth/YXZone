//
//  SlidingView.m
//  YXZone
//
//  Created by 中软mac028 on 15/10/9.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import "SlidingView.h"
#import "BottomSubView.h"
#import "TopSubView.h"

#define Sliding_Width 250

#define Topview_Height Screen_Height*2/7
#define Top_Sub_View_Tag 1000

#define Bottom_Height Screen_Height*5/7
#define Bottom_Sub_View_Tag 2000


@interface SlidingView ()
{
    UIImageView* _topView;
    UIImageView* _bottomView;
}
@end

@implementation SlidingView

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
        
    }
    return self;
}
- (void) initUI {
    
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Sliding_Width, Screen_Height)];
    view.backgroundColor = [UIColor whiteColor];
   
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewClick:)];
    [view addGestureRecognizer:tap];
    
    _topView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, Sliding_Width, Topview_Height)];
    
    _topView.image = [UIImage imageNamed:@"sliding_top_bg.png"];
    
    [view addSubview:_topView];
    
    UIView* speratorView = [[UIView alloc] initWithFrame:CGRectMake(30, Topview_Height, Sliding_Width-60, 0.5f)];
    
    speratorView.backgroundColor = [UIColor grayColor];
    
    [view addSubview:speratorView];
    
    _bottomView = [[UIImageView alloc] initWithFrame:CGRectMake(0, Topview_Height+0.5, Sliding_Width, Bottom_Height)];
    
   _bottomView.backgroundColor = [UIColor whiteColor];
    _bottomView.image = [UIImage imageNamed:@"sliding_bottom_bg.png"];
    [view addSubview:_bottomView];
    
    [self addSubview:view];
    
    [self initTopView];
    [self initBottomView];
}

#pragma mark - TopView
- (void) initTopView {
    
    UISearchBar* search = [[UISearchBar alloc] initWithFrame:CGRectMake(30, 35, Sliding_Width - 60, 30)];
    search.placeholder = @"搜索好友/动态";
    
    [_topView addSubview:search];
    
    
    
    CGFloat viewWidth = search.frame.size.width/3 ;
    
    NSArray* imageArray = [NSArray arrayWithObjects:@"special_care.png",@"thatyear_nowday.png", @"last_contect.png", nil];
    NSArray* nameArray = [NSArray arrayWithObjects:@"特别关心",@"那年今日", @"最近联系", nil];
    for (int i = 0; i < 3; i++) {
        
        [self createTopSubViewWithFrame:CGRectMake(viewWidth*i + 30, 80, viewWidth, 55) tag:Top_Sub_View_Tag*i imageName:[imageArray objectAtIndex:i] title:[nameArray objectAtIndex:i]];
   
    }

}

- (void) createTopSubViewWithFrame :(CGRect)frame tag:(NSInteger) tag imageName:(NSString*)imageName title:(NSString*) title{
    
    TopSubView* subView = [[TopSubView alloc] initWithFrame:frame];
    [subView addNewTarget:self action:@selector(topSubViewClick:)];

    subView.topImageName = imageName;
    subView.topTitle = title;
    
    [subView updateView];
    [_topView addSubview:subView];
    
}

- (void)topSubViewClick: (id) sender {
    
    if (sender && [sender isKindOfClass:[SlidingView class]]) {
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(topSubViewClick:)]) {
            
            TopSubView* subView = (TopSubView*) sender;
            [self.delegate bottomSubViewClick:subView.tag];
        }
        
    }
}

#pragma mark - BottomView
- (void) initBottomView {
    CGFloat viewHeight = Bottom_Height/6.5;
    NSArray* imageArray = [NSArray arrayWithObjects:@"huati.png",@"huabao.png", @"headline.png",@"scret.png",@"certify_zone.png",nil];
    NSArray* nameArray = [NSArray arrayWithObjects:@"话题圈",@"画报", @"大头条",@"小秘密",@"认证空间", nil];
    
    for (int i = 0; i < 5; i++) {
        
        [self createBottomSubViewWithFrame:CGRectMake(0, (viewHeight+5)*i + 8, Sliding_Width, viewHeight) tag:Bottom_Sub_View_Tag+i imageName:[imageArray objectAtIndex:i] title:[nameArray objectAtIndex:i]];
        
    }
    
    
}

- (void) createBottomSubViewWithFrame:(CGRect)frame tag:(NSInteger) tag imageName:(NSString*)imageName title:(NSString*) title{
    
    BottomSubView* subView = [[BottomSubView alloc] initWithFrame:frame];
    
    [subView addNewTarget:self action:@selector(bottomSubViewClick:)];
    
    subView.bottomImageName = imageName;
    subView.bottomTitle = title;
    
    [subView updateView];
    [_bottomView addSubview:subView];
}
- (void) viewClick: (id) sender {
  
}
- (void) bottomSubViewClick: (id) sender {
    
    if (sender && [sender isKindOfClass:[SlidingView class]]) {
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(bottomSubViewClick:)]) {
            
            BottomSubView* subView = (BottomSubView*) sender;
            [self.delegate bottomSubViewClick:subView.tag];
        }
        
        
    }
    
}

@end
