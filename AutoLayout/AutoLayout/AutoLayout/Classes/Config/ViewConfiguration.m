//
// Created by Maciej Oczko on 26/01/15.
// Copyright (c) 2015 Polidea. All rights reserved.
//

#import "ViewConfiguration.h"

@implementation ViewConfiguration

+ (instancetype)configurationWithViewClass:(Class)viewClass complicatedViewClass:(Class)complicatedViewClass {
    return [[self alloc] initWithViewClass:viewClass complicatedViewClass:complicatedViewClass];
}

- (instancetype)initWithViewClass:(Class)viewClass complicatedViewClass:(Class)complicatedViewClass {
    self = [super init];
    if (self) {
        _viewClass = viewClass;
        _complicatedViewClass = complicatedViewClass;
    }

    return self;
}

@end
