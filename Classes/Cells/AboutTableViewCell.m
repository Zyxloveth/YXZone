//
//  AboutTableViewCell.m
//  YXZone
//
//  Created by 中软mac028 on 15/10/14.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import "AboutTableViewCell.h"
#import "ShuoShuoHeaderView.h"
#import "AboutCellData.h"
#import "ReplyContentView.h"

@interface AboutTableViewCell ()
{
    UIView* _view;
    UIView* _topView;
    UIView* _middleView;
    
    ShuoShuoHeaderView* _headerView;
    ReplyContentView* _contentView;
    
    
}
@end

@implementation AboutTableViewCell

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
    
    _topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 60)];
    
    [_view addSubview:_topView];
    
    _middleView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_topView.frame), Screen_Width, 60)];
    
    [_view addSubview:_middleView];
    
    [self updateTopView];
    [self updateMiddleView];
}

- (void) updateTopView {
    _headerView = [[ShuoShuoHeaderView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, _topView.frame.size.height)];
    
    _headerView.data = self.data.headerData;
    [_headerView updateView];
    
    [_topView addSubview:_headerView];
}

- (void) updateMiddleView {
    _contentView = [[ReplyContentView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 70)];
    _contentView.data = self.data.contentData;
    
    [_contentView updateView];
    
    [_middleView addSubview:_contentView];
}

- (void) updateCellView {
    [self updateView];
    
}

@end
