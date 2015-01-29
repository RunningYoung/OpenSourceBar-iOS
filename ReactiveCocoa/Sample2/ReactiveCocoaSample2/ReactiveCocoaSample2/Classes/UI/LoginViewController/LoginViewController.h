//
// Created by Maciej Oczko on 28/01/15.
// Copyright (c) 2015 Polidea. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class LoginService;

@interface LoginViewController : UIViewController
@property(nonatomic, readonly) LoginService *loginService;

@property(nonatomic, readonly) RACSignal *dismissSignal;
@property(nonatomic, readonly) RACSignal *loggedInSignal;

+ (instancetype)controllerWithLoginService:(LoginService *)loginService;
- (instancetype)initWithLoginService:(LoginService *)loginService;

@end
