#import "OSBKeyValueObjectMappingStatusConverter.h"
#import "DCDynamicAttribute.h"
#import "OSBArticle.h"


@implementation OSBKeyValueObjectMappingStatusConverter {

}

- (id)transformValue:(id)value forDynamicAttribute:(DCDynamicAttribute *)attribute dictionary:(NSDictionary *)dictionary parentObject:(id)parentObject {
    if ([value isEqualToString:@"new"]) {
        return @(OSBArticleNew);
    }
    else {
        return @(OSBArticleNormal);
    }
}

- (id)serializeValue:(id)value forDynamicAttribute:(DCDynamicAttribute *)attribute {
    return value;
}

- (BOOL)canTransformValueForClass:(Class)class {
    return YES;
}

@end