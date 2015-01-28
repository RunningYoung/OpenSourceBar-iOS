#import <Foundation/Foundation.h>

@protocol OSBAuthor;

typedef NS_ENUM(NSUInteger, OSBArticleStatus) {
    OSBArticleNormal,
    OSBArticleNew
};

@protocol OSBArticle

@property (nonatomic, copy) NSDate *date;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSNumber *rating;
@property (nonatomic, strong) NSArray *comments;
@property (nonatomic, strong) id<OSBAuthor> author;
@property (nonatomic, assign) OSBArticleStatus status;

@end