//
//  EngineInterface.h
//  YXZone
//
//  Created by 中软mac028 on 15/10/13.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface EngineInterface : NSObject
+ (instancetype) shareInstance;

- (NSArray*) getDynamicCellArray;
- (NSArray*) getAboutMeCellArray;
@end
