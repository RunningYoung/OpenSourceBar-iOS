//
// Created by Maciej Oczko on 28/01/15.
// Copyright (c) 2015 Polidea. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIClient : NSObject
- (RACSignal *)dataTaskWithRequest:(NSURLRequest *)request;
@end
