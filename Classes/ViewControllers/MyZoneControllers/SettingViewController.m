//
//  SettingViewController.m
//  YXZone
//
//  Created by 中软mac028 on 15/10/15.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingTableViewCell.h"
#import "SettingHeaderView.h"

@interface SettingViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    UITableView* _tableView;
    NSArray* _nameArray;
}
@end

@implementation SettingViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
   
    [self getData];
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self createLeftButtonWithTitle:@"返回"];
    [self createRightButtonWithTitle:@"帮助"];
    [self createNavigationTitle:@"设置"];
}
- (void) viewWillDisappear:(BOOL)animated
{
    
    [super viewWillDisappear:animated];
    [self.customView removeFromSuperview];
}
- (void) getData {
    _nameArray = [NSArray arrayWithObjects:@"我的黄钻",@"个性化",@"关于QQ空间", nil];
}

- (void) initView
{
    SettingHeaderView* headerView = [[SettingHeaderView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 135)];
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 44)];
    label.backgroundColor = [UIColor whiteColor];
    label.text = @"退出当前账号";
    label.textColor = [UIColor colorWithRed:168/255.0f green:1/255.0f blue:16/255.0f alpha:1.0f];
    label.textAlignment = NSTextAlignmentCenter;
    label.userInteractionEnabled = YES;
    
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(exitClick:)];
    [label addGestureRecognizer:tap];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height) style:UITableViewStyleGrouped];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.showsHorizontalScrollIndicator = NO;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.editing = NO;
    _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 15);
    _tableView.allowsSelection = YES;
    _tableView.scrollEnabled = NO;
    
    _tableView.tableHeaderView = headerView;
    _tableView.tableFooterView = label;
    
    [self.view addSubview:_tableView];
}

#pragma mark - TableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _nameArray.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellName = @"CellName";
    
    SettingTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    
    if (cell == nil) {
        cell =  [[SettingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
    }
    cell.settingName = [_nameArray objectAtIndex:indexPath.row];
    
    [cell updateCellView];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
#pragma mark - TableViewDelegate
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20.0f;
}
- (void) createLeftButtonWithTitle:(NSString *)title
{
    [super createLeftButtonWithTitle:title];
    [self.leftButton addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void) createRightButtonWithTitle:(NSString *)title
{
    [super createRightButtonWithTitle:title];
}
- (void) createNavigationTitle:(NSString *)title
{
    [super createNavigationTitle:title];
}
- (void)leftButtonClick:(id) sender
{
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - ExitClick
- (void) exitClick:(id) sender {
    if (sender && [sender isKindOfClass:[UITapGestureRecognizer class]]) {
        UIActionSheet* sheet = [[UIActionSheet alloc] initWithTitle:@"确定要退出当前登录帐号吗？" delegate:nil cancelButtonTitle:@"取消" destructiveButtonTitle:@"退出" otherButtonTitles: nil];
        [sheet showInView:self.view];
    }
}
@end
