//
//  HeaderModel.h
//  notification
//
//  Created by 罗向宇 on 16/7/27.
//  Copyright © 2016年 罗向宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIColor.h>

@interface HeaderModel : NSObject

@property (nonatomic, strong) NSString *notificationHeaderTitle;
@property (nonatomic, strong) UIImage *notificationHeaderImage;
@property (nonatomic, assign) NSInteger index;

- (instancetype)initWithHeaderTitle:(NSString *)headerTitle headerImage:(UIImage *)headerImage;

@end
