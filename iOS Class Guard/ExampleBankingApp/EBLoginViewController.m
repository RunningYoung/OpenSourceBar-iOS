//
//  EBLoginViewController.m
//  ExampleBankingApp
//
//  Created by Kamil Trzciński on 16/10/14.
//  Copyright (c) 2014 Polidea. All rights reserved.
//

#import "EBLoginViewController.h"

@interface EBLoginViewController () {
    IBOutlet UITextField *_clientIDField;
    IBOutlet UITextField *_clientPasswordField;
    IBOutlet UILabel *_loginErrorField;
}
@end

@implementation EBLoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _clientIDField.text = [self readClientID];
    _clientPasswordField.text = [self readClientPassword];
}

- (NSUserDefaults *)userDefaults {
    return [NSUserDefaults standardUserDefaults];
}

- (NSString *)readClientID {
    return [self.userDefaults stringForKey:@"clientID"];
}

- (NSString *)readClientPassword {
    return [self.userDefaults stringForKey:@"clientPassword"];
}

- (void)writeClientID:(NSString *)clientID {
    [self.userDefaults setObject:clientID forKey:@"clientID"];
}

- (void)writeClientPassword:(NSString *)clientPassword {
    [self.userDefaults setObject:clientPassword forKey:@"clientPassword"];
}

- (IBAction)buttonLogin:(id)sender
{
    NSException *testException = [NSException exceptionWithName:@"testException" reason:@"Testing deobfuscation" userInfo:nil];
//    @throw testException;
    if(![_clientIDField.text isEqualToString:@"123"]) {
        _loginErrorField.text = @"Invalid ID";
        return;
    }
    
    if(![_clientPasswordField.text isEqualToString:@"pass"]) {
        _loginErrorField.text = @"Invalid password";
        return;
    }
    
    [self writeClientID:_clientIDField.text];
    [self writeClientPassword:_clientPasswordField.text];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"WelcomeScreen"];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
