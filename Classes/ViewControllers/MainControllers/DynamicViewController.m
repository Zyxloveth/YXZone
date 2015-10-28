//
//  DynamicViewController.m
//  YXZone
//
//  Created by 中软mac028 on 15/10/8.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import "DynamicViewController.h"
#import "SlidingView.h"
#import "DynamicBgView.h"
#import "ShareInfoView.h"
#import "ShuoShuoContentView.h"
#import "DynamicBottomView.h"
#import "DynamicTableViewCell.h"
#import "EngineInterface.h"
#import "ExpressCoverView.h"
#import "ExpressViewController.h"
#import "WriteShuoViewController.h"
#import "ExpressView.h"

@interface DynamicViewController ()<SlidingViewDelegate,UITableViewDataSource, UITableViewDelegate,DynamicBgViewDelegate,DynamicTableViewCellDelegate,ExpressViewDelegate>
{
    SlidingView* _slidingView;
    UITableView* _tableView;
    NSArray* _dataArray;
    ExpressCoverView* _coverView;
    
    ExpressView* _expressView;
}

@end

@implementation DynamicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initSlidingView];
    [self createLeftButtonWithImage:@"menu.png"];
    [self createRightButtonWithImage:@"yellow_diamond.png"];
    [self createNavigationTitle:@"动态"];
    [self addSwipeGuesture];
    [self getData];
    [self initView];
    [self initCoverButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self createLeftButtonWithImage:@"menu.png"];
    [self createRightButtonWithImage:@"yellow_diamond.png"];
    [self createNavigationTitle:@"动态"];
}
- (void) viewWillDisappear:(BOOL)animated
{
    [self.customView removeFromSuperview];
}
- (void) initCoverButton {
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(Screen_Width * 0.2 * 2 + 8, 0, 49, 49);
    [button setImage:[UIImage imageNamed:@"express.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(expressBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.tabBarController.tabBar addSubview:button];
    
    _coverView = [[ExpressCoverView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height)];
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(coverClick:)];
    
    [_coverView addGestureRecognizer:tap];
    _coverView.hidden = YES;
    _coverView.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.97f];
    [[UIApplication sharedApplication].keyWindow addSubview:_coverView];
    
    
}
#pragma mark - ExpressBtnClick:
- (void) expressBtnClick:(id) sender {
    
    if (sender && [sender isKindOfClass:[UIButton class]]) {
        _coverView.hidden = NO;
         [_coverView startAnimation];
    }
    
}
- (void) coverClick: (id) sender {
    
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionTransitionNone animations:
     ^(void){
        [_coverView endAnimation];
    } completion:^(BOOL finished){
        _coverView.hidden = YES;
    }];
    
    
    
   
    
}
- (void) getData {
    _dataArray = [[EngineInterface shareInstance] getDynamicCellArray];
}

- (void) initView {

    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height) style:UITableViewStyleGrouped];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.showsHorizontalScrollIndicator = NO;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.editing = NO;
    _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 15);
    _tableView.allowsSelection = NO;
    
    [self.view addSubview:_tableView];
    
    DynamicBgView* bgView = [[DynamicBgView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 250)];
    bgView.delegate = self;
    _tableView.tableHeaderView = bgView;

}

