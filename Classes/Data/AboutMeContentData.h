//
//  AboutMeContentData.h
//  YXZone
//
//  Created by 中软mac028 on 15/10/14.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, YXAboutCellContentType)
{
    YXAboutCellContentTypeImage,
    YXAboutCellContentTypeText
};

@interface AboutMeContentData : NSObject

@property (nonatomic, copy) NSString* myReplyText;
@property (nonatomic, copy) NSString* expressImage;
@property (nonatomic, assign) YXAboutCellContentType type;
@property (nonatomic, copy) NSString* expressPersonName;
@property (nonatomic, copy) NSString* expressContent;

@end
