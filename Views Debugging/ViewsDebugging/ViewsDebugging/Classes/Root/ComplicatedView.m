//
// Created by Maciej Oczko on 26/01/15.
// Copyright (c) 2015 Polidea. All rights reserved.
//

#import "ComplicatedView.h"
#import "ALView+PureLayout.h"

@interface ComplicatedView ()
@property(nonatomic, readwrite) UILabel *title;
@property(nonatomic, strong) UIView *container;
@property(nonatomic, readwrite) UIView *left;
@property(nonatomic, readwrite) UILabel *right;
@end

@implementation ComplicatedView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor greenColor];
        self.layer.borderWidth = 1.0f;
        self.layer.borderColor = [UIColor grayColor].CGColor;
        
        UILabel *title = [UILabel newAutoLayoutView];
        title.text = @"Complicated View";
        self.title = title;

        UIView *container = [UIView newAutoLayoutView];
        container.backgroundColor = [UIColor greenColor];
        self.container = container;

        UIView *left = [UIView newAutoLayoutView];
        left.backgroundColor = [UIColor yellowColor];
        self.left = left;

        UILabel *right = [UILabel newAutoLayoutView];
        right.backgroundColor = [UIColor clearColor];
        right.text = @"Right label";
        self.right = right;

        [self addSubview:self.title];
        [self.container addSubview:self.left];
        [self.container addSubview:self.right];
        [self addSubview:self.container];

        [self setNeedsUpdateConstraints];
    }

    return self;
}

- (void)updateConstraints {

    [self.title autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [self.title autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [self.container autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.title];
    [self.container autoPinEdgesToSuperviewEdgesWithInsets:ALEdgeInsetsMake(10, 10, 10, 10) excludingEdge:ALEdgeTop];

    [self.left autoPinEdgesToSuperviewEdgesWithInsets:ALEdgeInsetsZero excludingEdge:ALEdgeRight];
    [self.right autoPinEdgesToSuperviewEdgesWithInsets:ALEdgeInsetsZero excludingEdge:ALEdgeLeft];

    [super updateConstraints];
}

@end
