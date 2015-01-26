//
// Created by Maciej Oczko on 26/01/15.
// Copyright (c) 2015 Polidea. All rights reserved.
//

#import "RootViewController.h"
#import "UIBarButtonItem+BlocksKit.h"
#import "ViewConfiguration.h"
#import "MasonryLayoutView.h"
#import "MasonryComplicatedView.h"
#import "SharedViewController.h"
#import "PureLayoutView.h"
#import "PureLayoutComplicatedView.h"

#define viewConfig(arg1, arg2) \
    [ViewConfiguration configurationWithViewClass:[arg1 class] \
                             complicatedViewClass:[arg2 class]]

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"AutoLayout";
    self.view.backgroundColor = [UIColor lightGrayColor];

    void (^masonryAction)(id) = ^(id _) {
        [self pushControllerWithConfig:viewConfig(MasonryLayoutView, MasonryComplicatedView)];
    };

    void (^pureLayoutAction)(id) = ^(id _) {
        [self pushControllerWithConfig:viewConfig(PureLayoutView, PureLayoutComplicatedView)];
    };

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] bk_initWithTitle:@"PureLayout"
                                                                                style:UIBarButtonItemStylePlain
                                                                              handler:pureLayoutAction];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] bk_initWithTitle:@"Masonry"
                                                                                 style:UIBarButtonItemStylePlain
                                                                               handler:masonryAction];
}

- (void)pushControllerWithConfig:(ViewConfiguration *)config {
    SharedViewController *controller = [SharedViewController controllerWithViewConfiguration:config];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
