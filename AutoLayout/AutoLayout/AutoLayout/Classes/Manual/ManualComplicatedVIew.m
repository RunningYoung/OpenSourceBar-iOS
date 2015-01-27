//
// Created by Maciej Oczko on 27/01/15.
// Copyright (c) 2015 Polidea. All rights reserved.
//

#import "ManualComplicatedView.h"

@implementation ManualComplicatedView

- (void)updateConstraints {

    NSDictionary *views = @{
            @"title" : self.title,
            @"container" : self.container,
            @"leftView" : self.left,
            @"rightView" : self.right,
    };
    NSDictionary *metrics = @{
            @"left" : @10,
            @"bottom" : @10,
            @"right" : @10,
    };

    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[title][container]-bottom-|"
                                                                 options:NSLayoutFormatAlignAllCenterX
                                                                 metrics:metrics
                                                                   views:views]];

//    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.title
//                                                     attribute:NSLayoutAttributeCenterX
//                                                     relatedBy:NSLayoutRelationEqual
//                                                        toItem:self
//                                                     attribute:NSLayoutAttributeCenterX
//                                                    multiplier:1
//                                                      constant:0]];

    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-left-[container]-right-|"
                                                                 options:NSLayoutFormatDirectionLeadingToTrailing
                                                                 metrics:metrics
                                                                   views:views]];

    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[leftView][rightView]|"
                                                                 options:NSLayoutFormatDirectionLeadingToTrailing
                                                                 metrics:metrics
                                                                   views:views]];

    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[leftView]|"
                                                                 options:NSLayoutFormatDirectionLeadingToTrailing
                                                                 metrics:metrics
                                                                   views:views]];

    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[rightView]|"
                                                                 options:NSLayoutFormatDirectionLeadingToTrailing
                                                                 metrics:metrics
                                                                   views:views]];


    [super updateConstraints];
}

@end
