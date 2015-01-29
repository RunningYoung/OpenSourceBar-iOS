//
// Created by Maciej Oczko on 28/01/15.
// Copyright (c) 2015 Polidea. All rights reserved.
//

#import <Foundation/Foundation.h>

@class APIClient;
@class RequestBuilder;

@interface LoginService : NSObject
@property(nonatomic, readonly) APIClient *apiClient;
@property(nonatomic, readonly) RequestBuilder *requestBuilder;
@property(nonatomic, readonly, copy) NSString *accessToken;

+ (instancetype)serviceWithAPIClient:(APIClient *)apiClient requestBuilder:(RequestBuilder *)requestBuilder;
- (instancetype)initWithAPIClient:(APIClient *)apiClient requestBuilder:(RequestBuilder *)requestBuilder;

- (RACSignal *)authenticateWithWebView:(UIWebView *)webView;
@end
