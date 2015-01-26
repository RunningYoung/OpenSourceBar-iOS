//
// Created by Maciej Oczko on 26/01/15.
// Copyright (c) 2015 Polidea. All rights reserved.
//

#import <PureLayout/ALView+PureLayout.h>
#import "RootViewController.h"
#import "RootView.h"
#import "TableViewController.h"

@interface RootViewController ()
@property(nonatomic, readonly) TableViewController *tableViewController;
@end

@implementation RootViewController {
    TableViewController *_tableViewController;
};

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Views Debugging";
    }

    return self;
}

- (TableViewController *)tableViewController {
    if (!_tableViewController) {
        _tableViewController = [TableViewController defaultViewController];
    }
    return _tableViewController;
}

- (RootView *)rootView {
    return (RootView *) self.view;
}

- (void)loadView {
    self.view = [RootView new];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildViewController:self.tableViewController];
    self.rootView.guestView = self.tableViewController.view;
    [self.tableViewController didMoveToParentViewController:self];
}

@end
