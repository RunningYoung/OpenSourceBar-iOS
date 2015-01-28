#import <Foundation/Foundation.h>
#import <Mantle/MTLModel.h>
#import <Mantle/MTLJSONAdapter.h>
#import "OSBAuthor.h"

@interface OSBMantleAuthor : MTLModel <MTLJSONSerializing, OSBAuthor>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *email;

@end