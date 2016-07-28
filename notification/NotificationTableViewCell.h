//
//  NotificationTableViewCell.h
//  notification
//
//  Created by 罗向宇 on 16/7/27.
//  Copyright © 2016年 罗向宇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>

@interface NotificationTableViewCell : UITableViewCell

@property (nonatomic, strong, readonly) UILabel *senderInfoLabel;
@property (nonatomic, strong, readonly) UILabel *timeInfoLabel;
@property (nonatomic, strong, readonly) UILabel *messageInfoLabel;

@end
