//
// Created by Maciej Oczko on 28/01/15.
// Copyright (c) 2015 Polidea. All rights reserved.
//

#import "LoginViewController.h"
#import "UIControl+BlocksKit.h"
#import "UIButton+RACCommandSupport.h"
#import "RACCommand.h"
#import "ALView+PureLayout.h"
#import "RACSignal.h"

@interface LoginViewController ()
@property(nonatomic, strong) UIButton *loginButton;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:self.loginButton];

    self.loginButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id _) {
        // TODO Login signal
        return [RACSignal return:@YES];
    }];
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
