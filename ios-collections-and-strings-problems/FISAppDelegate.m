//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSArray *wordsArray = @[@"Hello", @"World", @"in", @"a", @"beautiful", @"frame"];
    [self printInFrame:wordsArray];
    
    NSString *someText = @"I am an idiot";
    NSLog(@"%@", [self toPigLatin:someText]);
    
    
    return YES;
}


-(NSString *)toPigLatin:(NSString *)text {
    NSString *textInPigLatin = @"";
    NSArray *words = [text componentsSeparatedByString:@" "];
    
    for (NSString *word in words) {
        BOOL capitalized = ([word characterAtIndex:0] == [[word uppercaseString] characterAtIndex:0]);
        [word lowercaseString];
        NSString *wordInPigLatin = [word substringFromIndex:1];
        wordInPigLatin = [wordInPigLatin stringByAppendingFormat:@"%@ay", [word substringWithRange:NSMakeRange(0, 1)]];
        if (capitalized) {
            [wordInPigLatin capitalizedString];
        }
        textInPigLatin = [textInPigLatin stringByAppendingFormat:@"%@ ", wordInPigLatin];
    }
    textInPigLatin = [textInPigLatin substringToIndex:[textInPigLatin length] - 1];
    
    return textInPigLatin;
}

-(NSString *)fromPigLatin:(NSString *)text {
    return nil;
}








-(void)printInFrame:(NSArray *)words {
    NSUInteger longestWordLength = 0;
    NSString *picture = @"\n";
    
    for (NSString *word in words) {
        longestWordLength = word.length > longestWordLength ? word.length : longestWordLength;
    }
    
    for (NSUInteger i = 0; i < longestWordLength + 4; i++) {
        picture = [picture stringByAppendingString:@"*"];
    }
    
    for (NSString *word in words) {
        NSString *currentLineString = @"\n* ";
        NSUInteger currentWordLength = word.length;
        currentLineString = [currentLineString stringByAppendingFormat:@"%@", word];
        for (NSUInteger i = 0; i < longestWordLength - currentWordLength; i++) {
            currentLineString = [currentLineString stringByAppendingString:@" "];
        }
        picture = [picture stringByAppendingFormat:@"%@ *", currentLineString];
    }
    
    picture = [picture stringByAppendingString:@"\n"];
    
    for (NSUInteger i = 0; i < longestWordLength + 4; i++) {
        picture = [picture stringByAppendingString:@"*"];
    }

    NSLog(@"%@", picture);
    
}

@end
