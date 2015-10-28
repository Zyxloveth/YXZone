//
//  DynamicBottomView.m
//  YXZone
//
//  Created by 中软mac028 on 15/10/12.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import "DynamicBottomView.h"

#define Operat_View_Width 21
#define Operat_View_Height 21

#define Person_Header_Width (self.frame.size.width - 40 - 46) / 8

@interface DynamicBottomView ()
{
    UIImageView* _shareImageView;
    UIImageView* _praiseImageView;
    UIImageView* _commentImageView;
    
    UIImageView* _visitorView;
    UILabel* _visitorCountLabel;
    
    UIImageView* _praisePerson;
    UIImageView* _praisePersonHeaderImage;
    
    UILabel* _sayOneWord;
    UIView* _speratorView;
    UIImageView* _emotionImageView;
    
    UIView* _commentView;
    UIView* _myCommentView;
}
@end

@implementation DynamicBottomView

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //[self initView];
    }
    
    return self;
}

- (void) initView {

    _shareImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, Operat_View_Width, Operat_View_Height)];
    _shareImageView.image = [UIImage imageNamed:@"share.png"];
    
    [self addSubview:_shareImageView];
    
    _commentImageView = [[UIImageView alloc] initWithFrame:CGRectMake( self.frame.size.width - 10 - Operat_View_Width , 0, Operat_View_Width, Operat_View_Height)];
    _commentImageView.image = [UIImage imageNamed:@"comment.png"];
    _commentImageView.userInteractionEnabled = YES;
    
    [self addSubview:_commentImageView];
    
    UITapGestureRecognizer* commentTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(commentClick:)];
    [_commentImageView addGestureRecognizer:commentTap];
    
    _praiseImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMinX(_commentImageView.frame) - 20 - Operat_View_Width, 0, Operat_View_Width, Operat_View_Height)];
    _praiseImageView.image = [UIImage imageNamed:@"praise_normal.png"];
    
    [self addSubview:_praiseImageView];
    
    _visitorView = [[UIImageView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(_shareImageView.frame) + 10, 15, 15)];
    
    _visitorView.image = [UIImage imageNamed:@"visitor_count.png"];
    [self addSubview:_visitorView];
    
    _visitorCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_visitorView.frame) + 5, CGRectGetMaxY(_shareImageView.frame) + 10, 80, 15)];
    _visitorCountLabel.textColor = [UIColor colorWithRed:104/255.0f green:201/255.0f blue:1.0f alpha:1.0f];
    _visitorCountLabel.font = [UIFont systemFontOfSize:10];
    
    [self addSubview:_visitorCountLabel];
    
    _praisePerson = [[UIImageView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(_visitorView.frame)+15, 15, 15)];
    _praisePerson.image = [UIImage imageNamed:@"praise_person.png"];
    
    [self addSubview:_praisePerson];
    
    
    _commentView = [[UIView alloc] init];
    [self addSubview:_commentView];
    
    _myCommentView = [[UIView alloc] init];
    
    //_myCommentView.backgroundColor = [UIColor grayColor];
    _myCommentView.layer.borderWidth = 0.4f;
    _myCommentView.layer.borderColor = [UIColor colorWithRed:100/255.0f green:100/255.0f blue:100/255.0f alpha:0.5f].CGColor;
    _myCommentView.userInteractionEnabled = YES;
    
    [self addSubview:_myCommentView];
    
    _sayOneWord = [[UILabel alloc] init];
    _sayOneWord.font = [UIFont systemFontOfSize:12];
    _sayOneWord.text = @"我也说一句...";
    _sayOneWord.textColor = [UIColor colorWithRed:100/255.0f green:100/255.0f blue:100/255.0f alpha:0.5f];
    
    _sayOneWord.userInteractionEnabled = YES;
    
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sayOneWordClick:)];
    [_sayOneWord addGestureRecognizer:tap];
    
    [_myCommentView addSubview:_sayOneWord];
    
    _speratorView = [[UIView alloc] init];
    _speratorView.backgroundColor = [UIColor colorWithRed:100/255.0f green:100/255.0f blue:100/255.0f alpha:0.5f];
    [_myCommentView addSubview:_speratorView];
    
    _emotionImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_sayOneWord.frame)+5, 0, 30, 30)];
    _emotionImageView.image = [UIImage imageNamed:@"emotion.png"];
    
    [_myCommentView addSubview:_emotionImageView];
}

