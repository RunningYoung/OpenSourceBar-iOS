
#import "AppDelegate.h"
#import "OSBRootViewController.h"
#import "OSBBasicTheme.h"
#import "OSBNetworkManger.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

    OSBRootViewController *rootViewController = [[OSBRootViewController alloc] initWithTheme:[OSBBasicTheme new]];
    rootViewController.networkManger = [OSBNetworkManger new];
    self.window.rootViewController = rootViewController;
    [self.window makeKeyAndVisible];

    return YES;
}



@end
