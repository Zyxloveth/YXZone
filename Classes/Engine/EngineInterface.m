//
//  EngineInterface.m
//  YXZone
//
//  Created by 中软mac028 on 15/10/13.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import "EngineInterface.h"
#import "DynamicCellData.h"
#import "ShuoShuoHeaderData.h"
#import "AboutMeContentData.h"
#import "AboutCellData.h"

@interface EngineInterface ()
{
    NSMutableArray* _array;
    NSMutableArray* _aboutArray;
}

@end

static EngineInterface* instance;

@implementation EngineInterface


+ (instancetype) shareInstance {
    
    @synchronized(self) {
        if (instance == nil) {
            instance = [[EngineInterface alloc] init];
        }
    }
    return instance;
}

- (NSArray*) getDynamicCellArray
{
    if (_array == nil) {
        
        _array = [[NSMutableArray alloc] init];
        
        DynamicCellData* data = [[DynamicCellData alloc] init];
        ShuoShuoHeaderData* headerData = [[ShuoShuoHeaderData alloc] init];
        
        headerData.headerImageName = @"header_image.png";
        headerData.personName = @"梦醒了";
        headerData.dateTime = @"今天14:57";
        headerData.type = YXHeaderViewTypeNormal;
        
        data.headerdata = headerData;
        data.phoneName = @"iPhone 6";
        data.comeFromType = YXComeFromTypePhone;
        data.shuoShuoContent = @"我就炫耀一下!我就炫耀一下!我就炫耀一下!我就炫耀一下!我就炫耀一下!我就炫耀一下!我就炫耀一下!";
        data.shuoShuoImageArray = [NSArray arrayWithObjects:@"zone.png",@"zone.png",@"zone.png",@"zone.png", @"zone.png",@"zone.png",@"zone.png",@"zone.png",nil];
        data.shuoShuoType = YXShuoShuoTypeUpload;
        data.albumName = @"我的相册";
        data.visitCount = 11;
        data.praiseImageArray = [NSArray arrayWithObjects:@"zone.png",@"zone.png",@"zone.png",@"zone.png",@"zone.png",@"zone.png",@"zone.png",@"zone.png", nil];
        
        [_array addObject:data];
        
        DynamicCellData* data1 = [[DynamicCellData alloc] init];
        ShuoShuoHeaderData* headerData1 = [[ShuoShuoHeaderData alloc] init];
        
        headerData1.headerImageName = @"header_image.png";
        headerData1.personName = @"鞋壳里的橘子皮";
        headerData1.dateTime = @"今天14:58";
        headerData1.type = YXHeaderViewTypeNormal;
        
        data1.headerdata = headerData1;
        data1.phoneName = @"iPhone 6";
        data1.comeFromType = YXComeFromTypeApplication;
        
        data1.shareExpressText = @"帮我赢iPhone 6s";
        data1.shareImageName = @"zone.png";
        data1.shareTitleText = @"帮我砍价吧！";
        data1.shareContentText = @"让小伙伴们一起砍～砍～砍";
        data1.shareAppName = @"集分宝";
        
        data1.visitCount = 11;
        data1.praiseImageArray = [NSArray arrayWithObjects:@"zone.png",@"zone.png",@"zone.png",@"zone.png",@"zone.png",@"zone.png",@"zone.png",@"zone.png",@"zone.png",@"zone.png",@"zone.png", nil];
        
        [_array addObject:data1];
        
        DynamicCellData* data2 = [[DynamicCellData alloc] init];
        ShuoShuoHeaderData* headerData2 = [[ShuoShuoHeaderData alloc] init];
        
        headerData2.headerImageName = @"header_image.png";
        headerData2.personName = @"我们都是好孩子";
        headerData2.dateTime = @"昨天4:58";
        headerData2.type = YXHeaderViewTypeNormal;
        
        data2.headerdata = headerData2;
        data2.phoneName = @"iPhone 6s";
        data2.comeFromType = YXComeFromTypeApplication;
        
        data2.shareExpressText = @"心灵鸡汤和呵护good";
        data2.shareImageName = @"zone.png";
        data2.shareTitleText = @"一起鸡汤吧～";
        data2.shareContentText = @"放飞心灵，放飞梦想";
        data2.shareAppName = @"鸡汤";
        
        data2.visitCount = 11;
        data2.praiseImageArray = [NSArray arrayWithObjects:@"zone.png",@"zone.png",@"zone.png",nil];
        
        [_array addObject:data2];
        
    }
    
    return _array;
}
- (NSArray*) getAboutMeCellArray {
    if (_aboutArray == nil) {
        
        _aboutArray = [[NSMutableArray alloc] init];
        
        ShuoShuoHeaderData* headerData1 = [[ShuoShuoHeaderData alloc] init];
        
        headerData1.headerImageName = @"header_image.png";
        headerData1.personName = @"梦醒了";
        headerData1.dateTime = @"今天14:57";
        headerData1.type = YXHeaderViewTypeReply;
        
        AboutMeContentData* contentData1 = [[AboutMeContentData alloc] init];
        
        contentData1.myReplyText = @"哈哈哈哈哈，好腻害！你就得瑟得瑟得瑟得瑟得瑟得瑟得瑟得瑟得瑟得瑟得瑟得瑟ba";
        contentData1.expressImage = @"zone.png";
        contentData1.type = YXAboutCellContentTypeImage;
        contentData1.expressPersonName = @"大神";
        contentData1.expressContent = @"我厉害么？";
        
        AboutCellData* cellData1 = [[AboutCellData alloc] init];
        cellData1.headerData = headerData1;
        cellData1.contentData = contentData1;
        [_aboutArray addObject:cellData1];
        
        ShuoShuoHeaderData* headerData = [[ShuoShuoHeaderData alloc] init];
        
        headerData.headerImageName = @"header_image.png";
        headerData.personName = @"鞋壳里的撅屁";
        headerData.dateTime = @"今天14:58";
        headerData.type = YXHeaderViewTypeReply;
        
        AboutMeContentData* contentData = [[AboutMeContentData alloc] init];
        
        contentData.myReplyText = @"哈哈哈哈哈，好腻害！";
        contentData.expressImage = @"zone.png";
        contentData.type = YXAboutCellContentTypeImage;
        contentData.expressPersonName = @"我要瘦成一道闪电";
        contentData.expressContent = @"我厉害么？";
        
        AboutCellData* cellData = [[AboutCellData alloc] init];
        cellData.headerData = headerData;
        cellData.contentData = contentData;
        
        [_aboutArray addObject:cellData];
    }
    return _aboutArray;
}
@end
