//
// Created by Maciej Oczko on 12/01/15.
// Copyright (c) 2015 Polidea. All rights reserved.
//

#import "RootView.h"
#import "ALView+PureLayout.h"

@interface RootView ()
@property(nonatomic, strong) UIView *container;
@property(nonatomic, readwrite) UIButton *normalButton;
@property(nonatomic, readwrite) UIButton *racButton;
@end

@implementation RootView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];

        self.container = [UIView new];
        [self addSubview:self.container];

        UIButton *normalButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [normalButton setTitle:@"Normal" forState:UIControlStateNormal];
        self.normalButton = normalButton;
        [self.container addSubview:self.normalButton];

        UIButton *racButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [racButton setTitle:@"RAC" forState:UIControlStateNormal];
        self.racButton = racButton;
        [self.container addSubview:self.racButton];

        [self setNeedsUpdateConstraints];
    }

    return self;
}

- (void)updateConstraints {
    [self.normalButton autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [self.normalButton autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [self.racButton autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [self.racButton autoPinEdgeToSuperviewEdge:ALEdgeBottom];

    [self.normalButton autoPinEdgeToSuperviewMargin:ALEdgeLeft];
    [self.racButton autoPinEdgeToSuperviewMargin:ALEdgeRight];

    [self.container autoSetDimensionsToSize:CGSizeMake(200, 100)];
    [self.container autoCenterInSuperview];
    [super updateConstraints];
}


@end
