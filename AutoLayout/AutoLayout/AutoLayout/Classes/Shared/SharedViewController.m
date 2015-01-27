//
// Created by Maciej Oczko on 26/01/15.
// Copyright (c) 2015 Polidea. All rights reserved.
//

#import "SharedViewController.h"
#import "TableViewController.h"
#import "SharedView.h"
#import "ViewConfiguration.h"

@interface SharedViewController ()
@property(nonatomic, readonly) TableViewController *tableViewController;
@end

@implementation SharedViewController {
    TableViewController *_tableViewController;
}

+ (instancetype)controllerWithViewConfiguration:(ViewConfiguration *)viewConfiguration {
    return [[self alloc] initWithViewConfiguration:viewConfiguration];
}

- (instancetype)initWithViewConfiguration:(ViewConfiguration *)viewConfiguration {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _viewConfiguration = viewConfiguration;
    }

    return self;
}

- (TableViewController *)tableViewController {
    if (!_tableViewController) {
        _tableViewController = [TableViewController defaultViewController];
    }
    return _tableViewController;
}

- (SharedView *)rootView {
    return (SharedView *) self.view;
}

- (void)loadView {
    ViewConfiguration *config = self.viewConfiguration;
    self.view = [[(id) config.viewClass alloc] initWithComplicatedViewClass:config.complicatedViewClass];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self addChildViewController:self.tableViewController];
    self.rootView.guestView = self.tableViewController.view;
    [self.tableViewController didMoveToParentViewController:self];
}

@end
