//
// Created by Maciej Oczko on 29/01/15.
// Copyright (c) 2015 Polidea. All rights reserved.
//

#import "UIAlertController+Utils.h"

@implementation UIAlertController (Utils)

+ (void)showWrongCredentialAlertInViewController:(UIViewController *)viewController {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error"
                                                                             message:@"Wrong credentials"
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK"
                                                        style:UIAlertActionStyleCancel
                                                      handler:^(UIAlertAction *action) {
                                                          [viewController dismissViewControllerAnimated:YES
                                                                                   completion:nil];
                                                      }]];
    [viewController presentViewController:alertController
                       animated:YES
                     completion:nil];
}

@end
