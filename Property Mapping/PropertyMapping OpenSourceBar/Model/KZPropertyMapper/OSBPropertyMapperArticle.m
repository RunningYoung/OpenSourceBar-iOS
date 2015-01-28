#import "OSBPropertyMapperArticle.h"
#import "KZPropertyMapper.h"


@implementation OSBPropertyMapperArticle {

}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        [KZPropertyMapper mapValuesFrom:dictionary toInstance:self usingMapping:@{
                @"timestamp" : KZCall(dateFromNumber:, date),
                @"article_text" : KZProperty(text),
                @"rating" : KZProperty(rating),
                @"author" : KZCall(authorFromDictionary:, author),
                @"status" : KZCall(statusFromString:, status),
                @"comments" : KZProperty(comments)
        }];
    }
    return self;
}

- (id)authorFromDictionary:(NSDictionary *)dictionary{
    return [[OSBPropertyMapperAuthor alloc] initWithDictionary:dictionary];
}

- (id)dateFromNumber:(NSNumber *)timestamp {
    return [NSDate dateWithTimeIntervalSince1970:timestamp.doubleValue];
}

- (id)statusFromString:(NSString *)status {
    if ([status isEqualToString:@"new"]) {
        return @(OSBArticleNew);
    }
    else {
        return @(OSBArticleNormal);
    }
}

@end