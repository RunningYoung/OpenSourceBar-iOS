//
// Created by Maciej Oczko on 12/01/15.
// Copyright (c) 2015 Polidea. All rights reserved.
//

#import "RACLoginViewController.h"
#import "LoginView.h"
#import "LoginService.h"
#import "MainViewController.h"

@interface RACLoginViewController ()
@property(nonatomic, strong) LoginService *loginService;
@end

@implementation RACLoginViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.loginService = [LoginService new];
    }

    return self;
}

- (LoginView *)loginView {
    return (LoginView *) self.view;
}

- (void)loadView {
    self.view = [LoginView new];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    RACSignal *validUsernameSignal = [self validSignalForTextField:self.loginView.username];
    RACSignal *validPasswordSignal = [self validSignalForTextField:self.loginView.password];

    RAC(self.loginView.username, backgroundColor) = [validUsernameSignal map:self.validToBackground];
    RAC(self.loginView.password, backgroundColor) = [validPasswordSignal map:self.validToBackground];

    RACSignal *signUpActiveSignal = [[RACSignal
            combineLatest:@[validUsernameSignal, validPasswordSignal]]
            and];

    [self configureSignUpWithActivationSignal:signUpActiveSignal];
}

#pragma mark - Validation

- (RACSignal *)validSignalForTextField:(UITextField *)textField {
    NSNumber *(^isValidText)(NSString *) = ^NSNumber *(NSString *text) {
        return @(text.length > 3);
    };
    return [[[textField rac_textSignal] map:isValidText] distinctUntilChanged];
}

- (UIColor *(^)(NSNumber *))validToBackground {
    return ^UIColor *(NSNumber *isValid) {
        return isValid.boolValue ? [UIColor yellowColor] : [UIColor clearColor];
    };
}

#pragma mark - Sign Up

- (void)configureSignUpWithActivationSignal:(RACSignal *)signUpActiveSignal {
    RACCommand *signUpCommand = [[RACCommand alloc] initWithEnabled:signUpActiveSignal
                                                        signalBlock:^RACSignal *(id _) {
                                                            return [self signUpSignal];
                                                        }];

    [[signUpCommand.executionSignals
            flattenMap:^RACStream *(RACSignal *signal) {
                return signal;
            }]
            subscribeNext:^(NSNumber *success) {
                if (success.boolValue) {
                    [self.navigationController pushViewController:[MainViewController new] animated:YES];
                } else {
                    [self showWrongCredentialAlert];
                }
            }];

    self.loginView.signIn.rac_command = signUpCommand;
}

- (RACSignal *)signUpSignal {
    return [self.loginService signInWithUsername:self.loginView.username.text
                                        password:self.loginView.password.text];
}

#pragma mark - Helpers

- (void)showWrongCredentialAlert {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error"
                                                                             message:@"Wrong credentials"
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK"
                                                        style:UIAlertActionStyleCancel
                                                      handler:^(UIAlertAction *action) {
                                                          [self dismissViewControllerAnimated:YES
                                                                                   completion:nil];
                                                      }]];
    [self presentViewController:alertController
                       animated:YES
                     completion:nil];
}

@end
