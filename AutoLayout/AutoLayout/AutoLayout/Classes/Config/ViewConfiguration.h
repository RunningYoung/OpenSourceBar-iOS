//
// Created by Maciej Oczko on 26/01/15.
// Copyright (c) 2015 Polidea. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ViewConfiguration : NSObject
@property(nonatomic, readonly, copy) NSString *title;
@property(nonatomic, readonly) Class viewClass;
@property(nonatomic, readonly) Class complicatedViewClass;

+ (instancetype)configurationWithTitle:(NSString *)title
                             viewClass:(Class)viewClass
                  complicatedViewClass:(Class)complicatedViewClass;

@end
