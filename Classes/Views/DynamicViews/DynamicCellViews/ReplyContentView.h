//
//  ReplyContentView.h
//  YXZone
//
//  Created by 中软mac028 on 15/10/14.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AboutMeContentData.h"

@interface ReplyContentView : UIView

@property (nonatomic, strong)  AboutMeContentData* data;


- (void) updateView;
@end
