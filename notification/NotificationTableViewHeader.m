//
//  NotificationTableViewHeader.m
//  notification
//
//  Created by 罗向宇 on 16/7/27.
//  Copyright © 2016年 罗向宇. All rights reserved.
//

#import "NotificationTableViewHeader.h"
#import <Masonry/Masonry.h>

@interface NotificationTableViewHeader ()

@property (nonatomic, strong) UIImageView *headerIcon;
@property (nonatomic, strong) UILabel *headerTitle;
@property (nonatomic, strong) UIView *headerCloseButton;

@end

@implementation NotificationTableViewHeader

#pragma mark - init -

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if(self){
        [self.contentView addSubview:self.headerIcon];
        [self.contentView addSubview:self.headerTitle];
        [self.contentView addSubview:self.headerCloseButton];
        [self setupConstraints];
        self.contentView.backgroundColor = [UIColor darkGrayColor];
        self.headerIcon.layer.cornerRadius = 3;
        self.headerIcon.clipsToBounds = YES;
    }
    return self;
}

#pragma mark - event -

- (void)handleClick
{
    if(self.action){
        self.action(self);
    }
}

- (void)prepareForReuse
{
    self.action = nil;
    self.headerTitle.text = @"";
    self.headerIcon.image = nil;
}

#pragma mark - private -

- (void)setupConstraints
{
    [self.headerIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.contentView.mas_height).multipliedBy(0.6f);
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).with.offset(10);
        make.width.equalTo(self.headerIcon.mas_height);
    }];


    [self.headerTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headerIcon.mas_right).with.offset(15);
        make.centerY.equalTo(self.contentView);
    }];

    [self.headerCloseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).with.offset(-20);
        make.centerY.equalTo(self.contentView);
        make.width.equalTo(@40);
        make.height.equalTo(self.contentView.mas_height).multipliedBy(0.8f);
    }];
}

#pragma mark - getter && setter -

- (UIImageView *)headerIcon
{
    if(!_headerIcon){
        _headerIcon = [[UIImageView alloc]init];
    }
    return _headerIcon;
}

- (UILabel *)headerTitle
{
    if(!_headerTitle){
        _headerTitle = [[UILabel alloc]init];
        _headerTitle.font = [UIFont systemFontOfSize:16];
        _headerTitle.textColor = [UIColor lightGrayColor];
    }
    return _headerTitle;
}

- (UIView *)headerCloseButton
{
    if(!_headerCloseButton){
        _headerCloseButton = [[UIView alloc]init];
        _headerCloseButton.backgroundColor = [UIColor redColor];
        _headerCloseButton.userInteractionEnabled = YES;
        //[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleClick)]
        [_headerCloseButton addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleClick)]];
    }
    return _headerCloseButton;
}

@end
