#import "OSBCellView.h"
#import "OSBTheme.h"


@implementation OSBCellView {

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _title = [UILabel new];
        _title.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_title];

        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(20)-[_title]"
                                                                     options:(NSLayoutFormatOptions)0
                                                                     metrics:nil
                                                                       views:@{@"_title" : _title}]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_title
                                                         attribute:NSLayoutAttributeCenterY
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.contentView
                                                         attribute:NSLayoutAttributeCenterY
                                                        multiplier:1
                                                          constant:0]];
    }
    return self;
}

- (void)applyTheme:(id <OSBTheme>)theme {
    self.backgroundColor = [theme backgroundColor];
    _title.font = [theme font];
    _title.textColor = [theme textColor];
}


@end