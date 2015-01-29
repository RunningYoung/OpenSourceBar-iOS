//
// Created by Maciej Oczko on 12/01/15.
// Copyright (c) 2015 Polidea. All rights reserved.
//

#import "LoginService.h"

@implementation LoginService

- (void)signInWithUsername:(NSString *)username password:(NSString *)password completion:(void (^)(BOOL success))completion {
    if (completion) {
        BOOL shouldLogIn = [self shouldLogInWithUsername:username password:password];
        completion(shouldLogIn);
    }
}

- (RACSignal *)signInWithUsername:(NSString *)username password:(NSString *)password {
    @weakify(self)
    return [RACSignal createSignal:^RACDisposable *(id <RACSubscriber> subscriber) {
        @strongify(self)
        BOOL shouldLogIn = [self shouldLogInWithUsername:username password:password];
        [subscriber sendNext:@(shouldLogIn)];
        [subscriber sendCompleted];
        return nil;
    }];
}

- (BOOL)shouldLogInWithUsername:(NSString *)username password:(NSString *)password {
    return [username isEqualToString:@"user"] && [password isEqualToString:@"password"];
}

@end
