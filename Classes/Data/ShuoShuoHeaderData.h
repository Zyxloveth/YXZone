//
//  ShuoShuoHeaderData.h
//  YXZone
//
//  Created by 中软mac028 on 15/10/14.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, YXHeaderViewType) {
    YXHeaderViewTypeNormal,
    YXHeaderViewTypeReply
};


@interface ShuoShuoHeaderData : NSObject

@property (nonatomic, copy) NSString* headerImageName;
@property (nonatomic, copy) NSString* personName;
@property (nonatomic, copy) NSString* dateTime;
@property (nonatomic, assign) YXHeaderViewType type;

@end
