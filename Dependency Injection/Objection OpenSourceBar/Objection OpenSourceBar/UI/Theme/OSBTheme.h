#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol OSBTheme <NSObject>

- (UIColor *)backgroundColor;
- (UIFont *)font;
- (UIColor *)textColor;

@end