//
// Created by Paweł Janeczek on 27/01/15.
// Copyright (c) 2015 Paweł Janeczek. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UTNetworkService : NSObject

@property(nonatomic, readonly) NSOperationQueue *operationQueue;
@property(nonatomic, readonly) NSURL *hostUrl;

- (instancetype)initWithHostUrl:(NSURL *)hostUrl;

- (instancetype)initWithOperationQueue:(NSOperationQueue *)operationQueue hostUrl:(NSURL *)hostUrl;

- (void)loginWithUsername:(NSString *)username password:(NSString *)password completion:(void (^)(NSError *, NSString *))completionBlock;

- (void)sendData:(NSString *)data token:(NSString *)token completion:(void (^)(NSError *, NSString *))completionBlock;

- (void)logout:(NSString *)token;
@end