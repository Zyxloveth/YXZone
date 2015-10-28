//
//  PlayView.m
//  YXZone
//
//  Created by 中软mac028 on 15/10/9.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import "PlayView.h"
#import "NewScrollView.h"

@interface PlayView ()
{

    
    
}
@end

@implementation PlayView

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self initView];
    }
    
    return self;
}
- (void) initView {
    self.backgroundColor = [UIColor whiteColor];
    
    UIImageView* image = [[UIImageView alloc] initWithFrame:CGRectMake(Screen_Width/2 - 100/2, 200, 100, 100)];
    
    image.image = [UIImage imageNamed:@"no_wifi.png"];
    
    [self addSubview:image];
    
}
@end
