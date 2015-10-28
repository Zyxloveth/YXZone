//
//  DynamicBgView.h
//  YXZone
//
//  Created by 中软mac028 on 15/10/11.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DynamicHeaderData.h"

@protocol DynamicBgViewDelegate <NSObject>

- (void) sayLittleAction;

@end

@interface DynamicBgView : UIView

@property (nonatomic,strong) DynamicHeaderData* data;
@property (nonatomic, weak) id<DynamicBgViewDelegate> delegate;

- (void) updateView;

@end
