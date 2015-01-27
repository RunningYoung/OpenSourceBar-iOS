//
// Created by Maciej Oczko on 27/01/15.
// Copyright (c) 2015 Polidea. All rights reserved.
//

#import "ManualLayoutView.h"

@implementation ManualLayoutView

- (void)updateConstraints {

    NSDictionary *views = @{
            @"guestView" : self.guestView,
            @"complicatedView" : self.complicatedView,
    };
    NSDictionary *metrics = @{
            @"top" : @64,
            @"left" : @10,
            @"bottom" : @10,
            @"right" : @10,
    };

    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-top-[complicatedView][guestView]-bottom-|"
                                                                 options:NSLayoutFormatDirectionLeadingToTrailing
                                                                 metrics:metrics
                                                                   views:views]];

    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-left-[complicatedView]-right-|"
                                                                 options:NSLayoutFormatDirectionLeadingToTrailing
                                                                 metrics:metrics
                                                                   views:views]];

    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-left-[guestView]-right-|"
                                                                 options:NSLayoutFormatDirectionLeadingToTrailing
                                                                 metrics:metrics
                                                                   views:views]];

    [super updateConstraints];
}

@end
