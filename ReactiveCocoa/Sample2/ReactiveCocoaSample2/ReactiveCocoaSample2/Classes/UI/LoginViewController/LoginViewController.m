//
// Created by Maciej Oczko on 28/01/15.
// Copyright (c) 2015 Polidea. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginService.h"
#import "UIBarButtonItem+BlocksKit.h"
#import "ALView+PureLayout.h"

@interface LoginViewController ()
@property(nonatomic, strong) RACSubject *dismissSubject;
@property(nonatomic, strong) RACSubject *loggedInSubject;
@property(nonatomic, readwrite) LoginService *loginService;

@property(nonatomic, strong) UIWebView *webView;
@end

@implementation LoginViewController

+ (instancetype)controllerWithLoginService:(LoginService *)loginService {
    return [[self alloc] initWithLoginService:loginService];
}

- (instancetype)initWithLoginService:(LoginService *)loginService {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.loginService = loginService;
        self.dismissSubject = [RACSubject subject];
        self.loggedInSubject = [RACSubject subject];
    }

    return self;
}

- (RACSignal *)dismissSingal {
    return self.dismissSubject;
}

- (RACSignal *)loggedInSignal {
    return self.loggedInSubject;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.webView];
    [self configureDismissAction];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.webView autoPinEdgesToSuperviewEdgesWithInsets:ALEdgeInsetsZero];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    @weakify(self)
    [[self.loginService authenticateWithWebView:self.webView]
            subscribeNext:^(NSNumber *loggedIn) {
                @strongify(self)
                [self.loggedInSubject sendNext:loggedIn];
            }];
}

#pragma mark - Stuff

- (void)configureDismissAction {
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] bk_initWithTitle:@"Cancel"
                                                                                style:UIBarButtonItemStylePlain
                                                                              handler:^(id _) {
                                                                                  [self.dismissSubject sendCompleted];
                                                                              }];
}

#pragma mark - WebView

- (UIWebView *)webView {
    if (!_webView) {
        _webView = [UIWebView newAutoLayoutView];
    }
    return _webView;
}

@end
