#import <Foundation/Foundation.h>
#import "MTLJSONAdapter.h"
#import "MTLModel.h"
#import "OSBArticle.h"
#import "OSBMantleAuthor.h"

@interface OSBMantleArticle : MTLModel <MTLJSONSerializing, OSBArticle>

@property (nonatomic, copy) NSDate *date;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSNumber *rating;
@property (nonatomic, strong) NSArray *comments;
@property (nonatomic, strong) OSBMantleAuthor *author;
@property (nonatomic, assign) OSBArticleStatus status;

@end