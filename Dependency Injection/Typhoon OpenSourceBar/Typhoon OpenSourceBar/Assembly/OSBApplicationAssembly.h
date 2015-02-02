#import <Foundation/Foundation.h>
#import "TyphoonAssembly.h"

@class OSBAppDelegate;
@class OSBRootViewController;
@class OSBNetworkManger;
@class OSBComponentsAssembly;


@interface OSBApplicationAssembly : TyphoonAssembly

@property(nonatomic, strong, readonly) OSBComponentsAssembly *coreComponents;

- (OSBAppDelegate *)appDelegate;
- (OSBRootViewController *)rootViewController;

@end