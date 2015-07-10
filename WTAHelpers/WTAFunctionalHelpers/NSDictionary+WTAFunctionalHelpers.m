//
//  NSDictionary+WTAFunctionalHelpers.m
//  WTAHelpers
//
//  Created by MattBaranowski on 7/9/15.
//  Copyright (c) 2015 WillowTree Apps, Inc. All rights reserved.
//

#import "NSDictionary+WTAFunctionalHelpers.h"

@implementation NSDictionary (WTAFunctionalHelpers)

-(NSArray*)wta_valuesForKeys:(NSArray*)keys
{
    NSMutableArray* array = [NSMutableArray array];
    
    for (id key in keys) {
        id value = [self valueForKey:key];
        if (value) {
            [array addObject:value];
        }
    }
    
    return array;
}

+(NSDictionary*)wta_dictionaryByMerging:(NSDictionary*)a with:(NSDictionary*)b
{
    return [self wta_dictionaryByMerging:a with:b onConflict:nil];
}

+(NSDictionary*)wta_dictionaryByMerging:(NSDictionary*)a with:(NSDictionary*)b
                                    onConflict:(id (^)(id key, id aValue, id bValue))onConflict
{
    if ([a count] == 0) {
        return b;
    }
    if ([b count] == 0) {
        return a;
    }
    
    NSMutableDictionary* dict = [b mutableCopy];
    for (id key in [a allKeys]) {
        id aValue = [a valueForKey:key];
        id bValue = [b valueForKey:key];
        id result = aValue;
        
        if ([aValue isKindOfClass:[NSDictionary class]] &&
            [bValue isKindOfClass:[NSDictionary class]])
        {
            result = [NSDictionary wta_dictionaryByMerging:aValue with:bValue];
        }
        
        if (aValue != nil && bValue != nil && onConflict) {
            result = onConflict(key, aValue, bValue);
        }
        
        [dict setValue:result forKey:key];
    }
    
    return dict;
}

@end
