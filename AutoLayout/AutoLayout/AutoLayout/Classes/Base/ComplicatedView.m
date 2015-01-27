//
// Created by Maciej Oczko on 26/01/15.
// Copyright (c) 2015 Polidea. All rights reserved.
//

#import "ComplicatedView.h"

@interface ComplicatedView ()
@property(nonatomic, readwrite) UILabel *title;
@property(nonatomic, readwrite) UIView *container;
@property(nonatomic, readwrite) UIView *left;
@property(nonatomic, readwrite) UILabel *right;
@end

@implementation ComplicatedView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor greenColor];

        UILabel *title = [UILabel new];
        title.translatesAutoresizingMaskIntoConstraints = NO;
        title.text = @"Complicated View";
        self.title = title;

        UIView *container = [UIView new];
        container.translatesAutoresizingMaskIntoConstraints = NO;
        container.backgroundColor = [UIColor yellowColor];
        self.container = container;

        UIView *left = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
        left.translatesAutoresizingMaskIntoConstraints = NO;
        left.backgroundColor = [UIColor redColor];
        self.left = left;

        UILabel *right = [UILabel new];
        right.translatesAutoresizingMaskIntoConstraints = NO;
        right.backgroundColor = [UIColor clearColor];
        right.text = @"Right label";
        self.right = right;

        [self addSubview:self.title];
        [self addSubview:self.container];
        [self.container addSubview:self.left];
        [self.container addSubview:self.right];

        [self setNeedsUpdateConstraints];
    }

    return self;
}

@end
