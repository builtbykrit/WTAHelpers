//
//  UIFont+Helpers.m
//  Pods
//
//  Created by Novall Khan on 2/12/14.
//
//

#import "UIFont+Helpers.h"

@implementation UIFont (Helpers)

+ (NSMutableDictionary*)fontNameMap
{
    static NSMutableDictionary* _fontNameMap = nil;
    if(!_fontNameMap)
    {
        _fontNameMap = [NSMutableDictionary new];
    }
    
    return _fontNameMap;
}

+ (instancetype)fontNamed:(NSString*)fontName;
{
    return [[self fontNameMap] objectForKey:fontName];
}

+ (void)setFont:(UIFont*)font forName:(NSString*)fontName
{
    NSParameterAssert(fontName);
    if(font == nil)
    {
        [[self fontNameMap] removeObjectForKey:fontName];
    }
    else
    {
        [[self fontNameMap] setObject:font forKey:fontName];
    }
}

+ (UIFont*)fontWithAttributes:(NSDictionary*)attributes
{
    // Must have name and size
    NSString* fontName = [attributes objectForKey:@"font"];
    NSNumber* fontSize = [attributes objectForKey:@"size"];
    if(!fontName || !fontSize)
        return nil;
    
    UIFont* font = [UIFont fontWithName:fontName size:[fontSize floatValue]];
    
    return font;
}

+ (BOOL)setFontsWithContentsOfFile:(NSString *)path
{
    NSParameterAssert(path);
    NSDictionary* fonts = nil;
    if([[path pathExtension] isEqualToString:@"plist"])
    {
        fonts = [NSDictionary dictionaryWithContentsOfFile:path];
    }
    else if([[path pathExtension] isEqualToString:@"json"])
    {
        NSError* error = nil;
        NSData* data = [NSData dataWithContentsOfFile:path];
        id dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        
        if(!error && [dict isKindOfClass:[NSDictionary class]])
        {
            fonts = dict;
        }
        else
        {
            NSLog(@"Error parsing fonts file: %@", [error localizedDescription]);
        }
    }
    
    if(fonts)
    {
        __block BOOL failed = NO;
        NSMutableDictionary* parsedFonts = [NSMutableDictionary new];
        [fonts enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            if([obj isKindOfClass:[NSDictionary class]])
            {
                UIFont* font = [self fontWithAttributes:obj];
                if(font)
                {
                    [parsedFonts setObject:font forKey:key];
                }
                else
                {
                    NSLog(@"Failed to parse font identified as: %@", key);
                    failed = YES;
                }
            }
            else
            {
                NSLog(@"Failed to parse font identified as: %@. It is not a dictionary.", key);
                failed = YES;
            }
        }];
        
        [[self fontNameMap] setValuesForKeysWithDictionary:parsedFonts];
        
        return failed;
    }
    
    return NO;
}

@end
