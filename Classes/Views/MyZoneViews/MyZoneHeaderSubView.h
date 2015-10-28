//
//  MyZoneHeaderSubView.h
//  YXZone
//
//  Created by 中软mac028 on 15/10/14.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MZSubViewType) {
    MZSubViewTypeNone,
    MZSubViewTypeImageAndText,
    MZSubViewTypeText
};

@interface MyZoneHeaderSubView : UIView

@property (nonatomic, assign) MZSubViewType type;
@property (nonatomic, copy) NSString* headerImageName;
@property (nonatomic, copy) NSString* headerText;
@property (nonatomic, copy) NSString* personName;
@property (nonatomic, copy) NSString* personImage;
@property (nonatomic, copy) NSString* tailText;

- (void) updateView;
@end
