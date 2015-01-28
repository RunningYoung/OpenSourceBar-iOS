#import "OSBKeyValueObjectMappingArticle.h"
#import "OSBKeyValueObjectMappingAuthor.h"
#import "DCParserConfiguration.h"
#import "DCKeyValueObjectMapping.h"
#import "DCObjectMapping.h"
#import "DCArrayMapping.h"
#import "DCCustomParser.h"
#import "DCCustomInitialize.h"
#import "OSBKeyValueObjectMappingStatusConverter.h"


@implementation OSBKeyValueObjectMappingArticle {

}

+ (OSBKeyValueObjectMappingArticle *)articleFromDictionary:(NSDictionary *)dictionary {
    DCParserConfiguration *config = [DCParserConfiguration configuration];

    [config addObjectMapping:[DCObjectMapping mapKeyPath:@"timestamp"
                                             toAttribute:@"date"
                                                 onClass:[OSBKeyValueObjectMappingArticle class]]];
    [config addObjectMapping:[DCObjectMapping mapKeyPath:@"article_text"
                                             toAttribute:@"text"
                                                 onClass:[OSBKeyValueObjectMappingArticle class]]];
    [config addArrayMapper:[DCArrayMapping mapperForClassElements:[NSString class]
                                                     forAttribute:@"comments"
                                                          onClass:[OSBKeyValueObjectMappingArticle class]]];

    [config addObjectMapping:[DCObjectMapping mapKeyPath:@"status"
                                             toAttribute:@"status"
                                                 onClass:[OSBKeyValueObjectMappingArticle class]
                                               converter:[OSBKeyValueObjectMappingStatusConverter new]]];

    DCKeyValueObjectMapping *parser = [DCKeyValueObjectMapping mapperForClass:[OSBKeyValueObjectMappingArticle class] andConfiguration:config];
    return [parser parseDictionary:dictionary];
}

@end