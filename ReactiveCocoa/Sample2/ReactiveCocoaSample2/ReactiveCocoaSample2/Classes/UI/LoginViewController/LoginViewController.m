//
// Created by Maciej Oczko on 28/01/15.
// Copyright (c) 2015 Polidea. All rights reserved.
//

#import "LoginViewController.h"
#import "ALView+PureLayout.h"
#import "LoginService.h"

@interface LoginViewController ()
@property(nonatomic, strong) UIButton *loginButton;
@end

@implementation LoginViewController

+ (instancetype)controllerWithLoginService:(LoginService *)loginService {
    return [[self alloc] initWithLoginService:loginService];
}

- (instancetype)initWithLoginService:(LoginService *)loginService {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _loginService = loginService;
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:self.loginButton];

    @weakify(self)
    RACCommand *command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id _) {
        @strongify(self)
        // TODO Add webView
        return [self.loginService authenticateWithWebView:nil];
    }];
    [[[command.executionSignals
            flattenMap:^RACStream *(id value) {
                return value;
            }]
            ignore:@NO]
            subscribeNext:^(NSNumber *loggedIn) {
                NSLog(@"Result = %@", loggedIn);
            }];
    self.loginButton.rac_command = command;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.loginButton autoCenterInSuperview];
}

- (UIButton *)loginButton {
    if (!_loginButton) {
        UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeSystem];
        loginButton.translatesAutoresizingMaskIntoConstraints = NO;
        [loginButton setTitle:@"LOGIN" forState:UIControlStateNormal];
        _loginButton = loginButton;
    }
    return _loginButton;
}


@end
