#import <Foundation/Foundation.h>
#import "OSBAuthor.h"


@interface OSBPropertyMapperAuthor : NSObject <OSBAuthor>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *email;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end