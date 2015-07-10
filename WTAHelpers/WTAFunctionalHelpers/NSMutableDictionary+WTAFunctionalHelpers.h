//
//  NSMutableDictionary+WTAFunctionalHelpers.h
//  WTAHelpers
//
//  Created by MattBaranowski on 7/9/15.
//  Copyright (c) 2015 WillowTree Apps, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (WTAFunctionalHelpers)

/**
 Sets the value for the property identified by a given key path to a given value.
 If no existing NSMutableDictionary exists at a give keyPath, a new one will be created.
 
 @param The value for the property identified by keyPath.
 @param A key path of the form relationship.property (with one or more relationships): for example “department.name” or “department.manager.lastName.”
 
 @return NO if it was not possible to set the value for a given keyPath, if for example
 the keyPath is not reachable by creating new NSMutableDictionaries for all the keys. YES if value was successufully set
 */
-(BOOL)wta_safeSetValue:(id)value forKeyPath:(NSString*)keyPath;

@end
