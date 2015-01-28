//
// Created by Maciej Oczko on 12/01/15.
// Copyright (c) 2015 Polidea. All rights reserved.
//

#import "NormalLoginViewController.h"
#import "LoginView.h"
#import "LoginService.h"
#import "MainViewController.h"

@interface NormalLoginViewController ()
@property(nonatomic, strong) LoginService *loginService;

@property(nonatomic) BOOL isUsernameValid;
@property(nonatomic) BOOL isPasswordValid;
@end

@implementation NormalLoginViewController

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
    self.loginView.username.delegate = self;
    self.loginView.password.delegate = self;
    self.loginView.signIn.enabled = NO;
    [self.loginView.signIn addTarget:self action:@selector(didTapSignIn) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setIsUsernameValid:(BOOL)isUsernameValid {
    _isUsernameValid = isUsernameValid;
    self.loginView.username.backgroundColor = isUsernameValid ? [UIColor yellowColor] : [UIColor clearColor];
}

- (void)setIsPasswordValid:(BOOL)isPasswordValid {
    _isPasswordValid = isPasswordValid;
    self.loginView.password.backgroundColor = isPasswordValid ? [UIColor yellowColor] : [UIColor clearColor];
}

#pragma mark - UITextField delegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSMutableString *currentString = [NSMutableString stringWithString:textField.text];
    [currentString replaceCharactersInRange:range withString:string];

    if ([textField isEqual:self.loginView.username]) {
        self.isUsernameValid = currentString.length > 3;
    }
    else if ([textField isEqual:self.loginView.password]) {
        self.isPasswordValid = currentString.length > 3;
    }

    self.loginView.signIn.enabled = self.isUsernameValid && self.isPasswordValid;
    return YES;
}

#pragma mark - Sign In

- (void)didTapSignIn {
    if (self.isUsernameValid && self.isPasswordValid) {
        [self.loginService signInWithUsername:self.loginView.username.text
                                     password:self.loginView.password.text
                                   completion:^(BOOL success) {
                                       if (success) {
                                           [self.navigationController pushViewController:[MainViewController new] animated:YES];
                                       } else {
                                           [self showWrongCredentialAlert];
                                       }
                                   }];
    }
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
