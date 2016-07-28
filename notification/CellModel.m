//
//  CellModel.m
//  notification
//
//  Created by 罗向宇 on 16/7/27.
//  Copyright © 2016年 罗向宇. All rights reserved.
//

#import "CellModel.h"

@interface CellModel ()

@property (nonatomic, strong) NSDate *timeInfo;

@end

@implementation CellModel

- (instancetype)initWithSenderInfo:(NSString *) senderInfoString messageInfo:(NSString *) messageInfoString
{
    self = [super init];
    if(self){
        self.senderInfoString = senderInfoString;
        self.messageInfoString = messageInfoString;
        self.timeInfo = [NSDate date];
    }
    return self;
}

@end
