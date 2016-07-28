//
//  NotificationTableViewHeader.h
//  notification
//
//  Created by 罗向宇 on 16/7/27.
//  Copyright © 2016年 罗向宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotificationTableViewHeader : UITableViewHeaderFooterView

@property (nonatomic, strong, readonly) UIImageView *headerIcon;
@property (nonatomic, strong, readonly) UILabel *headerTitle;
@property (nonatomic, strong, readonly) UIView *headerCloseButton;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, copy) void (^action)(NSInteger section);

@end
