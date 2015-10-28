//
//  AboutCellData.h
//  YXZone
//
//  Created by 中软mac028 on 15/10/14.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ShuoShuoHeaderData.h"
#import "AboutMeContentData.h"

@interface AboutCellData : NSObject

@property (nonatomic, strong) ShuoShuoHeaderData* headerData;
@property (nonatomic, strong) AboutMeContentData* contentData;



@end
