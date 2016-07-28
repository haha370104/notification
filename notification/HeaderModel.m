//
//  HeaderModel.m
//  notification
//
//  Created by 罗向宇 on 16/7/27.
//  Copyright © 2016年 罗向宇. All rights reserved.
//

#import "HeaderModel.h"

@implementation HeaderModel

- (instancetype)initWithHeaderTitle:(NSString *)headerTitle headerImage:(UIImage *)headerImage
{
    self = [self init];
    if(self){
        self.notificationHeaderTitle = headerTitle;
        self.notificationHeaderImage = headerImage;
    }
    return self;
}

@end
