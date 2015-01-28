//
// Created by Paweł Janeczek on 27/01/15.
// Copyright (c) 2015 Paweł Janeczek. All rights reserved.
//

#import "UTNetworkService.h"


@implementation UTNetworkService

- (instancetype)initWithOperationQueue:(NSOperationQueue *)operationQueue hostUrl:(NSURL *)hostUrl {
    self = [super init];
    if (self) {
        _operationQueue = operationQueue;
        _hostUrl = hostUrl;
    }

    return self;
}

- (instancetype)initWithHostUrl:(NSURL *)hostUrl {
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
    operationQueue.maxConcurrentOperationCount = 1;
    return [self initWithOperationQueue:operationQueue hostUrl:hostUrl];
}

- (void)loginWithUsername:(NSString *)username password:(NSString *)password completion:(void (^)(NSError *, NSString *))completionBlock {
    [self.operationQueue addOperationWithBlock:^{
        //network call
        [NSThread sleepForTimeInterval:1];
        NSString *token = @"LoggedInToken";
        completionBlock(nil, token);
    }];
}

- (void)sendData:(NSString *)data token:(NSString *)token completion:(void (^)(NSError *, NSString *))completionBlock {
    [self.operationQueue addOperationWithBlock:^{
        //network call
        [NSThread sleepForTimeInterval:1];
        completionBlock(nil, @"Sample Data");
    }];
}

- (void)logout:(NSString *)token {
    [self.operationQueue addOperationWithBlock:^{
        //network call
        [NSThread sleepForTimeInterval:1];
    }];
}

@end