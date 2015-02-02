#import "OSBApplicationAssembly.h"
#import "OSBAppDelegate.h"
#import "OSBRootViewController.h"
#import "OSBBasicTheme.h"
#import "OSBNetworkManger.h"
#import "OSBComponentsAssembly.h"


@implementation OSBApplicationAssembly {

}

- (OSBAppDelegate *)appDelegate {
    return [TyphoonDefinition withClass:[OSBAppDelegate class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(window) with:[self mainWindow]];
    }];
}

- (UIWindow *)mainWindow {
    return [TyphoonDefinition withClass:[UIWindow class] configuration:^(TyphoonDefinition *definition){
        [definition useInitializer:@selector(initWithFrame:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:[NSValue valueWithCGRect:[[UIScreen mainScreen] bounds]]];
        }];
        [definition injectProperty:@selector(rootViewController) with:[self rootViewController]];
    }];
}

- (OSBRootViewController *)rootViewController {
    return [TyphoonDefinition withClass:[OSBRootViewController class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithTheme:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:[_coreComponents theme]];
        }];
        [definition injectProperty:@selector(networkManger) with:[_coreComponents networkManager]];
        definition.scope = TyphoonScopeSingleton;
    }];
}

@end