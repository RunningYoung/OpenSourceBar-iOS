//
// Created by Maciej Oczko on 28/01/15.
// Copyright (c) 2015 Polidea. All rights reserved.
//

#import "RACSignal+JSONify.h"
#import "NSJSONSerialization+RAC.h"


@implementation RACSignal (JSONify)

- (instancetype)jsonify {
    return [self flattenMap:^RACStream *(NSData *data) {
        return [NSJSONSerialization deserialize:data];
    }];
}

@end