#pragma  mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return  _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* cellName = @"CellName";
    
    DynamicTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    
    if (cell == nil) {
        cell =  [[DynamicTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        cell.delegate = self;
    } else {
        [cell removeAll];
    }
    
   // NSLog(@"%ld",indexPath.row);
    
    cell.data = (DynamicCellData*)[_dataArray objectAtIndex:indexPath.section];
    [cell updateCellView];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat cellHeight = 0;
    
    CGFloat headerHeight = 60;
    CGFloat expressHeight = 0;
    CGFloat contentHeight = 60;
    CGFloat bottomHeight = 21 + 5 + 15 + 5 + 30;
   // NSLog(@"section:%ld row:%ld", indexPath.section, indexPath.row);
    DynamicCellData* data = (DynamicCellData*)[_dataArray objectAtIndex:indexPath.section];
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
    return 10.0f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10.0f;
}
#pragma mark - DynamicTableViewCellDelegate
- (void)cellSayOneWordAction
{
    
}
- (void) cellCommentAction
{
    if (_expressView == nil) {
        _expressView = [[ExpressView alloc] initWithFrame:CGRectMake(Screen_Width, Screen_Height/2 - 30, Screen_Width, 62)];
        _expressView.backgroundColor = [UIColor whiteColor];
        _expressView.delegate = self;
    }
    
    
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    
    [window addSubview:_expressView];
    [UIView animateWithDuration:0.5 animations:^(){
            _expressView.frame =CGRectMake(0, Screen_Height/2 - 30, Screen_Width, 62);
    }];
    
}
- (void) expressWhenEditFinished {
    [UIView animateWithDuration:0.5 animations:^(){
        _expressView.frame =CGRectMake(Screen_Width, Screen_Height/2 - 30, Screen_Width, 62);
    } completion:^(BOOL finish) {
        [_expressView removeFromSuperview];
        _expressView = nil;
    }];
    
}
//添加侧滑视图
- (void) initSlidingView {
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    _slidingView = [[SlidingView alloc] initWithFrame:CGRectMake(-Screen_Width, 0, Screen_Width, Screen_Height)];
    
    _slidingView.delegate = self;
    _slidingView.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.0f];
    
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(slidingClick:)];
    [_slidingView addGestureRecognizer:tap];
    
    [window addSubview:_slidingView];
}

//添加滑动手势
- (void) addSwipeGuesture {
    
    UISwipeGestureRecognizer* swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRightAction:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRight];
    
    UISwipeGestureRecognizer* swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeftAction:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [_slidingView addGestureRecognizer:swipeLeft];
}

- (void) swipeRightAction:(id) sender {
    
    if (sender && [sender isKindOfClass:[UISwipeGestureRecognizer class]]) {
        //UISwipeGestureRecognizer* swipe = (UISwipeGestureRecognizer*) sender;
        
        [UIView animateWithDuration:0.5f animations:^(void) {
            _slidingView.frame = CGRectMake(0, 0, Screen_Width, Screen_Height);
            _slidingView.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.8f];
        }completion:^(BOOL finish){
            
        }];
    }
  
}
- (void) swipeLeftAction: (id) sender {
    if (sender && [sender isKindOfClass:[UISwipeGestureRecognizer class]]) {
        //UISwipeGestureRecognizer* swipe = (UISwipeGestureRecognizer*) sender;
        
        [UIView animateWithDuration:0.5f animations:^(void) {
            _slidingView.frame = CGRectMake(-Screen_Width, 0, Screen_Width, Screen_Height);
            _slidingView.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.0f];
        }];
    }
}
#pragma mark - BaseViewController
- (void) createLeftButtonWithImage:(NSString *)imageName
{
    [super createLeftButtonWithImage:imageName];
    
    [self.leftButton addTarget:self action:@selector(menuClick:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void) createRightButtonWithImage:(NSString *)imageName {
    [super createRightButtonWithImage:imageName];
    
    [self.rightButton addTarget:self action:@selector(diamondClick:) forControlEvents:UIControlEventTouchUpInside];
    
}
- (void) createNavigationTitle:(NSString *)title {
    [super createNavigationTitle:title];
}
#pragma mark - ClickAction
- (void) menuClick: (id)sender {
    
    if (sender && [sender isKindOfClass:[UIButton class]]) {
        [UIView animateWithDuration:0.25f animations:^(void) {
            _slidingView.frame = CGRectMake(0, 0, Screen_Width, Screen_Height);
            _slidingView.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.6f];
            
            
        }];
    }
    
}

- (void) diamondClick:(id) sender {
    if (sender && [sender isKindOfClass:[UIButton class]]) {
    }
}

- (void) slidingClick:(id) sender {
    [UIView animateWithDuration:0.25f animations:^(void) {
        _slidingView.frame = CGRectMake(-Screen_Width, 0, Screen_Width, Screen_Height);
         _slidingView.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.0f];
        
    }];
     
}
#pragma mark - DynamicViewDelegate
- (void) sayLittleAction {
    WriteShuoViewController* write = [[WriteShuoViewController alloc] init];
    
    [self.navigationController pushViewController:write animated:YES];
}


#pragma mark - SlidingViewDelegate
- (void)bottomSubViewClick:(NSInteger) tag {
    
}
- (void)topSubViewClick:(NSInteger) tag {
    
}

//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    
//}
//-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
//    
//}
//-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
//    
//}
//-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
//    
//}
@end
