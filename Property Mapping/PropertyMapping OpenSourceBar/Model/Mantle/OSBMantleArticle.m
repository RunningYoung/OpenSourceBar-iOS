#import "OSBMantleArticle.h"
#import "OSBAuthor.h"
#import "NSValueTransformer+MTLPredefinedTransformerAdditions.h"
#import "OSBMantleAuthor.h"
#import "MTLValueTransformer.h"


@implementation OSBMantleArticle {

}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
            @"text" : @"article_text",
            @"date" : @"timestamp",
    };
}

+ (NSValueTransformer *)authorJSONTransformer {
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:OSBMantleAuthor.class];
}

+ (NSValueTransformer *)dateJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSNumber *timestamp) {
        return [NSDate dateWithTimeIntervalSince1970:timestamp.doubleValue];
    } reverseBlock:^(NSDate *date) {
        return @([date timeIntervalSince1970]);
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer mtl_valueMappingTransformerWithDictionary:@{
        @"normal": @(OSBArticleNormal),
        @"new": @(OSBArticleNew)
    }];
}

@end