//  FISAppDelegate.h

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

-(void)printInFrame:(NSArray *)words;

-(NSString *)toPigLatin:(NSString *)text;

-(NSString *)fromPigLatin:(NSString *)text;

@end
