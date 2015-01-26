//
// Created by Maciej Oczko on 26/01/15.
// Copyright (c) 2015 Polidea. All rights reserved.
//

#import "RootViewController.h"
#import "UIBarButtonItem+BlocksKit.h"

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"AutoLayout";
    self.view.backgroundColor = [UIColor lightGrayColor];

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] bk_initWithTitle:@"PureLayout"
                                                                                style:UIBarButtonItemStylePlain
                                                                              handler:^(id sender) {

                                                                              }];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] bk_initWithTitle:@"Masonry"
                                                                                 style:UIBarButtonItemStylePlain
                                                                               handler:^(id sender) {

                                                                               }];
}

@end
