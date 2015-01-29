//
// Created by Maciej Oczko on 28/01/15.
// Copyright (c) 2015 Polidea. All rights reserved.
//

#import "LoginService.h"
#import "APIClient.h"
#import "RequestBuilder.h"
#import "RequestBuilder+Authorization.h"
#import "NSURL+Utilities.h"
#import "UIWebView+RAC.h"

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
    @weakify(self)
    RACSignal *authenticate = [[[[[[webView
            shouldStartLoadSignal]
            flattenMap:^RACStream *(NSURL *url) {
                @strongify(self)
                NSURLRequest *request = [self.requestBuilder tokenRequestWithCode:url.coinbaseCode];
                return [self.apiClient dataTaskWithRequest:request];
            }]
            map:^id(NSDictionary *JSON) {
                return JSON[@"access_token"];
            }]
            doNext:^(NSString *accessToken) {
                @strongify(self)
                self.accessToken = accessToken;
            }]
            logNext]
            flattenMap:^RACStream *(NSString *accessToken) {
                return accessToken != nil ? [RACSignal return:@YES] : [RACSignal error:[self missingTokenError]];
            }];

    [webView loadRequest:self.requestBuilder.authorizeRequest];
    return authenticate;
}

#pragma mark - Helper method

- (NSError *)missingTokenError {
    return [NSError errorWithDomain:[[NSBundle mainBundle] bundleIdentifier]
                               code:-1
                           userInfo:@{
                                   NSLocalizedDescriptionKey : @"No access token found in response!"
                           }];
}

@end
