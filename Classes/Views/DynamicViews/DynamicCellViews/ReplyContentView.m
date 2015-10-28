//
//  ShareInfoView.m
//  YXZone
//
//  Created by 中软mac028 on 15/10/12.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import "ReplyContentView.h"

#define Content_One_Line_Height 18

#define View_Width 60 - 6
#define View_Height 60 - 6

@interface ReplyContentView ()
{
    
    UIImageView * _expressImage;
    UILabel * _expressPersonName;
    UILabel * _expressContent;
    
    UITextView * _myReplyText;
    UIView * _bgView;

}
@end

@implementation ReplyContentView

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void) updateView {
    
    if (self.data) {
        NSInteger numOfLine;
        if (self.data.myReplyText && self.data.myReplyText.length != 0 ) {
            if (self.data.myReplyText.length%20 == 0) {
                numOfLine = self.data.myReplyText.length/20;
            } else {
                numOfLine = self.data.myReplyText.length/20 + 1;
            }
        }
        
        _myReplyText = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, Content_One_Line_Height * numOfLine)];
        _myReplyText.scrollEnabled = NO;
        _myReplyText.textAlignment = NSTextAlignmentLeft;
        _myReplyText.font = [UIFont systemFontOfSize:15];
        _myReplyText.textContainerInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _myReplyText.editable = NO;
        _myReplyText.text = self.data.myReplyText;
        
        _bgView = [[UIImageView alloc] initWithFrame:CGRectMake(3, CGRectGetMaxY(_myReplyText.frame)+5, self.frame.size.width, View_Height+6)];
        _bgView.backgroundColor = [UIColor colorWithRed:244/255.0f green:244/255.0f  blue:244/255.0f  alpha:1.0f];
        if (self.data.type == YXAboutCellContentTypeImage) {
            _expressImage = [[UIImageView alloc] initWithFrame:CGRectMake(3,3, View_Width, View_Height)];
            _expressImage.image = [UIImage imageNamed:self.data.expressImage];

            [_bgView addSubview:_expressImage];
        }
        
        
        _expressPersonName = [[UILabel alloc] initWithFrame:CGRectMake(0,0,0,0)];
        _expressPersonName.textAlignment = NSTextAlignmentLeft;
        _expressPersonName.font = [UIFont systemFontOfSize:14];
        _expressPersonName.numberOfLines = 0;
        _expressPersonName.textColor = [UIColor colorWithRed:63/255.0f green:118/255.0f blue:188/255.0f alpha:1.0f];
        _expressPersonName.text = [NSString stringWithFormat:@"%@:",self.data.expressPersonName];
        
        CGRect labelRect = [self.data.expressPersonName boundingRectWithSize:CGSizeMake(self.frame.size.width - View_Width, 20) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: _expressPersonName.font} context:nil];
        
        
        _expressPersonName.frame = CGRectMake(CGRectGetMaxX(_expressImage.frame) + 7, 20, labelRect.size.width+5, 20);
        
        [_bgView addSubview:_expressPersonName];
        
        _expressContent = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_expressPersonName.frame) ,20,self.frame.size.width-CGRectGetMaxX(_expressPersonName.frame),20)];
        
        _expressContent.font = [UIFont systemFontOfSize:14];
        _expressContent.text = self.data.expressContent;
        _expressContent.textAlignment = NSTextAlignmentLeft;
        
        [_bgView addSubview:_expressContent];
        
        
        [self addSubview:_myReplyText];
        [self addSubview:_bgView];
        

    }
    
    
    
 
    
}
@end
