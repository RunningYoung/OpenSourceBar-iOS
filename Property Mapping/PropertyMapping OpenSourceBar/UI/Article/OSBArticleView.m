#import "OSBArticleView.h"


@implementation OSBArticleView {

}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];

        _date = [UILabel new];
        _date.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_date];

        _status = [UILabel new];
        _status.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_status];

        _author = [UILabel new];
        _author.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_author];

        _email = [UILabel new];
        _email.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_email];

        _text = [UILabel new];
        _text.numberOfLines = 0;
        _text.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_text];

        _rating = [UILabel new];
        _rating.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_rating];

        _comments = [UILabel new];
        _comments.numberOfLines = 0;
        _comments.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_comments];

        [self createConstraints];
    }
    return self;
}

- (void)createConstraints {
    NSDictionary *views = NSDictionaryOfVariableBindings(_date, _status, _author, _email, _text, _rating, _comments);

    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(20)-[_date]-[_status]-[_author][_email]-[_text]-[_rating]-[_comments]"
                                                                 options:NSLayoutFormatAlignAllLeft | NSLayoutFormatAlignAllRight
                                                                 metrics:nil
                                                                   views:views]];

    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_date]-|"
                                                                     options:(NSLayoutFormatOptions)0
                                                                     metrics:nil
                                                                       views:views]];
}

@end