#import <Foundation/Foundation.h>


@interface OSBNetworkManger : NSObject

@property (nonatomic, copy) NSURL *serverUrl;

- (NSArray *)getItems;

@end