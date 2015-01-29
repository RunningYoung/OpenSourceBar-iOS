//
// Created by Maciej Oczko on 29/01/15.
// Copyright (c) 2015 Polidea. All rights reserved.
//

#import "RootViewController.h"
#import "ALView+PureLayout.h"
#import "LoginViewController.h"
#import "RequestBuilder.h"
#import "LoginService.h"
#import "APIClient.h"
#import "UIControl+BlocksKit.h"
#import "MainViewController.h"

@interface RootViewController ()
@property(nonatomic, strong) UIButton *loginButton;
@end

@implementation RootViewController

- (UIButton *)loginButton {
    if (!_loginButton) {
        UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeSystem];
        loginButton.translatesAutoresizingMaskIntoConstraints = NO;
        [loginButton setTitle:@"LOGIN" forState:UIControlStateNormal];
        _loginButton = loginButton;
    }
    return _loginButton;
}

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Hello";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.loginButton];

    [self.loginButton bk_addEventHandler:^(id _) {
         [self showLoginViewController];
     }
                        forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.loginButton autoCenterInSuperview];
}

#pragma mark - Login View Controller

- (void)showLoginViewController {
    LoginViewController *loginViewController = [self loginViewController];

    [loginViewController.dismissSignal subscribeCompleted:^{
        [self dismissViewControllerAnimated:YES completion:nil];
    }];

    @weakify(self)
    [[loginViewController.loggedInSignal logError]
            subscribeNext:^(NSNumber *isLoggedIn) {
                @strongify(self)
                [self dismissViewControllerAnimated:YES completion:^{
                    [self showMainViewController];
                }];
            }];

    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    [self presentViewController:navigationController animated:YES completion:nil];
}

- (void)showMainViewController {
    MainViewController *mainViewController = [MainViewController new];
    [self.navigationController pushViewController:mainViewController animated:YES];
}

- (LoginViewController *)loginViewController {
    APIClient *apiClient = [APIClient new];
    RequestBuilder *requestBuilder = [RequestBuilder new];
    LoginService *loginService = [LoginService serviceWithAPIClient:apiClient requestBuilder:requestBuilder];
    LoginViewController *loginViewController = [LoginViewController controllerWithLoginService:loginService];
    return loginViewController;
}

@end
