#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface OSBArticleView : UIView

@property (nonatomic, strong) UILabel *date;
@property (nonatomic, strong) UILabel *text;
@property (nonatomic, strong) UILabel *author;
@property (nonatomic, strong) UILabel *email;
@property (nonatomic, strong) UILabel *rating;
@property (nonatomic, strong) UILabel *comments;
@property (nonatomic, strong) UILabel *status;

@end