//
//  TopSubView.h
//  YXZone
//
//  Created by 中软mac028 on 15/10/10.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopSubView : UIView

@property (nonatomic, copy) NSString* topImageName;
@property (nonatomic, copy) NSString* topTitle;
@property (nonatomic, strong) id target;
@property (nonatomic, assign) SEL action;

- (void) updateView;
- (void) addNewTarget:(id)target action:(SEL)action;
@end
