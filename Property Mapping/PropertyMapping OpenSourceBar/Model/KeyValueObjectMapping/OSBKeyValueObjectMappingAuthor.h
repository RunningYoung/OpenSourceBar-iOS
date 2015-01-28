#import <Foundation/Foundation.h>
#import "OSBAuthor.h"


@interface OSBKeyValueObjectMappingAuthor : NSObject <OSBAuthor>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *email;

@end