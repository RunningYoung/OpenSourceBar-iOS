//
// Created by Paweł Janeczek on 27/01/15.
// Copyright (c) 2015 Paweł Janeczek. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UTNetworkService;
@class UTSession;


@protocol UTSessionDelegate

- (void)session:(UTSession *)session loginResult:(BOOL)loginResult;

@end


@interface UTSession : NSObject

@property(nonatomic, readonly) UTNetworkService *networkService;
@property(nonatomic, readonly, getter=isRunning) BOOL running;
@property(nonatomic, readonly, getter=isLoggedIn) BOOL loggedIn;
@property(nonatomic, copy) NSString *token;
@property(nonatomic, weak) id<UTSessionDelegate> delegate;

- (instancetype)initWithNetworkService:(UTNetworkService *)networkService;

- (void)startSessionWithUsername:(NSString *)username password:(NSString *)password;

- (void)sendData:(NSString *)data completion:(void (^)(NSError *, NSString *))completionBlock;

- (void)stopSession;

@end