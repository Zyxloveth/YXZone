//
//  DynamicBottomView.h
//  YXZone
//
//  Created by 中软mac028 on 15/10/12.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  DynamicBottomViewDelegate <NSObject>

- (void) sayOneWordAction;
- (void) commentAction;

@end

@interface DynamicBottomView : UIView

@property (nonatomic, assign) NSInteger visitCount;
@property (nonatomic, strong) NSArray* praiseImageArray;
@property (nonatomic, weak) id<DynamicBottomViewDelegate> delegate;

- (void) updateView;

@end
