//
// Created by Maciej Oczko on 28/01/15.
// Copyright (c) 2015 Polidea. All rights reserved.
//

#import "RequestBuilder.h"

@interface RequestBuilder ()
@property(nonatomic, readwrite) NSURL *baseURL;
@end

@implementation RequestBuilder

- (instancetype)init {
    self = [super init];
    if (self) {
        self.baseURL = [NSURL URLWithString:@"https://www.coinbase.com/"];
    }

    return self;
}

@end
