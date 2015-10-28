//
//  DynamicTableViewCell.m
//  YXZone
//
//  Created by 中软mac028 on 15/10/12.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import "DynamicTableViewCell.h"
#import "ShuoShuoContentView.h"
#import "ShareInfoView.h"
#import "DynamicBottomView.h"
#import "ShuoShuoHeaderView.h"


#define Top_View_Height 60
#define Bottom_View_Height 80
#define Middle_View_Height 100

@interface DynamicTableViewCell ()<DynamicBottomViewDelegate>
{
    UIView * _view;
    
    UIView * _topView;
    UIView * _middleView;
    UIView * _bottomView;
    
    ShuoShuoHeaderView* _headerView;
    
    ShuoShuoContentView* _shuoShuo;
    
    ShareInfoView* _shareInfo;
    
    UIImageView * _phoneImage;
    UILabel * _phoneName;
    
    DynamicBottomView* _operateView;
    
    CGFloat _middleHeight;
    
}

@end

@implementation DynamicTableViewCell

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}
- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    
    return self;
}

- (void) updateView {
    
   
    
    _view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 300.0f)];
    
    [self.contentView addSubview:_view];
        
    _topView = [[UIView alloc] initWithFrame:CGRectMake(0, 10, Screen_Width, Top_View_Height)];
    
    [_view addSubview:_topView];
    
    _middleHeight = 0;
    NSInteger line = 0;
    CGFloat expressHeight = 0;
    if (self.data.comeFromType == YXComeFromTypeApplication) {
        _middleHeight = 95;
        expressHeight = [self expressHeight:self.data.shareExpressText];
    } else if(self.data.comeFromType == YXComeFromTypePhone) {
        if (self.data.shuoShuoImageArray.count >= 9) {
            line = 3;
        } else {
            line =self. data.shuoShuoImageArray.count / 3 + 1;
        }
        CGFloat imageHeight = line * (Screen_Width - 40)/3 + 20 ;
        _middleHeight += imageHeight;
        if (self.data.shuoShuoType == YXShuoShuoTypeUpload) {
            _middleHeight += 15;
        }
        expressHeight = [self expressHeight:self.data.shuoShuoContent];
        _middleHeight += expressHeight;
    }
    
    _middleView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_topView.frame), Screen_Width, _middleHeight)];
   
    [_view addSubview:_middleView];
    if (self.data.comeFromType == YXComeFromTypePhone) {
        _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_middleView.frame) + 25, Screen_Width, Bottom_View_Height)];
    } else {
          _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_middleView.frame), Screen_Width, Bottom_View_Height)];
    }
    
   
    [_view addSubview:_bottomView];
    
    
    
    [self updateTopView];
    [self updateMiddleView];
    [self updateBottomView];
    
}
- (NSInteger) expressHeight:(NSString*) text{
    NSInteger numOfLine;
    if (text && text.length != 0 ) {
        if (text.length%20 == 0) {
            numOfLine = text.length/20;
        } else {
            numOfLine = text.length/20 + 1;
        }
    }
    return numOfLine*18;
}
- (void) updateTopView {
    
    _headerView = [[ShuoShuoHeaderView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Top_View_Height)];
   
    _headerView.data = self.data.headerdata;
    
    [_headerView updateView];
    
    [_topView addSubview:_headerView];

    
    
    
}

- (void) updateMiddleView {
    if (self.data.comeFromType == YXComeFromTypeApplication) {
        
        _shareInfo = [[ShareInfoView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Middle_View_Height)];
        [_middleView addSubview:_shareInfo];
        
    } else if (self.data.comeFromType == YXComeFromTypePhone) {
        _shuoShuo = [[ShuoShuoContentView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, _middleHeight)];
        _phoneImage  = [[UIImageView alloc] initWithFrame:CGRectMake( 10, CGRectGetMaxY(_shuoShuo.frame), 25, 25)];
        _phoneImage.image = [UIImage imageNamed:@"phone.png"];
        _phoneName = [[UILabel alloc] initWithFrame:CGRectMake( CGRectGetMaxX(_phoneImage.frame) + 5, CGRectGetMaxY(_shuoShuo.frame), 150, 25)];
        _phoneName.font = [UIFont systemFontOfSize:12];
        _phoneName.text = self.data.phoneName;
        _phoneName.textColor = [UIColor colorWithRed:104/255.0f green:201/255.0f blue:1.0f alpha:1.0f];
        
        [_middleView addSubview:_shuoShuo];
        [_middleView addSubview:_phoneImage];
        [_middleView addSubview:_phoneName];
    }
    
}


- (void) updateBottomView {
    
    _operateView = [[DynamicBottomView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Bottom_View_Height)];
    _operateView.delegate = self;
    [_bottomView addSubview:_operateView];
    
    
}
- (void) commentAction
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(cellCommentAction)]) {
        [self.delegate cellCommentAction];
    }
}
- (void) sayOneWordAction
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(cellSayOneWordAction)]) {
        [self.delegate cellSayOneWordAction];
    }
}

- (void) updateCellView {
   
    if (self.data) {
         [self updateView];
        
        
        
        
        
        if (_shuoShuo != nil) {
            _shuoShuo.contentText = self.data.shuoShuoContent;
            _shuoShuo.imageArray = self.data.shuoShuoImageArray;
            _shuoShuo.type = self.data.shuoShuoType;
            _shuoShuo.albumName = self.data.albumName;
            [_shuoShuo updateView];
        }
        if (_shareInfo != nil) {
            
            _shareInfo.shareAppName = self.data.shareAppName;
            _shareInfo.shareContentText = self.data.shareContentText;
            _shareInfo.shareTitleText = self.data.shareTitleText;
            _shareInfo.shareExpressText = self.data.shareExpressText;
            _shareInfo.shareImageName = self.data.shareImageName;
            
            [_shareInfo updateView];
        }
        
        if (_operateView != nil) {
            _operateView.visitCount = self.data.visitCount;
            _operateView.praiseImageArray = self.data.praiseImageArray;
            
            [_operateView updateView];
        }
    }
    
   
    
}

- (void) removeAll {
    [_view removeFromSuperview];
}
@end
