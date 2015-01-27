//
// Created by Maciej Oczko on 26/01/15.
// Copyright (c) 2015 Polidea. All rights reserved.
//

#import "ViewConfiguration.h"

@implementation ViewConfiguration

+ (instancetype)configurationWithTitle:(NSString *)title viewClass:(Class)viewClass complicatedViewClass:(Class)complicatedViewClass {
    return [[self alloc] initWithTitle:title viewClass:viewClass complicatedViewClass:complicatedViewClass];
}

- (instancetype)initWithTitle:(NSString *)title viewClass:(Class)viewClass complicatedViewClass:(Class)complicatedViewClass {
    self = [super init];
    if (self) {
        _title = [title copy];
        _viewClass = viewClass;
        _complicatedViewClass = complicatedViewClass;
    }

    return self;
}


@end
