//
//  CellModel.h
//  notification
//
//  Created by 罗向宇 on 16/7/27.
//  Copyright © 2016年 罗向宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CellModel : NSObject

@property (nonatomic, strong) NSString *senderInfoString;
@property (nonatomic, strong) NSString *messageInfoString;
@property (nonatomic, strong, readonly) NSDate *timeInfo;

- (instancetype)initWithSenderInfo:(NSString *) senderInfoString messageInfo:(NSString *) messageInfoString;

@end
