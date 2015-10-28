//
//  DynamicHeaderData.h
//  YXZone
//
//  Created by 中软mac028 on 15/10/11.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, YXLuckyLevel) {
    YXLuckyLevelZero = 0,
    YXLuckyLevelOne,
    YXLuckyLevelTwo,
    YXLuckyLevelThree,
    YXLuckyLevelFour,
    YXLuckyLevelFive,
    YXLuckyLevelSix
};


@interface DynamicHeaderData : UIView

@property (nonatomic, copy) NSString* bgImageName;
@property (nonatomic, copy) NSString* headerImageName;

@property (nonatomic, assign) YXLuckyLevel luckyLevel;

@property (nonatomic, assign) NSInteger nowdayVisitorNum;
@property (nonatomic, assign) NSInteger allOfVisitorNum;
@property (nonatomic, assign) NSInteger goOnLoginDays;

@end
