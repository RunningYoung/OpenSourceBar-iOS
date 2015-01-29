//
// Created by Maciej Oczko on 28/01/15.
// Copyright (c) 2015 Polidea. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIWebView (RAC)
@property(nonatomic, readonly) RACSubject *_shouldStartLoadSubject;

- (RACSignal *)shouldStartLoadSignal;
@end
