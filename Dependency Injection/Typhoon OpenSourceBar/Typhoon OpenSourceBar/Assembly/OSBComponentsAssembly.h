#import <Foundation/Foundation.h>
#import "TyphoonAssembly.h"

@class OSBNetworkManger;
@protocol OSBTheme;


@interface OSBComponentsAssembly : TyphoonAssembly

- (OSBNetworkManger *)networkManager;
- (id<OSBTheme>)theme;

@end