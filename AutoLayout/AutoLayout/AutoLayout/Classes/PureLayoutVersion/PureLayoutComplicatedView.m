//
// Created by Maciej Oczko on 26/01/15.
// Copyright (c) 2015 Polidea. All rights reserved.
//

#import "PureLayoutComplicatedView.h"
#import <PureLayout.h>

@implementation PureLayoutComplicatedView

- (void)updateConstraints {

    [self.title autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [self.title autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [self.container autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.title];
    [self.container autoPinEdgesToSuperviewEdgesWithInsets:ALEdgeInsetsMake(10, 10, 10, 10) excludingEdge:ALEdgeTop];

    [self.left autoPinEdgesToSuperviewEdgesWithInsets:ALEdgeInsetsZero excludingEdge:ALEdgeRight];
    [self.right autoPinEdgesToSuperviewEdgesWithInsets:ALEdgeInsetsZero excludingEdge:ALEdgeLeft];
    [self.right autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.left];

    [super updateConstraints];
}

@end
