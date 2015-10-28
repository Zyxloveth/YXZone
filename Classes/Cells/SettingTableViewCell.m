//
//  SettingTableViewCell.m
//  YXZone
//
//  Created by 中软mac028 on 15/10/15.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import "SettingTableViewCell.h"

@interface SettingTableViewCell ()
{
    UIView* _view;
    UILabel* _nameLabel;
}
@end

@implementation SettingTableViewCell

- (void)awakeFromNib {
   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

  
}
- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initView];
    }
    return self;
}
- (void) initView {
    _view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 44)];
    [self.contentView addSubview:_view];
    
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 150, 44)];
    
    [_view addSubview:_nameLabel];
    
    UIImageView* arrow = [[UIImageView alloc] initWithFrame:CGRectMake(Screen_Width-20, 44/2 -14/2, 8, 14)];
    arrow.image = [UIImage imageNamed:@"arrow.png"];
    
    [_view addSubview:arrow];
}
- (void) updateCellView
{
    _nameLabel.text = self.settingName;
}
@end
