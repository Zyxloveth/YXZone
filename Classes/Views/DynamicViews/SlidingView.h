//
//  SlidingView.h
//  YXZone
//
//  Created by 中软mac028 on 15/10/9.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol SlidingViewDelegate <NSObject>

- (void)bottomSubViewClick:(NSInteger) tag;
- (void)topSubViewClick:(NSInteger) tag;
@end

@interface SlidingView : UIView

@property (nonatomic, weak) id<SlidingViewDelegate> delegate;

@end
