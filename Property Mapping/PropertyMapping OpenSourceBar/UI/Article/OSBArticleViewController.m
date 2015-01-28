#import "OSBArticleViewController.h"
#import "OSBArticle.h"
#import "OSBArticleView.h"
#import "OSBAuthor.h"


@implementation OSBArticleViewController {
    id<OSBArticle> _article;
}

- (instancetype)initWithArticle:(id<OSBArticle>)article title:(NSString *)title {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _article = article;
        self.navigationItem.title = title;
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    return self;
}

- (OSBArticleView *)articleView {
    return (OSBArticleView *)self.view;
}

- (void)loadView {
    self.view = [OSBArticleView new];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"dd.MM.YYYY";
    self.articleView.date.text = [NSString stringWithFormat:@"Date: %@", [dateFormatter stringFromDate:_article.date]];
    self.articleView.status.text = [NSString stringWithFormat:@"Status: %@", _article.status == OSBArticleNew ? @"new" : @"normal"];
    self.articleView.author.text = [NSString stringWithFormat:@"Author: %@", _article.author.name];
    self.articleView.email.text = [NSString stringWithFormat:@"Email: %@", _article.author.email];
    self.articleView.text.text = _article.text;
    self.articleView.rating.text = [NSString stringWithFormat:@"Rating: %.2f", [_article.rating floatValue]];

    NSString *comments = @"Comments:";
    for (NSString *comment in _article.comments) {
        comments = [comments stringByAppendingString:[NSString stringWithFormat:@"\n%@", comment]];
    }

    self.articleView.comments.text = comments;
}

@end