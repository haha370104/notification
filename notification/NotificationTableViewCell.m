//
//  NotificationTableViewCell.m
//  notification
//
//  Created by 罗向宇 on 16/7/27.
//  Copyright © 2016年 罗向宇. All rights reserved.
//

#import "NotificationTableViewCell.h"
#import "UITableView+FDTemplateLayoutCell.h"

@interface NotificationTableViewCell ()

@property (nonatomic, strong) UILabel *senderInfoLabel;
@property (nonatomic, strong) UILabel *timeInfoLabel;
@property (nonatomic, strong) UILabel *messageInfoLabel;

@end

@implementation NotificationTableViewCell

#pragma mark - init -

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self.contentView addSubview:self.senderInfoLabel];
        [self.contentView addSubview:self.timeInfoLabel];
        [self.contentView addSubview:self.messageInfoLabel];
        [self setupConstraints];
        self.contentView.backgroundColor = [UIColor grayColor];
        self.backgroundColor = [UIColor grayColor];
    }
    return self;
}

#pragma mark - private -

- (void)setupConstraints
{
    [self.senderInfoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).with.offset(10);
        make.left.equalTo(self.contentView).with.offset(self.bounds.size.width * 0.15f);
        make.height.equalTo(@20);
    }];

    [self.timeInfoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.senderInfoLabel);
        make.left.equalTo(self.senderInfoLabel.mas_right).with.offset(20);
    }];

    [self.messageInfoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.senderInfoLabel.mas_bottom).with.offset(5);
        make.left.equalTo(self.senderInfoLabel);
        make.right.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView).with.offset(-10);
    }];
}

#pragma mark - getter && setter -

- (UILabel *)senderInfoLabel
{
    if(!_senderInfoLabel){
        _senderInfoLabel = [[UILabel alloc]init];
        _senderInfoLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
        _senderInfoLabel.textColor = [UIColor whiteColor];
    }
    return _senderInfoLabel;
}

- (UILabel *)timeInfoLabel
{
    if(!_timeInfoLabel){
        _timeInfoLabel = [[UILabel alloc]init];
        _timeInfoLabel.font = [UIFont systemFontOfSize:10];
    }
    return _timeInfoLabel;
}

- (UILabel *)messageInfoLabel
{
    if(!_messageInfoLabel){
        _messageInfoLabel = [[UILabel alloc]init];
        _messageInfoLabel.font = [UIFont systemFontOfSize:16];
        _messageInfoLabel.numberOfLines = 0;
        _messageInfoLabel.textColor = [UIColor whiteColor];
    }
    return _messageInfoLabel;
}

@end
