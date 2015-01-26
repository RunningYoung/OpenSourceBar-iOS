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
        
        UILabel *title = [UILabel newAutoLayoutView];
        title.text = @"Complicated View";
        self.title = title;

        UIView *container = [UIView newAutoLayoutView];
        container.backgroundColor = [UIColor greenColor];
        self.container = container;

        UIView *left = [UIView newAutoLayoutView];
        left.backgroundColor = [UIColor greenColor];
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

    // TODO updateConstraints

    [super updateConstraints];
}


@end
