//
// Created by Maciej Oczko on 12/01/15.
// Copyright (c) 2015 Polidea. All rights reserved.
//

#import "RootViewController.h"
#import "RootView.h"
#import "NormalLoginViewController.h"
#import "UIButton+Utils.h"
#import "RACLoginViewController.h"

@implementation RootViewController

- (RootView *)rootView {
    return (RootView *) self.view;
}

- (void)loadView {
    self.view = [RootView new];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Hello";

    @weakify(self)
    [self.rootView.normalButton setAction:^{
        @strongify(self)
        [self.navigationController pushViewController:[NormalLoginViewController new] animated:YES];
    }];

    [self.rootView.racButton setAction:^{
        @strongify(self)
        [self.navigationController pushViewController:[RACLoginViewController new] animated:YES];
    }];
}

@end
