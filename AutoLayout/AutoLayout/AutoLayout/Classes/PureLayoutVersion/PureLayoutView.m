//
// Created by Maciej Oczko on 26/01/15.
// Copyright (c) 2015 Polidea. All rights reserved.
//

#import "PureLayoutView.h"
#import <PureLayout.h>

@implementation PureLayoutView

- (void)updateConstraints {

    [self.complicatedView autoPinEdgesToSuperviewEdgesWithInsets:ALEdgeInsetsMake(64, 10, 10, 10)
                                                   excludingEdge:ALEdgeBottom];

    [self.guestView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.complicatedView];
    [self.guestView autoPinEdgesToSuperviewEdgesWithInsets:ALEdgeInsetsMake(10, 10, 10, 10)
                                             excludingEdge:ALEdgeTop];

    [super updateConstraints];
}

@end
