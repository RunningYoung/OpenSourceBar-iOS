//
//  AppDelegate.m
//  AutoLayout
//
//  Created by Maciej Oczko on 26/01/15.
//  Copyright (c) 2015 Polidea. All rights reserved.
//

#import "AppDelegate.h"

#if defined(DEBUG)
#import "iOSHierarchyViewer.h"
#endif

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
#if defined(DEBUG)
    [iOSHierarchyViewer start];
#endif
}

@end
