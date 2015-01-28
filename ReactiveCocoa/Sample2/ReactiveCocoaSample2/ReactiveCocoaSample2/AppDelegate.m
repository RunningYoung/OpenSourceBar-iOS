//
//  AppDelegate.m
//  ReactiveCocoaSample2
//
//  Created by Maciej Oczko on 28/01/15.
//  Copyright (c) 2015 Polidea. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[LoginViewController new]];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
