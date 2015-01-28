//
// Created by Maciej Oczko on 28/01/15.
// Copyright (c) 2015 Polidea. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RACSignal.h"

@interface RACSignal (JSONify)
// Take the `next` value from receiver which must be JSON as `NSData`.
// Maps it into Foundation object -> NSArray or NSDictionary.
- (instancetype)jsonify;
@end
