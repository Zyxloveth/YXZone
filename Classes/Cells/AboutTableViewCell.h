//
//  AboutTableViewCell.h
//  YXZone
//
//  Created by 中软mac028 on 15/10/14.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AboutCellData.h"

@interface AboutTableViewCell : UITableViewCell

@property (nonatomic,strong) AboutCellData* data;

- (void) updateCellView;

@end
