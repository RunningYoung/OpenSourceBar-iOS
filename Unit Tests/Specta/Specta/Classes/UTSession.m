//
// Created by Paweł Janeczek on 27/01/15.
// Copyright (c) 2015 Paweł Janeczek. All rights reserved.
//

#import "UTSession.h"
#import "UTNetworkService.h"


@implementation UTSession

- (instancetype)initWithNetworkService:(UTNetworkService *)networkService {
    self = [super init];
    if (self) {
        _networkService = networkService;
    }

    return self;
}

- (void)startSessionWithUsername:(NSString *)username password:(NSString *)password {
    _running = YES;

    __weak __typeof__(self) weakSelf = self;
    void (^block)(NSError *, NSString *) = ^(NSError *error, NSString *token) {
        __typeof__(self) strongSelf = weakSelf;
        strongSelf.token = token;
        [strongSelf.delegate session:strongSelf loginResult:[strongSelf isLoggedIn]];
    };
    [self.networkService loginWithUsername:username password:password completion:block];
}

- (void)sendData:(NSString *)data completion:(void (^)(NSError *, NSString *))completionBlock {
    if (![self isLoggedIn]) {
        NSError *error = [NSError errorWithDomain:NSStringFromClass([UTSession class]) code:400 userInfo:@{NSLocalizedDescriptionKey : @"User is not logged in"}];
        completionBlock(error, nil);
        return;
    }

    void (^block)(NSError *, NSString *) = ^(NSError *error, NSString *string) {
        completionBlock(error, string);
    };
    [self.networkService sendData:data token:self.token completion:block];
}

- (BOOL)isLoggedIn {
    return self.token != nil;
}

- (void)stopSession {
    _running = NO;

    [self.networkService logout:self.token];

    self.token = nil;
}

@end