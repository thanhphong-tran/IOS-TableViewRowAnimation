//
//  Message.h
//  TableViewRowAnimation
//
//  Created by CPU11808 on 3/27/17.
//  Copyright © 2017 CPU11808. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Message : NSObject

@property(nonatomic) NSString *content;
@property(nonatomic) BOOL isLeft;

+ (instancetype)messageWithContent:(NSString *)content isLeft:(BOOL)isLeft;

@end
