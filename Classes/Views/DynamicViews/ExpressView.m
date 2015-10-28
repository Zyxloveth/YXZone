//
//  ExpressView.m
//  YXZone
//
//  Created by 中软mac028 on 15/10/16.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import "ExpressView.h"

#define Top_Distance 5

@interface ExpressView ()<UITextFieldDelegate>
{
    UIView* _view;
    
    UIImageView* _atView;
    UIImageView* _faceView;
    UIImageView* _photoView;
    UIImageView* _scretView;
    
    UITextField* _expressField;
    UIButton* _expressButton;
}


@end
@implementation ExpressView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}
- (void) initView {
    _view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 50)];
    [self addSubview:_view];
    
    _atView = [[UIImageView alloc] initWithFrame:CGRectMake(10, Top_Distance, 24, 24)];
    _atView.image = [UIImage imageNamed:@"express_at.png"];
    
    [_view addSubview:_atView];
    
    _faceView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_atView.frame)+5, Top_Distance, 24, 24)];
    _faceView.image = [UIImage imageNamed:@"express_face.png"];
    
    [_view addSubview:_faceView];
    
    _photoView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_faceView.frame)+5, Top_Distance, 24, 24)];
    _photoView.image = [UIImage imageNamed:@"express_photo.png"];
    
    [_view addSubview:_photoView];
    
    _scretView = [[UIImageView alloc] initWithFrame:CGRectMake(Screen_Width-5-24, Top_Distance, 24, 24)];
    _scretView.image = [UIImage imageNamed:@"express_secret.png"];
    
    [_view addSubview:_scretView];
    
    _expressField = [[UITextField alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(_atView.frame)+5, Screen_Width-53-5, 24)];
    _expressField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _expressField.layer.borderWidth = 0.3f;
    _expressField.layer.borderColor = [UIColor blackColor].CGColor;
    _expressField.delegate = self;
    [_expressField becomeFirstResponder];
    
    [_view addSubview:_expressField];
    
    _expressButton = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_expressField.frame)+3, CGRectGetMaxY(_atView.frame)+5, Screen_Width-53, 24)];
    [_expressButton setTitle:@"发表" forState:UIControlStateNormal];
    [_expressButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _expressButton.titleLabel.text = @"发表";
    [_expressButton setBackgroundColor:[UIColor colorWithRed:244/255.0f green:244/255.0f blue:244/255.0f alpha:1.0f]];
    [_expressButton addTarget:self action:@selector(expressFinished:) forControlEvents:UIControlEventTouchUpInside];
    [_view addSubview:_expressButton];
    
    
}
#pragma mark - TextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_expressField resignFirstResponder];
    if (self.delegate && [self.delegate respondsToSelector:@selector(expressWhenEditFinished)]) {
        [self.delegate expressWhenEditFinished];
    }
    return YES;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (string.length > 0) {
        _expressButton.backgroundColor = [UIColor greenColor];
    } else {
        _expressButton.backgroundColor = [UIColor grayColor];
    }
    return YES;
}
- (void) expressFinished:(id) sender
{
    [_expressField resignFirstResponder];
    if (sender && [sender isKindOfClass:[UIButton class]]) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(expressWhenEditFinished)]) {
            [self.delegate expressWhenEditFinished];
        }

    }
}
@end
