//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "NSObject.h"

@interface z0y : NSObject
{
    id <m31> _v0j;
    unsigned long long _level;
    struct dispatch_queue_s *_n50;
}

+ (id)t85:(id)arg1 n50:(struct dispatch_queue_s *)arg2 level:(unsigned long long)arg3;
@property(readonly, nonatomic) struct dispatch_queue_s *n50; // @synthesize n50=_n50;
@property(readonly, nonatomic) unsigned long long level; // @synthesize level=_level;
@property(readonly, nonatomic) id <m31> v0j; // @synthesize v0j=_v0j;
- (void).cxx_destruct;
- (void)dealloc;
- (id)initLc7V:(id)arg1 n50:(struct dispatch_queue_s *)arg2 level:(unsigned long long)arg3;

@end

