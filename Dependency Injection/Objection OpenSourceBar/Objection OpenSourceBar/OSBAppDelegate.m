
#import "OSBAppDelegate.h"
#import "OSBRootViewController.h"
#import "JSObjectionInjector.h"
#import "JSObjection.h"
#import "OSBAppModule.h"
#import "Objection.h"
#import "OSBBasicTheme.h"

@interface OSBAppDelegate ()

@end

@implementation OSBAppDelegate

objection_requires_sel(@selector(window))

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    JSObjectionInjector *injector = [JSObjection createInjector:[OSBAppModule new]];
    [JSObjection setDefaultInjector:injector];

    [[JSObjection defaultInjector] injectDependencies:self];

    self.window.rootViewController = [injector getObjectWithArgs:[OSBRootViewController class], [injector getObject:@protocol(OSBTheme)], nil];;
    [self.window makeKeyAndVisible];

    return YES;
}

@end
