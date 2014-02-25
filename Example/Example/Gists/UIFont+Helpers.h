//
//  UIFont+Helpers.h
//  Pods
//
//  Created by Novall Khan on 2/12/14.
//

#import <UIKit/UIKit.h>

// UIFont extension:
//  - Font caching by name
//  - Font loading from JSON and Plist

@interface UIFont (Helpers)

+ (instancetype)fontNamed:(NSString *)fontName;

+ (void)setFont:(UIFont*)font forName:(NSString*)fontName;
+ (BOOL)setFontsWithContentsOfFile:(NSString *)path;

@end
