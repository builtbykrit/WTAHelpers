//
//  NSMutableDictionary+WTAFunctionalHelpers.m
//  WTAHelpers
//
//  Created by MattBaranowski on 7/9/15.
//  Copyright (c) 2015 WillowTree Apps, Inc. All rights reserved.
//

#import "NSMutableDictionary+WTAFunctionalHelpers.h"

@implementation NSMutableDictionary (WTAFunctionalHelpers)

-(BOOL)wta_safeSetValue:(id)value forKeyPath:(NSString*)keyPath
{
    NSUInteger dot = [keyPath rangeOfString:@"."].location;
    if (dot==NSNotFound) {
        [self setValue:value forKey:keyPath];
        return YES;
    }
    
    NSString* key = [keyPath substringToIndex:dot];
    id dict = self[key];
    
    if (dict==nil) {
        dict = [NSMutableDictionary dictionary];
    } else if ([dict isKindOfClass:[NSDictionary class]]) {
        dict = [dict mutableCopy];
    } else if ([dict isKindOfClass:[NSMutableDictionary class]]) {
        return NO;
    }
    
    NSString* nextKeyPath = [keyPath substringFromIndex:dot+1];
    if (![dict wta_safeSetValue:value forKeyPath:nextKeyPath]) {
        return NO;
    }
    
    [self setValue:dict forKeyPath:key];
    return YES;
}


@end
