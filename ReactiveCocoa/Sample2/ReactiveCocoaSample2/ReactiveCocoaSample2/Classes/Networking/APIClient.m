//
// Created by Maciej Oczko on 28/01/15.
// Copyright (c) 2015 Polidea. All rights reserved.
//

#import "APIClient.h"
#import "AFURLSessionManager.h"

@interface APIClient ()
@property(nonatomic, strong) AFURLSessionManager *sessionManager;
@end

@implementation APIClient

- (AFURLSessionManager *)sessionManager {
    if (!_sessionManager) {
        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        _sessionManager = [[AFURLSessionManager alloc] initWithSessionConfiguration:sessionConfiguration];
    }
    return _sessionManager;
}

- (RACSignal *)dataTaskWithRequest:(NSURLRequest *)request {
    @weakify(self)
    return [RACSignal createSignal:^RACDisposable *(id <RACSubscriber> subscriber) {
        @strongify(self)
        NSURLSessionDataTask *dataTask = [self.sessionManager dataTaskWithRequest:request
                                                                completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
                                                                    if (error) {
                                                                        [subscriber sendError:error];
                                                                    } else {
                                                                        [subscriber sendNext:responseObject];
                                                                    }
                                                                    [subscriber sendCompleted];
                                                                }];
        [dataTask resume];
        return [RACDisposable disposableWithBlock:^{
            [dataTask cancel];
        }];
    }];
}

@end
