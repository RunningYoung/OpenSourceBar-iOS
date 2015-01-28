//
// Created by Maciej Oczko on 28/01/15.
// Copyright (c) 2015 Polidea. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RequestBuilder.h"

extern NSString *RedirectURLString;

@interface RequestBuilder (Authorization)
- (NSURLRequest *)authorizeRequest;
- (NSURLRequest *)tokenRequestWithCode:(NSString *)code;
@end
