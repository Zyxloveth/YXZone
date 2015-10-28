//
//  ShuoShuoContentView.h
//  YXZone
//
//  Created by 中软mac028 on 15/10/12.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DynamicCellData.h"

@interface ShuoShuoContentView : UIView

@property (nonatomic, copy) NSString* contentText;
@property (nonatomic, strong) NSArray* imageArray;
@property (nonatomic, copy) NSString* albumName;
@property (nonatomic, assign) YXShuoShuoType type;
- (void) updateView;
@end
