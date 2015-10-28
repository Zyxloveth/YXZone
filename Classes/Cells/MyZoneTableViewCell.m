//
//  MyZoneTableViewCell.m
//  YXZone
//
//  Created by 中软mac028 on 15/10/14.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import "MyZoneTableViewCell.h"

@interface MyZoneTableViewCell ()
{
    UIView* _view;
}
@end

@implementation MyZoneTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initCellView];
    }
    return self;
}
- (void) initCellView {
    
    _view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 270)];
  
    [self.contentView addSubview:_view];
    NSArray* imageArray = [NSArray arrayWithObjects:@"shuoshuo_zone.png", @"album.png",@"daily.png",@"message.png",@"that_now.png",@"personal.png",@"my_collection.png",@"picture_copy.png",@"xiaowo.png",nil];
    NSArray* nameArray = [NSArray arrayWithObjects:@"说说 161",@"相册 345",@"日志 12",@"留言 39",@"那年今日",@"个性化",@"我的收藏",@"照片备份",@"小窝", nil];
    int index = 0;
    for (int i = 0; i < 9; i++) {
        
        [self createButtonWithFrame:CGRectMake((i%3) * (44 + 60) + 30 , (index/3)*(44+40)  + 20, 44, 44) imageName:[imageArray objectAtIndex:index] labelText:[nameArray objectAtIndex:index]];
        index++;
    }
    
}
- (void) createButtonWithFrame:(CGRect) frame imageName:(NSString*) imageName  labelText:(NSString*) labelText{
    UIButton* button = [[UIButton alloc] initWithFrame:frame];
    
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x, CGRectGetMaxY(button.frame) + 5, frame.size.width, 10)];
    label.font = [UIFont systemFontOfSize:10];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = labelText;
    
    [_view addSubview:button];
    [_view addSubview:label];
}
@end
