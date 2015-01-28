#import "OSBPropertyMapperAuthor.h"
#import "KZPropertyMapper.h"


@implementation OSBPropertyMapperAuthor {

}
- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        [KZPropertyMapper mapValuesFrom:dictionary toInstance:self usingMapping:@{
                @"name" : KZProperty(name),
                @"email" : KZProperty(email)
        }];
    }
    return self;
}

@end