//
//  ShareInfoView.h
//  YXZone
//
//  Created by 中软mac028 on 15/10/12.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShareInfoView : UIView

@property (nonatomic, copy) NSString* shareAppName;
@property (nonatomic, copy) NSString* shareImageName;
@property (nonatomic, copy) NSString* shareTitleText;
@property (nonatomic, copy) NSString* shareContentText;
@property (nonatomic, copy) NSString* shareExpressText;
- (void) updateView;
@end
