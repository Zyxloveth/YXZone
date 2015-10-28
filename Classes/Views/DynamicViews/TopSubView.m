//
//  TopSubView.m
//  YXZone
//
//  Created by 中软mac028 on 15/10/10.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import "TopSubView.h"
#define Top_Image_Width 44
#define Top_Image_Height 44

@interface TopSubView ()
{
    UIImageView* _imageView;
    UILabel* _label;
}
@end

@implementation TopSubView

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    
    return self;
}

- (void) initView {
    
    CGFloat superWidth = self.frame.size.width;
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(superWidth/2-Top_Image_Width/2, 0, Top_Image_Width, Top_Image_Height)];
    
    [self addSubview:_imageView];
    _label = [[UILabel alloc] initWithFrame:CGRectMake(superWidth/2-Top_Image_Width/2, 45, Top_Image_Width, 10)];
    
    _label.font = [UIFont fontWithName:nil size:10];
    _label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_label];
    
}

- (void) updateView {
    
    _imageView.image = [UIImage imageNamed:self.topImageName];
    _label.text = self.topTitle;
    
}
#pragma mark - AddAction
- (void) addNewTarget:(id)target action:(SEL)action {
    self->_target = target;
    self->_action = action;
    
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.target performSelectorInBackground:self->_action withObject:self->_target];
}

@end
