#import <Foundation/Foundation.h>
#import "OSBArticle.h"
#import "OSBKeyValueObjectMappingAuthor.h"


@interface OSBKeyValueObjectMappingArticle : NSObject <OSBArticle>

@property (nonatomic, copy) NSDate *date;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSNumber *rating;
@property (nonatomic, strong) NSArray *comments;
@property (nonatomic, strong) OSBKeyValueObjectMappingAuthor *author;
@property (nonatomic, assign) OSBArticleStatus status;

+ (OSBKeyValueObjectMappingArticle *)articleFromDictionary:(NSDictionary *)dictionary;

@end