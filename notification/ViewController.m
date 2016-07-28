//
//  ViewController.m
//  notification
//
//  Created by 罗向宇 on 16/7/27.
//  Copyright © 2016年 罗向宇. All rights reserved.
//

#import "ViewController.h"
#import "CellModel.h"
#import "NotificationTableViewCell.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "NotificationTableViewHeader.h"
#import "HeaderModel.h"
#

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)NSMutableArray <NSMutableArray <CellModel *> *> *dataSource;
@property (nonatomic, strong)NSMutableArray <HeaderModel *> *headerSource;
@property (nonatomic, strong)UITableView *notificationTableView;

@end

@implementation ViewController

#pragma mark - lifecycle -
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initTableView];
    [self initDataSource];
}

#pragma mark - event -



#pragma mark - dataSource -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.headerSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource[section].count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger index = indexPath.row;
    NSInteger sectionNum = indexPath.section;
    NotificationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([NotificationTableViewCell class]) forIndexPath:indexPath];
    cell.senderInfoLabel.text = self.dataSource[sectionNum][index].senderInfoString;
    cell.messageInfoLabel.text = self.dataSource[sectionNum][index].messageInfoString;
    NSDateFormatter *dateFormatter =[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY/MM/dd hh:mm:ss"];
    NSString *dateString = [dateFormatter stringFromDate:self.dataSource[sectionNum][index].timeInfo];
    cell.timeInfoLabel.text = dateString;
    return cell;
}

#pragma mark - delegate -

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = [tableView fd_heightForCellWithIdentifier:NSStringFromClass([NotificationTableViewCell class]) configuration:^(id cell) {
        NSInteger index = indexPath.row;
        NSInteger sectionNum = indexPath.section;
        NotificationTableViewCell *_cell = (NotificationTableViewCell *)cell;
        _cell.senderInfoLabel.text = self.dataSource[sectionNum][index].senderInfoString;
        _cell.messageInfoLabel.text = self.dataSource[sectionNum][index].messageInfoString;
        NSDateFormatter *dateFormatter =[[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"YYYY/MM/dd hh:mm:ss"];
        NSString *dateString = [dateFormatter stringFromDate:self.dataSource[sectionNum][index].timeInfo];
        _cell.timeInfoLabel.text = dateString;
    }];
    return height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.notificationTableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NotificationTableViewHeader *notificationHeader = [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass([NotificationTableViewHeader class])];
    notificationHeader.index = section;
    self.headerSource[section].index = section;
    [notificationHeader setAction:^(NSInteger index) {
        NSInteger section = -1;
        for(int i = 0;i < self.headerSource.count; i++){
            if(self.headerSource[i].index == index){
                section = i;
                break;
            }
        }
        [self deleteSection:section scrollAutoFlag:YES];
    }];
    notificationHeader.headerTitle.text = self.headerSource[section].notificationHeaderTitle;
    notificationHeader.headerIcon.image = self.headerSource[section].notificationHeaderImage;
    return notificationHeader;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.dataSource[indexPath.section] removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    if(self.dataSource[indexPath.section].count == 0){
        [self deleteSection:indexPath.section scrollAutoFlag:NO];
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

#pragma mark - private -
- (void)initDataSource
{
    NSMutableArray *tempSection = [[NSMutableArray alloc]init];
    NSMutableArray *tempHeader = [[NSMutableArray alloc]init];
    for(int section = 0; section < 15; section++){
        NSMutableArray <CellModel *> *tempCellsPerSection = [[NSMutableArray alloc]init];
        for(int i = 5; i < 15; i++){
            [tempCellsPerSection addObject:[[CellModel alloc]initWithSenderInfo:[NSString stringWithFormat:@"推送人%d",i] messageInfo:[self randomLengthString]]];
        }
        HeaderModel *sectionHeaderModel = [[HeaderModel alloc]initWithHeaderTitle:[NSString stringWithFormat:@"公司%d",section] headerImage:[UIImage imageNamed:@"Artboard"]];
        [tempHeader addObject:sectionHeaderModel];
        [tempSection addObject:tempCellsPerSection];
    }
    self.dataSource = [[NSMutableArray alloc]initWithArray:[tempSection copy]];
    self.headerSource = [[NSMutableArray alloc]initWithArray:[tempHeader copy]];
}

- (void)initTableView
{
    CGRect notificationViewBounds = self.view.bounds;
    notificationViewBounds.origin.y = 20;
    notificationViewBounds.size.height -= 20;
    self.notificationTableView = [[UITableView alloc]initWithFrame:notificationViewBounds];
    self.notificationTableView.delegate = self;
    self.notificationTableView.dataSource = self;
    [self.notificationTableView setTableFooterView:[[UIView alloc]initWithFrame:CGRectZero]];
    [self.notificationTableView setSeparatorInset:UIEdgeInsetsMake(0, self.view.bounds.size.width * 0.15f, 0, 0)];

    [self.notificationTableView registerClass:[NotificationTableViewCell class] forCellReuseIdentifier:NSStringFromClass([NotificationTableViewCell class])];
    [self.notificationTableView registerClass:[NotificationTableViewHeader class] forHeaderFooterViewReuseIdentifier:NSStringFromClass([NotificationTableViewHeader class])];
    [self.view addSubview:self.notificationTableView];

    self.notificationTableView.backgroundColor = [UIColor grayColor];
}

- (NSString *)randomLengthString
{
    int length = arc4random() % 200;
    NSString *resultString = @"";
    for(int i = 0; i < length; i++){
        resultString = [resultString stringByAppendingString:@"1"];
    }
    return resultString;
}

- (void)deleteSection:(NSInteger) section scrollAutoFlag:(BOOL) flag
{
    [self.dataSource removeObjectAtIndex:section];
    [self.headerSource removeObjectAtIndex:section];
    [self.notificationTableView deleteSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationBottom];
    if(flag && section < self.dataSource.count){
        [self.notificationTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:section] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }

}

@end
