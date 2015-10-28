//
//  ShuoShuoContentView.m
//  YXZone
//
//  Created by 中软mac028 on 15/10/12.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import "ShuoShuoContentView.h"

#define Content_One_Line_Height 18

@interface ShuoShuoContentView ()
{
    UITextView * _shuoShuoContent;
    UIImageView * _shuoShuoImage;
    UILabel * _uploadLocation;
    UILabel * _uploadAlbum;
   
}
@end

@implementation ShuoShuoContentView

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}


- (void) updateView {
     NSInteger numOfLine;
    if (self.contentText && self.contentText.length != 0 ) {
        if (self.contentText.length%20 == 0) {
            numOfLine = self.contentText.length/20;
        } else {
            numOfLine = self.contentText.length/20 + 1;
        }
    }
   
    
    
    
   
    _shuoShuoContent = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Content_One_Line_Height*numOfLine)];
    
    //_shuoShuoContent.textContainer.maximumNumberOfLines = 3;
    _shuoShuoContent.scrollEnabled = NO;
    _shuoShuoContent.textAlignment = NSTextAlignmentLeft;
    //_shuoShuoContent.backgroundColor = [UIColor clearColor];
    _shuoShuoContent.font = [UIFont systemFontOfSize:15];
   // _shuoShuoContent.backgroundColor = [UIColor grayColor];
    _shuoShuoContent.textContainerInset = UIEdgeInsetsMake(0, 0, 0, 0);
    _shuoShuoContent.editable = NO;
    _shuoShuoContent.text = self.contentText;
    
    [self addSubview:_shuoShuoContent];
    
    if (self.imageArray && self.imageArray > 0) {
        
        [self createImageViewWithNum:self.imageArray.count];
        
    }
    if (self.type == YXShuoShuoTypeUpload) {
        _uploadLocation = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(_shuoShuoImage.frame), 100, 25)];
        
        _uploadLocation.text = [NSString stringWithFormat:@"上传了%ld图片到相册",self.imageArray.count];
        _uploadLocation.font = [UIFont systemFontOfSize:10];
        _uploadLocation.textAlignment = NSTextAlignmentLeft;
        
        [self addSubview:_uploadLocation];
        
        _uploadAlbum = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_uploadLocation.frame), CGRectGetMaxY(_shuoShuoImage.frame), Screen_Width/2, 25)];
        
        _uploadAlbum.text = [NSString stringWithFormat:@"《%@》",self.albumName];
        _uploadAlbum.font = [UIFont systemFontOfSize:10];
        _uploadAlbum.textColor = [UIColor colorWithRed:104/255.0f green:201/255.0f blue:1.0f alpha:1.0f];
        
        [self addSubview:_uploadAlbum];
    }
    
    
    
}

- (void) createImageViewWithNum:(NSInteger) num {
    NSInteger width = (self.frame.size.width-40)/3;
    
    int index = 0;
    NSInteger lines;
    if (num >= 9) {
        lines = 3;
        num = 9;
    } else {
        lines = num/3;
    }
   
    for (int i = 0; i < lines; i++) {
        
        for (int j = 0; j < 3; j++) {
            _shuoShuoImage = [[UIImageView alloc] initWithFrame:CGRectMake(10 * (j+1) + j * width, i * width + 5 * (i+1) + CGRectGetMaxY(_shuoShuoContent.frame) , width, width)];
            _shuoShuoImage.image = [UIImage imageNamed:[self.imageArray objectAtIndex:index]];
            [self addSubview:_shuoShuoImage];
            
            index++;
        }
    }
    
    for (int k = 0; k < num - lines * 3; k++) {
        _shuoShuoImage = [[UIImageView alloc] initWithFrame:CGRectMake(10 * (k+1) + k * width, lines * width + 5 * (lines+1) + CGRectGetMaxY(_shuoShuoContent.frame), width, width)];
        _shuoShuoImage.image = [UIImage imageNamed:[self.imageArray objectAtIndex:index]];
        [self addSubview:_shuoShuoImage];
    }
 
}
@end
