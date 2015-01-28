//
// Created by Maciej Oczko on 28/01/15.
// Copyright (c) 2015 Polidea. All rights reserved.
//

#import "NSJSONSerialization+RAC.h"

@implementation NSJSONSerialization (RAC)

+ (RACSignal *)deserialize:(NSData *)data {
    return [RACSignal createSignal:^RACDisposable *(id <RACSubscriber> subscriber) {
        NSError *maybeError = nil;
        id object = [NSJSONSerialization JSONObjectWithData:data
                                                    options:0
                                                      error:&maybeError];
        if (!object) {
            [subscriber sendError:maybeError];
        } else {
            [subscriber sendNext:object];
        }
        [subscriber sendCompleted];
        return nil;
    }];
}

@end
