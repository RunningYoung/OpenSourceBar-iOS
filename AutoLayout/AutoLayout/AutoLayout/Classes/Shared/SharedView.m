//
// Created by Maciej Oczko on 26/01/15.
// Copyright (c) 2015 Polidea. All rights reserved.
//

#import "SharedView.h"
#import "ComplicatedView.h"

@interface SharedView ()
@property(nonatomic, readwrite) ComplicatedView *complicatedView;
@end

@implementation SharedView

- (instancetype)initWithComplicatedViewClass:(Class)complicatedViewClass {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        _complicatedViewClass = complicatedViewClass;
        self.backgroundColor = [UIColor greenColor];
        [self setNeedsUpdateConstraints];
    }

    return self;
}

- (ComplicatedView *)complicatedView {
    if (!_complicatedView) {
        ComplicatedView *view = (id) [self.complicatedViewClass new];
        view.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:view];
        _complicatedView = view;
    }
    return _complicatedView;
}

- (void)setGuestView:(UIView *)guestView {
    if (_guestView != guestView) {
        [_guestView removeFromSuperview];
        _guestView = guestView;
        [self addSubview:_guestView];
    }
}

@end
