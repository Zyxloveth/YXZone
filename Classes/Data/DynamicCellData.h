//
//  DynamicCellData.h
//  YXZone
//
//  Created by 中软mac028 on 15/10/12.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ShuoShuoHeaderData.h"

typedef NS_ENUM(NSInteger, YXComeFromType) {
    YXComeFromTypeNone,
    YXComeFromTypePhone,
    YXComeFromTypeApplication
};
typedef NS_ENUM(NSInteger, YXShuoShuoType) {
    YXShuoShuoTypeNone,
    YXShuoShuoTypeUpload
};

@interface DynamicCellData : NSObject

@property (nonatomic, strong) ShuoShuoHeaderData* headerdata;

@property (nonatomic, copy) NSString* phoneName;
@property (nonatomic, copy) NSString* shuoShuoContent;
@property (nonatomic, strong) NSArray* shuoShuoImageArray;
@property (nonatomic, copy) NSString* albumName;
@property (nonatomic, copy) NSString* comeFrom;
@property (nonatomic, assign) YXComeFromType comeFromType;
@property (nonatomic, assign) YXShuoShuoType shuoShuoType;
@property (nonatomic, assign) NSInteger visitCount;
@property (nonatomic, strong) NSArray* praiseImageArray;
@property (nonatomic, copy) NSString* shareAppName;
@property (nonatomic, copy) NSString* shareImageName;
@property (nonatomic, copy) NSString* shareTitleText;
@property (nonatomic, copy) NSString* shareContentText;
@property (nonatomic, copy) NSString* shareExpressText;



@end
