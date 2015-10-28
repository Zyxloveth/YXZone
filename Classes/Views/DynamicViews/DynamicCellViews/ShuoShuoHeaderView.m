//
//  ShuoShuoHeaderView.m
//  YXZone
//
//  Created by 中软mac028 on 15/10/14.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import "ShuoShuoHeaderView.h"
#import "ShuoShuoHeaderData.h"

@interface ShuoShuoHeaderView ()
{
    UIImageView * _headerImage;
    UILabel * _personNameLabel;
    UILabel * _dateTimeLabel;
}
@end

@implementation ShuoShuoHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void) updateView {
    _headerImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    _headerImage.image = [UIImage imageNamed:self.data.headerImageName];
    
    [self addSubview:_headerImage];
    
    _personNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_headerImage.frame) + 5, 3, Screen_Width - CGRectGetMaxX(_headerImage.frame), 25)];
    _personNameLabel.text = self.data.personName;
    
    [self addSubview:_personNameLabel];
    
    _dateTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_headerImage.frame) + 5, CGRectGetMaxY(_personNameLabel.frame), Screen_Width - CGRectGetMaxX(_headerImage.frame), 20)];
    
    _dateTimeLabel.font = [UIFont systemFontOfSize:12];
    _dateTimeLabel.textColor = [UIColor colorWithRed:100/255.0f green:100/255.0f blue:100/255.0f alpha:0.5f];
    _dateTimeLabel.text = self.data.dateTime;
    
    [self addSubview:_dateTimeLabel];
    if (self.data.type == YXHeaderViewTypeReply) {
        UIImageView* replyImage = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width - 48, CGRectGetMinX(_headerImage.frame)+10, 18, 18)];
        replyImage.image = [UIImage imageNamed:@"header_reply.png"];
        
        [self addSubview:replyImage];
        
        UILabel* replyLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(replyImage.frame), CGRectGetMinX(_headerImage.frame) + 9, 28, 18)];
        replyLabel.font = [UIFont systemFontOfSize:12];
        replyLabel.textColor = [UIColor colorWithRed:63/255.0f green:118/255.0f blue:188/255.0f alpha:1.0f];
        replyLabel.text = @"回复";
        
        [self addSubview:replyLabel];
        
    }
}
@end
