#import "OSBComponentsAssembly.h"
#import "OSBNetworkManger.h"
#import "OSBTheme.h"
#import "OSBBasicTheme.h"


@implementation OSBComponentsAssembly {

}
- (OSBNetworkManger *)networkManager {
    return [TyphoonDefinition withClass:[OSBNetworkManger class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(serverUrl) with:[NSURL URLWithString:@"http://example.com/api/items"]];
        definition.scope = TyphoonScopeSingleton;
    }];
}

- (id <OSBTheme>)theme {
    return [TyphoonDefinition withClass:[OSBBasicTheme class] configuration:^(TyphoonDefinition *definition) {
        definition.scope = TyphoonScopeSingleton;
    }];
}

@end