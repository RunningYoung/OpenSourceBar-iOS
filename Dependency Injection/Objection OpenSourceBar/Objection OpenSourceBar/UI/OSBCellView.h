#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol OSBTheme;

@interface OSBCellView : UITableViewCell

@property (nonatomic, strong) UILabel *title;

- (void)applyTheme:(id<OSBTheme>)theme;

@end