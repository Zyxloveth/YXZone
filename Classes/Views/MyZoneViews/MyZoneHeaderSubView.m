//
//  MyZoneHeaderSubView.m
//  YXZone
//
//  Created by 中软mac028 on 15/10/14.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import "MyZoneHeaderSubView.h"

@interface MyZoneHeaderSubView ()
{
    UIImageView* _headerImageView;
    UILabel* _headerLabel;
    
}
@end

@implementation MyZoneHeaderSubView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}
- (void) initView {
    _headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, (44 - 25) / 2, 25, 25)];
    
    _headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_headerImageView.frame) + 5,  (44 - 25) / 2, 80, 25)];
    
    UIImageView* arrowView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width - 30, (44 - 14) / 2, 8, 14)];
    
    arrowView.image = [UIImage imageNamed:@"arrow.png"];
    
    
    [self addSubview:_headerImageView];
    [self addSubview:_headerLabel];
    [self addSubview:arrowView];
}
- (void) updateView {
    _headerImageView.image = [UIImage imageNamed:self.headerImageName];
    _headerLabel.text = self.headerText;
}
@end
