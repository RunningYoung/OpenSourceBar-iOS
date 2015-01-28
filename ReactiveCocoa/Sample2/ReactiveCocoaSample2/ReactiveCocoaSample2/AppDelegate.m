//
//  AppDelegate.m
//  ReactiveCocoaSample2
//
//  Created by Maciej Oczko on 28/01/15.
//  Copyright (c) 2015 Polidea. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "LoginService.h"
#import "APIClient.h"
#import "RequestBuilder.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[self loginViewController]];
    [self.window makeKeyAndVisible];
    return YES;
}

- (LoginViewController *)loginViewController {
    APIClient *apiClient = [APIClient new];
    RequestBuilder *requestBuilder = [RequestBuilder new];
    LoginService *loginService = [LoginService serviceWithAPIClient:apiClient requestBuilder:requestBuilder];
    LoginViewController *loginViewController = [LoginViewController controllerWithLoginService:loginService];
    return loginViewController;
}

@end
