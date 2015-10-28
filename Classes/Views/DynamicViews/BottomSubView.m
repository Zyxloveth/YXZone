//
//  BottomSubView.m
//  YXZone
//
//  Created by 中软mac028 on 15/10/10.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import "BottomSubView.h"

#define Bottom_Image_Height 33
#define Bottom_Image_Width 33

@interface BottomSubView ()
{
    UIImageView* _imageView;
    UILabel* _label;
}
@end

@implementation BottomSubView

-(instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
        
    }
    return self;
}

- (void) initView {
    
    CGFloat viewHeight = self.frame.size.height;
    //CGFloat viewWidth = self.frame.size.width;
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(30, viewHeight/2 - Bottom_Image_Height/2, Bottom_Image_Width, Bottom_Image_Height)];
    
    [self addSubview:_imageView];
    _label = [[UILabel alloc] initWithFrame:CGRectMake(Bottom_Image_Width+30+10, viewHeight/2 - Bottom_Image_Height/2, 150, Bottom_Image_Height)];
    
    
    _label.font = [UIFont fontWithName:nil size:20];
    _label.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_label];
    
}
- (void) addNewTarget:(id)target action:(SEL)action {
    self->_target = target;
    self->_action = action;
    
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.target performSelectorInBackground:self->_action withObject:self->_target];
}
- (void) updateView {
    _imageView.image = [UIImage imageNamed:self.bottomImageName];
    _label.text = self.bottomTitle;
}
@end
