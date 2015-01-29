//
// Created by Maciej Oczko on 12/01/15.
// Copyright (c) 2015 Polidea. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginService : NSObject

#pragma mark - Normal

- (void)signInWithUsername:(NSString *)username
                  password:(NSString *)password
                completion:(void (^)(BOOL success))completion;

#pragma mark - RAC

- (RACSignal *)signInWithUsername:(NSString *)username
                         password:(NSString *)password;

@end
