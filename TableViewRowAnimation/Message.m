//
//  Message.m
//  TableViewRowAnimation
//
//  Created by CPU11808 on 3/27/17.
//  Copyright © 2017 CPU11808. All rights reserved.
//

#import "Message.h"

@implementation Message

+ (instancetype)messageWithContent:(NSString *)content isLeft:(BOOL)isLeft {
    Message *message = [Message new];
    message.content = content;
    message.isLeft = isLeft;
    return message;
}

@end
