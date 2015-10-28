//
//  MyZoneViewController.m
//  YXZone
//
//  Created by 中软mac028 on 15/10/8.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import "MyZoneViewController.h"
#import "MyZoneHeaderView.h"
#import "MyZoneTableViewCell.h"
#import "DynamicTableViewCell.h"
#import "EngineInterface.h"
#import "DynamicCellData.h"
#import "SettingViewController.h"

@interface MyZoneViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    UITableView* _tableView;
    MyZoneHeaderView* _headerView;
    NSArray* _dataArray;
}
@end

@implementation MyZoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self createNavigationTitle:@"我的空间"];
    [self createRightButtonWithTitle:@"好友"];
    [self createLeftButtonWithTitle:@"设置"];
    
    [self getData];
    [self initTableView];
}
- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self createNavigationTitle:@"我的空间"];
    [self createRightButtonWithTitle:@"好友"];
    [self createLeftButtonWithTitle:@"设置"];
}
- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.customView removeFromSuperview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void) getData {
    _dataArray = [[EngineInterface shareInstance] getDynamicCellArray];
}
- (void) initTableView {
    
    _headerView = [[MyZoneHeaderView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 206+176)];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height) style:UITableViewStyleGrouped];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.showsHorizontalScrollIndicator = NO;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.tableHeaderView = _headerView;
    
    [self.view addSubview:_tableView];
}

#pragma mark - TableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataArray.count + 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    
    if (indexPath.section == 0) {
         static NSString* cellName = @"ZoneCellName";
        MyZoneTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellName];
        
        if (cell == nil) {
            cell =  [[MyZoneTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        }
        return cell;

    } else {
         static NSString* cellName = @"DynamicCellName";
        DynamicTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellName];
        
        if (cell == nil) {
            cell =  [[DynamicTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        } else {
            [cell removeAll];
        }
        
        // NSLog(@"%ld",indexPath.row);
        cell.data = (DynamicCellData*)[_dataArray objectAtIndex:indexPath.section-1];
        [cell updateCellView];
        return cell;
    }
    
    
   
    return nil;
    
}

#pragma mark - UITableViewDelegate
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        return 270;
    }
    CGFloat cellHeight = 0;
    CGFloat headerHeight = 60;
    CGFloat expressHeight = 0;
    CGFloat contentHeight = 60;
    CGFloat bottomHeight = 21 + 5 + 15 + 5 + 30;
    // NSLog(@"section:%ld row:%ld", indexPath.section, indexPath.row);
    DynamicCellData* data = (DynamicCellData*)[_dataArray objectAtIndex:indexPath.section-1];
    CGFloat praiseHeight = [self praisePersonHeight:data.praiseImageArray.count];
    bottomHeight += praiseHeight;
    if (data.comeFromType == YXComeFromTypeApplication) {
        
        expressHeight = [self expressHeight:data.shareExpressText];
        CGFloat shareHeight = 60;
        contentHeight += expressHeight + shareHeight;
        
        
    } else if (data.comeFromType == YXComeFromTypePhone) {
        expressHeight = [self expressHeight:data.shuoShuoContent];
        NSInteger line = 0;
        if (data.shuoShuoImageArray.count >= 9) {
            line = 3;
        } else {
            line = data.shuoShuoImageArray.count / 3 + 1;
        }
        CGFloat imageHeight = line * (Screen_Width - 40)/3 + 20 ;
        if (data.shuoShuoType == YXShuoShuoTypeUpload) {
            contentHeight += 15;
        }
        contentHeight += imageHeight + expressHeight + 10;
    }
    cellHeight = headerHeight + contentHeight + bottomHeight + 20;
    return cellHeight;
}
- (NSInteger) expressHeight:(NSString*) text{
    NSInteger numOfLine;
    if (text && text.length != 0 ) {
        if (text.length%20 == 0) {
            numOfLine = text.length/20;
        } else {
            numOfLine = text.length/20 + 1;
        }
    }
    return numOfLine*18;
}
- (NSInteger) praisePersonHeight:(NSInteger) num {
    CGFloat height = 0;
    if (num && num > 0) {
        if (num <= 8) {
            height = 21;
        } else {
            height = 47;
        }
    }
    
    return height;
}
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 20.0f;
    }
    return 10.0f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10.0f;
}



#pragma mark - BaseViewController
- (void) createNavigationTitle:(NSString *)title {
    [super createNavigationTitle:title];
    
}

- (void) createLeftButtonWithTitle:(NSString *)title {
    [super createLeftButtonWithTitle:title];
    [self.leftButton addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void) createRightButtonWithTitle:(NSString *)title {
    [super createRightButtonWithTitle:title];
}
- (void) rightButtonClick:(id) sender {
    //[self.customView removeFromSuperview];
    SettingViewController* setting = [[SettingViewController alloc] init];
    [self.navigationController pushViewController:setting animated:YES];
    
}

@end
