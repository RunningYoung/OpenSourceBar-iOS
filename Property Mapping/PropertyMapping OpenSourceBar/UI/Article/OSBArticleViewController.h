#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol OSBArticle;


@interface OSBArticleViewController : UIViewController

- (instancetype)initWithArticle:(id<OSBArticle>)article title:(NSString *)title;

@end