//
// Created by Maciej Oczko on 28/01/15.
// Copyright (c) 2015 Polidea. All rights reserved.
//

#import "RequestBuilder+Authorization.h"

NSString *ClientSecret = @"328839df85dd41d4216613568aa7cab82ed63cb8346619dc08db8c29beaf9895";
NSString *ClientID = @"371f58d73e234dcc89342931c211714b6fd6a60cfb719a1d3f6764648f34188f";
NSString *RedirectURLString = @"https://flark.io/coinbase_redirect.html";

@implementation RequestBuilder (Authorization)

- (NSURLRequest *)authorizeRequest {
    NSMutableString *urlString = [NSMutableString stringWithFormat:@"/oauth/authorize"];
    [urlString appendFormat:@"?response_type=code"];
    [urlString appendFormat:@"&client_id=%@", ClientID];
    [urlString appendFormat:@"&redirect_uri=%@", RedirectURLString];
    [urlString appendFormat:@"&scope=%@", @"user+balance"];
    NSURL *authURL = [NSURL URLWithString:urlString relativeToURL:self.baseURL];
    return [NSMutableURLRequest requestWithURL:authURL];
}

- (NSURLRequest *)tokenRequestWithCode:(NSString *)code {
    NSMutableString *urlString = [NSMutableString stringWithFormat:@"/oauth/token"];
    [urlString appendFormat:@"?grant_type=authorization_code"];
    [urlString appendFormat:@"&client_id=%@", ClientID];
    [urlString appendFormat:@"&client_secret=%@", ClientSecret];
    [urlString appendFormat:@"&code=%@", code];
    [urlString appendFormat:@"&redirect_uri=%@", RedirectURLString];
    NSURL *tokenURL = [NSURL URLWithString:urlString relativeToURL:self.baseURL];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:tokenURL];
    request.HTTPMethod = @"POST";
    return request;
}

@end
