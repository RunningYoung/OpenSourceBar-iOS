#import <Objection/Objection.h>
#import "OSBNetworkManger.h"


@implementation OSBNetworkManger {

}

- (NSArray *)getItems {
    NSLog(@"Get items from URL: %@", _serverUrl.absoluteString);

    return @[
            @"Item 1",
            @"Item 2",
            @"Item 3",
            @"Item 4",
    ];
}

@end