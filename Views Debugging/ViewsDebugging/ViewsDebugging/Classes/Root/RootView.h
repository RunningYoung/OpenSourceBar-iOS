//
// Created by Maciej Oczko on 26/01/15.
// Copyright (c) 2015 Polidea. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class ComplicatedView;

@interface RootView : UIView
@property(nonatomic, readonly) ComplicatedView *complicatedView;
@property(nonatomic, weak) UIView *guestView;
@end
