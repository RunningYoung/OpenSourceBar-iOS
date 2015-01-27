//
// Created by Maciej Oczko on 26/01/15.
// Copyright (c) 2015 Polidea. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class ViewConfiguration;

@interface SharedViewController : UIViewController
@property(nonatomic, readonly) ViewConfiguration *viewConfiguration;
- (instancetype)initWithViewConfiguration:(ViewConfiguration *)viewConfiguration;
+ (instancetype)controllerWithViewConfiguration:(ViewConfiguration *)viewConfiguration;


@end
