//
// Created by Maciej Oczko on 12/01/15.
// Copyright (c) 2015 Polidea. All rights reserved.
//

#import "LoginView.h"
#import "ALView+PureLayout.h"


@interface LoginView ()
@property(nonatomic, readwrite) UITextField *username;
@property(nonatomic, readwrite) UITextField *password;
@property(nonatomic, readwrite) UIButton *signIn;
@end

@implementation LoginView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];

        self.username = [UITextField new];
        self.username.placeholder = @"Username";
        self.username.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        [self addSubview:self.username];

        self.password = [UITextField new];
        self.password.placeholder = @"Password";
        self.password.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        [self addSubview:self.password];

        self.signIn = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.signIn setTitle:@"Sign In" forState:UIControlStateNormal];
        [self addSubview:self.signIn];

        [self setNeedsUpdateConstraints];
    }

    return self;
}

- (void)updateConstraints {
    [self.username autoAlignAxis:ALAxisVertical toSameAxisOfView:self];
    [self.username autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:100];
    [self.username autoSetDimension:ALDimensionWidth toSize:120];

    [self.password autoAlignAxis:ALAxisVertical toSameAxisOfView:self];
    [self.password autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.username withOffset:10];
    [self.password autoSetDimension:ALDimensionWidth toSize:120];

    [self.signIn autoAlignAxis:ALAxisVertical toSameAxisOfView:self];
    [self.signIn autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.password withOffset:20];

    [super updateConstraints];
}

@end
