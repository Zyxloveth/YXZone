//
//  AboutMeViewController.m
//  YXZone
//
//  Created by 中软mac028 on 15/10/8.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import "AboutMeViewController.h"
#import "AboutTableViewCell.h"
#import "EngineInterface.h"

@interface AboutMeViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView* _tableView;
    NSArray* _array;
}

@end

@implementation AboutMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createRightButtonWithImage:@"refresh.png"];
    [self createNavigationTitle:@"与我相关"];
    [self getData];
    [self initView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}
- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    

}
- (void) getData {
    _array = [[EngineInterface shareInstance] getAboutMeCellArray];
}
- (void) initView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height) style:UITableViewStyleGrouped];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.showsHorizontalScrollIndicator = NO;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.editing = NO;
    _tableView.allowsSelection = NO;
    
    [self.view addSubview:_tableView];
}
#pragma mark - TableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return _array.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* cellName = @"cellName";
    AboutTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (cell == nil ) {
        cell = [[AboutTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
    }
    cell.data = [[AboutCellData alloc] init];
    cell.data = [_array objectAtIndex:indexPath.section];
    [cell updateCellView];
    return cell;
}
#pragma mark - TableViewDelegate
- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10.0f;
}
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01f;
}
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger numOfLine;
    AboutCellData* data = [_array objectAtIndex:indexPath.section];
    if (data.contentData.myReplyText && data.contentData.myReplyText.length != 0 ) {
        if (data.contentData.myReplyText.length%20 == 0) {
            numOfLine = data.contentData.myReplyText.length/20;
        } else {
            numOfLine = data.contentData.myReplyText.length/20 + 1;
        }
    }
    return 140 + 18 * numOfLine;
}
#pragma mark - SuperMethod

- (void) refreshClick:(id) sender {
    
}
- (void) createRightButtonWithImage:(NSString *)imageName
{
    [super createRightButtonWithImage:imageName];
}
- (void) createNavigationTitle:(NSString *)title {
    [super createNavigationTitle:title];
}
@end
