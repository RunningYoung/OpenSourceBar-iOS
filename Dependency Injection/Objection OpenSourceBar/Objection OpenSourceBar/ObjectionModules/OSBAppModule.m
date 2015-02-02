#import "OSBAppModule.h"
#import "JSObjectionInjector.h"
#import "OSBTheme.h"
#import "OSBBasicTheme.h"
#import "OSBNetworkManger.h"
#import "OSBRootViewController.h"
#import "JSObjection.h"

@implementation OSBAppModule {

}

- (void)configure {
    [self bindBlock:^(JSObjectionInjector *context) {
        UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        return window;
    } toClass:[UIWindow class]];

    [self bindBlock:^(JSObjectionInjector *context) {
        return [OSBBasicTheme new];
    } toProtocol:@protocol(OSBTheme)];

    [self bindBlock:^(JSObjectionInjector *context) {
                OSBNetworkManger *networkManger = [OSBNetworkManger new];
                networkManger.serverUrl = [NSURL URLWithString:@"http://example.com/api/items"];
                return networkManger;
            }
            toClass:[OSBNetworkManger class]
            inScope:JSObjectionScopeSingleton];
}

@end