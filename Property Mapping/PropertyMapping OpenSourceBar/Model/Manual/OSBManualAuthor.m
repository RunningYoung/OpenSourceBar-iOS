#import "OSBManualAuthor.h"
#import "MTLModel.h"


@implementation OSBManualAuthor {

}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _name = dictionary[@"name"];
        _email = dictionary[@"email"];
    }
    return self;
}

@end