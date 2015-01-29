//
// Created by Maciej Oczko on 12/01/15.
// Copyright (c) 2015 Polidea. All rights reserved.
//

#import "UIButton+Utils.h"

@implementation UIButton (Utils)

- (void)setAction:(void (^)())action {
    NSAssert(action != nil, @"Action cannot be nil");
    self.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return [RACSignal createSignal:^RACDisposable *(id <RACSubscriber> subscriber) {
            action();
            [subscriber sendCompleted];
            return nil;
        }];
    }];
}

@end
