//
// Created by Maciej Oczko on 28/01/15.
// Copyright (c) 2015 Polidea. All rights reserved.
//

#import "NSURL+Utilities.h"

@implementation NSURL (Utilities)

- (NSString *)coinbaseCode {
    return [self.absoluteString componentsSeparatedByString:@"="].lastObject;
}

@end
