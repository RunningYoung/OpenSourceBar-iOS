#import "OSBManualArticle.h"
#import "OSBManualAuthor.h"
#import "MTLModel.h"


@implementation OSBManualArticle {

}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _date = [NSDate dateWithTimeIntervalSince1970:((NSNumber *)dictionary[@"timestamp"]).doubleValue];
        _text = dictionary[@"article_text"];
        _rating = dictionary[@"rating"];
        _author = [[OSBManualAuthor alloc] initWithDictionary:dictionary[@"author"]];

        if (dictionary[@"comments"] && [dictionary[@"comments"] isKindOfClass:[NSArray class]]) {
            _comments = [dictionary[@"comments"] copy];
        }

        if (dictionary[@"status"] && [dictionary[@"status"] isKindOfClass:[NSString class]]) {
            NSString *status = dictionary[@"status"];
            if ([status isEqualToString:@"new"]) {
                _status = OSBArticleNew;
            }
            else if ([status isEqualToString:@"normal"]) {
                _status = OSBArticleNormal;
            }
        }
    }
    return self;
}

@end