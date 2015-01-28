//
// Created by Maciej Oczko on 28/01/15.
// Copyright (c) 2015 Polidea. All rights reserved.
//

#import "LoginService.h"
#import "APIClient.h"
#import "RequestBuilder.h"
#import "RequestBuilder+Authorization.h"
#import "UIWebView+RAC.h"
#import "NSURL+Utilities.h"
#import "RACSignal+JSONify.h"

@interface LoginService ()
@property(nonatomic, readwrite, copy) NSString *accessToken;
@end

@implementation LoginService

+ (instancetype)serviceWithAPIClient:(APIClient *)apiClient requestBuilder:(RequestBuilder *)requestBuilder {
    return [[self alloc] initWithAPIClient:apiClient requestBuilder:requestBuilder];
}

- (instancetype)initWithAPIClient:(APIClient *)apiClient requestBuilder:(RequestBuilder *)requestBuilder {
    self = [super init];
    if (self) {
        _apiClient = apiClient;
        _requestBuilder = requestBuilder;
    }

    return self;
}

- (RACSignal *)authenticateWithWebView:(UIWebView __weak *)webView {
    RACSubject *authenticate = [RACSubject subject];

    @weakify(self)
    [[[[[[webView
            shouldStartLoadSignal]
            flattenMap:^RACStream *(NSURL *url) {
                @strongify(self)
                NSURLRequest *request = [self.requestBuilder tokenRequestWithCode:url.coinbaseCode];
                return [self.apiClient dataTaskWithRequest:request];
            }]
            jsonify]
            map:^id(NSDictionary *JSON) {
                return JSON[@"access_token"];
            }]
            doNext:^(NSString *accessToken) {
                @strongify(self)
                self.accessToken = accessToken;
            }]
            map:^id(NSString *accessToken) {
                return @(accessToken != nil);
            }];

    [webView loadRequest:self.requestBuilder.authorizeRequest];
    return authenticate;
}

@end
