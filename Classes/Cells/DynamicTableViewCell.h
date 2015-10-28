//
//  DynamicTableViewCell.h
//  YXZone
//
//  Created by 中软mac028 on 15/10/12.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DynamicCellData.h"

@protocol DynamicTableViewCellDelegate <NSObject>

- (void) cellSayOneWordAction;
- (void) cellCommentAction;

@end

@interface DynamicTableViewCell : UITableViewCell

@property (nonatomic, strong) DynamicCellData* data;
@property (nonatomic, weak) id<DynamicTableViewCellDelegate> delegate;

- (void) updateCellView;

- (void) removeAll;
@end