- (void) updateView {
    
    [self initView];
    
    _visitorCountLabel.text = [NSString stringWithFormat:@"浏览%ld次", self.visitCount];
    [self createPersonHeaderImageView];
    _commentView.frame = CGRectMake(10, CGRectGetMaxY(_praisePersonHeaderImage.frame)+5, 0, 0);
    
    _myCommentView.frame = CGRectMake(10, CGRectGetMaxY(_commentView.frame)+7, self.frame.size.width - 20, 30);
    _sayOneWord.frame = CGRectMake(10, 0, _myCommentView.frame.size.width-50, 30);
    _speratorView.frame = CGRectMake(CGRectGetMaxX(_sayOneWord.frame), 5, 0.5, 20);
    _emotionImageView.frame = CGRectMake(CGRectGetMaxX(_sayOneWord.frame)+5, 0, 30, 30);
    
    
}

- (void) createPersonHeaderImageView {
    
    NSInteger lines;
    BOOL isOut = NO;
    NSInteger numOfFirstLine = 0;
   
    if (self.praiseImageArray && self.praiseImageArray.count > 0) {
        if ( self.praiseImageArray.count <= 8) {
            numOfFirstLine = self.praiseImageArray.count;
            lines = 1;
            
        } else if ( self.praiseImageArray.count <= 15 ){
            numOfFirstLine = 8;
            lines = 2;
            isOut = NO;
        } else {
            numOfFirstLine = 8;
            lines = 2;
            isOut = YES;
        }
    }
   
    for (int j = 0; j < lines; j++) {
        if (j == 1) {
            
            if (isOut) {
                for (int i = 0; i < 8; i++) {
                    if (i == 7) {
                        _praisePersonHeaderImage = [[UIImageView alloc] init];
                        [self addSubview:_praisePersonHeaderImage];
                       _praisePersonHeaderImage.frame = CGRectMake(CGRectGetMaxX(_praisePerson.frame)*(i+1) + 10 * i  + 10, 15+Person_Header_Width + CGRectGetMaxY(_visitorView.frame), Person_Header_Width, Person_Header_Width );
                       _praisePersonHeaderImage.image = [UIImage imageNamed:@"number.png"];
                        
                    } else {
                        _praisePersonHeaderImage = [[UIImageView alloc] init];
                        [self addSubview:_praisePersonHeaderImage];
                        _praisePersonHeaderImage.frame = CGRectMake(CGRectGetMaxX(_praisePerson.frame)*(i+1) + 10 * i+ 10, 15+Person_Header_Width + CGRectGetMaxY(_visitorView.frame), Person_Header_Width, Person_Header_Width );
                        _praisePersonHeaderImage.image = [UIImage imageNamed:[self.praiseImageArray objectAtIndex:i]];
                    }
                    
                }
            } else {
                for (int i = 0; i < self.praiseImageArray.count - 8; i++) {
                    _praisePersonHeaderImage = [[UIImageView alloc] init];
                    [self addSubview:_praisePersonHeaderImage];
                    _praisePersonHeaderImage.frame = CGRectMake(CGRectGetMaxX(_praisePerson.frame)*(i+1) + 10 * i+ 10,  15+Person_Header_Width + CGRectGetMaxY(_visitorView.frame), Person_Header_Width, Person_Header_Width );
                    _praisePersonHeaderImage.image = [UIImage imageNamed:[self.praiseImageArray objectAtIndex:i]];
                }
            }
            
        } else if (j == 0) {
            
            for (int i = 0; i <numOfFirstLine; i++) {
                _praisePersonHeaderImage = [[UIImageView alloc] init];
                [self addSubview:_praisePersonHeaderImage];
                _praisePersonHeaderImage.frame = CGRectMake(CGRectGetMaxX(_praisePerson.frame)*(i+1) + 10 * i + 10, CGRectGetMaxY(_visitorView.frame) + 10, Person_Header_Width, Person_Header_Width );
                _praisePersonHeaderImage.image = [UIImage imageNamed:[self.praiseImageArray objectAtIndex:i]];
                
            }
            
        }
        
    }
  
}
- (void) commentClick: (id) sender
{
    if (sender && [sender isKindOfClass:[UITapGestureRecognizer class]]) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(commentAction)]) {
            [self.delegate commentAction];
        }
    }
}
- (void) sayOneWordClick: (id) sender {
    if (sender && [sender isKindOfClass:[UITapGestureRecognizer class]]) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(sayOneWordAction)]) {
            [self.delegate sayOneWordAction];
        }
    }
   
}
@end
