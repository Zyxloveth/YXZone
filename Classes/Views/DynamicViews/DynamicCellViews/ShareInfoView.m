//
//  ShareInfoView.m
//  YXZone
//
//  Created by 中软mac028 on 15/10/12.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import "ShareInfoView.h"

#define Content_One_Line_Height 18

#define View_Width 60 - 6
#define View_Height 60 - 6

@interface ShareInfoView ()
{
    
    UIImageView * _shareImage;
    UILabel * _shareTitle;
    UITextView * _shareContent;
    UITextView * _expressContent;
    UIView * _bgView;
    
    UILabel * _appName;
}
@end

@implementation ShareInfoView

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       
    }
    return self;
}

- (void) updateView {
    NSInteger numOfLine;
    if (self.shareExpressText && self.shareExpressText.length != 0 ) {
        if (self.shareExpressText.length%20 == 0) {
            numOfLine = self.shareExpressText.length/20;
        } else {
            numOfLine = self.shareExpressText.length/20 + 1;
        }
    }
   
    _expressContent = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, Content_One_Line_Height * numOfLine)];
    _expressContent.scrollEnabled = NO;
    _expressContent.textAlignment = NSTextAlignmentLeft;
    _expressContent.font = [UIFont systemFontOfSize:15];
    _expressContent.textContainerInset = UIEdgeInsetsMake(0, 0, 0, 0);
    _expressContent.editable = NO;

   // _expressContent.backgroundColor = [UIColor redColor];
    
    _bgView = [[UIImageView alloc] initWithFrame:CGRectMake(3, CGRectGetMaxY(_expressContent.frame), self.frame.size.width, View_Height+6)];
    _bgView.backgroundColor = [UIColor colorWithRed:244/255.0f green:244/255.0f  blue:244/255.0f  alpha:1.0f];
    
    _shareImage = [[UIImageView alloc] initWithFrame:CGRectMake(3,3, View_Width, View_Height)];
    //_shareImage.backgroundColor = [UIColor redColor];
    
    _shareTitle = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_shareImage.frame) + 7, 3, self.frame.size.width - CGRectGetMaxX(_shareImage.frame) + 3, 20)];
    _shareTitle.textAlignment = NSTextAlignmentLeft;
    _shareTitle.font = [UIFont systemFontOfSize:12];
    
    
    _shareContent = [[UITextView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_shareImage.frame)+3,CGRectGetMaxY(_shareTitle.frame), Screen_Width - View_Width, View_Width - _shareTitle.frame.size.height)];
    
    _shareContent.textContainer.maximumNumberOfLines = 3;
    _shareContent.scrollEnabled = NO;
    _shareContent.textAlignment = NSTextAlignmentLeft;
    _shareContent.backgroundColor = [UIColor clearColor];
    _shareContent.font = [UIFont systemFontOfSize:8];
   // _shareContent.backgroundColor = [UIColor grayColor];
    _shareContent.textContainerInset = UIEdgeInsetsMake(0, 0, 0, 0);
    _shareContent.editable = NO;
    
    _appName = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(_shareContent.frame), self.frame.size.width, 25)];
    _appName.font = [UIFont systemFontOfSize:10];
    _appName.textColor = [UIColor colorWithRed:104/255.0f green:201/255.0f blue:1.0f alpha:1.0f];
    
    [_bgView addSubview:_shareImage];
    [_bgView addSubview:_shareTitle];
    [_bgView addSubview:_shareContent];
    [_bgView addSubview:_appName];
    
    [self addSubview:_expressContent];
    [self addSubview:_bgView];
    
   

    _appName.text = [NSString stringWithFormat:@"来自%@", self.shareAppName];
    _shareContent.text = self.shareContentText;
    _shareTitle.text = self.shareTitleText;
    _shareImage.image = [UIImage imageNamed:self.shareImageName];
    _expressContent.text = self.shareExpressText;
    
}
@end
