//
//  NSArray+FunctionalHelpers.h
//
//  Created by Matthew Baranowski on 7/24/14.
//  Copyright (c) 2014 Willowtree Apps. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSArray (FunctionalHelpers)

-(NSArray*)wta_mapWithBlock:(id (^)(id))block;

-(void)wta_enumerateWithBlock:(id (^)(id))block;

-(NSArray*)wta_reduceWithBlock:(id (^)(id memo, id element))block
                    startValue:(id)memo;

-(NSArray*)wta_reduceRightWithBlock:(id (^)(id memo, id element))block
                         startValue:(id)memo;

-(NSArray*)wta_pluckAtKeyPath:(NSString*)keyPath;

-(NSArray*)wta_makeUnique;

-(NSArray*)wta_shuffle;

-(NSArray*)wta_flatten;

-(id)wta_findWithTest:(BOOL (^)(id))test;

-(id)wta_findWithMaximumValue:(NSInteger (^)(id))test;

-(NSArray*)wta_filterWithTest:(BOOL (^)(id))test;

-(NSArray*)wta_rejectWithTest:(BOOL (^)(id))test;

-(BOOL)wta_allPassTest:(BOOL (^)(id))test;

-(BOOL)wta_anyPassTest:(BOOL (^)(id))test;

-(NSDictionary*)wta_groupByKeyFromElement:(id (^)(id))keyFromElement;

-(NSDictionary*)wta_groupByKeyPath:(NSString*)keyPath;

- (NSArray*)wta_arrayByInsertingObject:(id)object atIndex:(NSInteger)index;

@end
