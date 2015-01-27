//
// Created by Maciej Oczko on 26/01/15.
// Copyright (c) 2015 Polidea. All rights reserved.
//

#import "MasonryComplicatedView.h"
#import <Masonry.h>

@implementation MasonryComplicatedView

- (void)updateConstraints {

    [self.title mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.centerX.equalTo(self.mas_centerX);
    }];

    [self.container mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.title.mas_bottom);
        make.bottom.equalTo(self.mas_bottom).with.offset(-10);
        make.left.equalTo(self.mas_left).with.offset(10);
        make.right.equalTo(self.mas_right).with.offset(-10);
    }];

    [self.left mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.left.and.bottom.equalTo(self.container);
    }];

    [self.right mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.right.and.bottom.equalTo(self.container);
        make.left.equalTo(self.left.mas_right);
    }];

    [super updateConstraints];
}

@end
