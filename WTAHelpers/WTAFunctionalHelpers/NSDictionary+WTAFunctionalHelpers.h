//
//  NSDictionary+WTAFunctionalHelpers.h
//  WTAHelpers
//
//  Created by MattBaranowski on 7/9/15.
//  Copyright (c) 2015 WillowTree Apps, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (WTAFunctionalHelpers)

/**
 Returns an array of value for each of the given keys. Unlike
 dictionaryWithValuesForKeys: or objectsForKeys:notFoundMarker: if a given key is not
 found, it is simply omitted from the resulting array.
 
 @param keys Array of keys to use to look up values
 
 @return An array of values cooresponding to key, possibly empty or shorter than input array if keys were not found.
 */
-(NSArray*)wta_valuesForKeys:(NSArray*)keys;

/**
 Returns a new dictionary that is the result of merging the values from dictionary a and b.
 If both dictionaries contains a value for a given key, the value from a is chosen.
 
 @param a Dictionary to merge, values will take precedence over second dictionary
 @param b Dictionary to merge with a
 @return a new dictionary with keys for all values in a and b.
 */
+(NSDictionary*)wta_dictionaryByMerging:(NSDictionary*)a with:(NSDictionary*)b;


/**
 Returns a new dictionary that is the result of merging the values from dictionary a and b.
 If both dictionaries contains a value, user provided block is called to resolve the conflict.
 
 @param a Dictionary to merge, values will take precedence over second dictionary
 @param b Dictionary to merge with a
 @param onConflict called when both dictionaries contains a value for a given key. Returns a value that will be used for this key in the resulting dictionary
 @return a new dictionary with keys for all values in a and b.
 */
+(NSDictionary*)wta_dictionaryByMerging:(NSDictionary*)a
                                          with:(NSDictionary*)b
                                    onConflict:(id (^)(id key, id aValue, id bValue))onConflict;
@end
