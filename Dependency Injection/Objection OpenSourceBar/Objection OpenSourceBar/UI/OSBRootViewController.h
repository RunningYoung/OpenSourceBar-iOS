#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol OSBTheme;
@class OSBNetworkManger;

@interface OSBRootViewController : UITableViewController

@property (nonatomic, strong) OSBNetworkManger *networkManger;

- (instancetype)initWithTheme:(id<OSBTheme>)theme;
@end