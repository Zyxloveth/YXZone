//
//  ExpressView.h
//  YXZone
//
//  Created by 中软mac028 on 15/10/16.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  ExpressViewDelegate<NSObject>

- (void) expressWhenEditFinished;

@end

@interface ExpressView : UIView
@property (nonatomic,weak) id<ExpressViewDelegate> delegate;
@end
