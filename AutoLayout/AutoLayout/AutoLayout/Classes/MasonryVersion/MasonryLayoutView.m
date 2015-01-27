//
// Created by Maciej Oczko on 26/01/15.
// Copyright (c) 2015 Polidea. All rights reserved.
//

#import "MasonryLayoutView.h"
#import <Masonry.h>

@implementation MasonryLayoutView

- (void)updateConstraints {

    [self.complicatedView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.offset(64);
        make.left.equalTo(self.mas_left).with.offset(10);
        make.right.equalTo(self.mas_right).with.offset(-10);
    }];

    [self.guestView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.complicatedView.mas_bottom);
        make.bottom.equalTo(self.mas_bottom).with.offset(-10);
        make.left.equalTo(self.mas_left).with.offset(10);
        make.right.equalTo(self.mas_right).with.offset(-10);
    }];

    [super updateConstraints];
}

@end
