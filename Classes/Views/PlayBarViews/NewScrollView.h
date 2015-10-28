//
//  NewScrollView.h
//  YXZone
//
//  Created by 中软mac028 on 15/10/15.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, YXNewScrollType) {
    YXNewScrollTypeNone,
    YXNewScrollTypeBanner,
    YXNewScrollTypeWelcome
};

@interface NewScrollView : UIView

@property (nonatomic, strong) NSArray* imageArray;
@property (nonatomic, assign) YXNewScrollType type;

- (instancetype) initWithFrame:(CGRect)frame type:(YXNewScrollType) type;
- (void) updateView;
@end
