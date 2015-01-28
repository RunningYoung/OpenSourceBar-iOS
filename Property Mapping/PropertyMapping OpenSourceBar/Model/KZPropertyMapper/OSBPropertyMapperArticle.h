#import <Foundation/Foundation.h>
#import "OSBArticle.h"
#import "OSBPropertyMapperAuthor.h"


@interface OSBPropertyMapperArticle : NSObject <OSBArticle>

@property (nonatomic, copy) NSDate *date;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSNumber *rating;
@property (nonatomic, strong) NSArray *comments;
@property (nonatomic, strong) OSBPropertyMapperAuthor *author;
@property (nonatomic, assign) OSBArticleStatus status;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end