//
//  NewScrollView.m
//  YXZone
//
//  Created by 中软mac028 on 15/10/15.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import "NewScrollView.h"

#define Page_Control_Width 100
#define Page_Control_Height 44

@interface NewScrollView ()<UIScrollViewDelegate>
{
    UIScrollView* _scrollView;
    UIPageControl* _pageControl;
    NSTimer* _timer;
    BOOL isRight;
}
@end

@implementation NewScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
- (instancetype) initWithFrame:(CGRect)frame type:(YXNewScrollType)type
{
    self = [super initWithFrame:frame];
    if (self) {
        self.type = type;
        
    }
    return self;
}

- (void) initView {
    isRight = YES;
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 200)];
    
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _scrollView.contentOffset = CGPointZero;
    _scrollView.bounces = YES;
    
    [self addSubview:_scrollView];
    
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(Screen_Width/2 - Page_Control_Width/2, CGRectGetMaxY(_scrollView.frame) + 50, Page_Control_Width, Page_Control_Height)];
    
    [self addSubview:_pageControl];
}

- (void) updateView {
    [self initView];
    
    if (self.type == YXNewScrollTypeBanner) {
        _scrollView.frame = CGRectMake(0, 0, Screen_Width, 200);
        _pageControl.frame = CGRectMake(Screen_Width/2 - Page_Control_Width/2, CGRectGetMaxY(_scrollView.frame) + 50, Page_Control_Width, Page_Control_Height);
    } else if (self.type == YXNewScrollTypeWelcome){
        _scrollView.frame = CGRectMake(0, 0, Screen_Width, Screen_Height);
        _pageControl.frame = CGRectMake(Screen_Width/2 - Page_Control_Width/2, CGRectGetMaxY(_scrollView.frame) + 100, Page_Control_Width, Page_Control_Height);
        
        _timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(nextPage:) userInfo:nil repeats:YES];
    }
    if (self.imageArray && self.imageArray.count > 0) {
         _scrollView.contentSize = CGSizeMake(Screen_Width, _scrollView.frame.size.height);
        _pageControl.numberOfPages = self.imageArray.count;
        
        
    }
   
    
}
- (void) nextPage:(id) sender {
    if (sender && [sender isKindOfClass:[NSTimer class]]) {
        
        if (_pageControl.currentPage == 0) {
            isRight = YES;
        } else {
            isRight = NO;
        }
        
        if (isRight) {
            _pageControl.currentPage += 1;
            _scrollView.contentOffset = CGPointMake(Screen_Width * _pageControl.currentPage, 0);
            
        } else {
            _pageControl.currentPage -= 1;
            _scrollView.contentOffset = CGPointMake(Screen_Width * _pageControl.currentPage, 0);
        }
    }
}
@end
