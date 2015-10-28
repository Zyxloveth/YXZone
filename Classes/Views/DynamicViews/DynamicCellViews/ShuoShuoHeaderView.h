//
//  ShuoShuoHeaderView.h
//  YXZone
//
//  Created by 中软mac028 on 15/10/14.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShuoShuoHeaderData;

@interface ShuoShuoHeaderView : UIView

@property (nonatomic, strong) ShuoShuoHeaderData* data;


- (void) updateView;
@end
