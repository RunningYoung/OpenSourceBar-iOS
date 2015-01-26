//
// Created by Maciej Oczko on 26/01/15.
// Copyright (c) 2015 Polidea. All rights reserved.
//

#import "RootView.h"
#import "ComplicatedView.h"
#import "ALView+PureLayout.h"

@interface RootView ()
@property(nonatomic, readwrite) ComplicatedView *complicatedView;
@end

@implementation RootView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor greenColor];

        self.complicatedView = [ComplicatedView newAutoLayoutView];
        [self addSubview:self.complicatedView];

        [self setNeedsUpdateConstraints];
    }

    return self;
}

- (void)setGuestView:(UIView *)guestView {
    if (_guestView != guestView) {
        [_guestView removeFromSuperview];
        _guestView = guestView;
        [self addSubview:_guestView];
    }
}

- (void)updateConstraints {

    // TODO updateConstraints

    [super updateConstraints];
}


@end
