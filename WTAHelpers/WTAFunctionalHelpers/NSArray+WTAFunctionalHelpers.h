//
//  NSArray+FunctionalHelpers.h
//
//  Created by Matthew Baranowski on 7/24/14.
//  Copyright (c) 2014 Willowtree Apps. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface NSArray<ObjectType> (WTAFunctionalHelpers)

-(NSMutableArray*)wta_mapWithBlock:(__nullable id (^)(ObjectType))block;

-(id)wta_reduceWithBlock:(id (^)(id memo, ObjectType element))block
                    startValue:(id)memo;

-(id)wta_reduceRightWithBlock:(id (^)(id memo, ObjectType element))block
                         startValue:(id)memo;

-(NSMutableArray*)wta_pluckAtKeyPath:(NSString*)keyPath;

-(NSArray<ObjectType>*)wta_makeUnique;

-(NSMutableArray<ObjectType>*)wta_shuffle;

-(NSArray*)wta_flatten;

-(__nullable id)wta_findWithTest:(BOOL (^)(ObjectType))test;

-(__nullable id)wta_findWithMaximumValue:(NSInteger (^)(ObjectType))test;

-(NSMutableArray<ObjectType>*)wta_filterWithTest:(BOOL (^)(ObjectType))test;

-(NSMutableArray<ObjectType>*)wta_rejectWithTest:(BOOL (^)(ObjectType))test;

-(BOOL)wta_allPassTest:(BOOL (^)(ObjectType))test;

-(BOOL)wta_anyPassTest:(BOOL (^)(ObjectType))test;

-(NSDictionary*)wta_groupByKeyFromElement:(id (^)(ObjectType))keyFromElement;

-(NSDictionary*)wta_groupByKeyPath:(NSString*)keyPath;

- (NSArray<ObjectType>*)wta_arrayByInsertingObject:(ObjectType)object atIndex:(NSInteger)index;

@end
NS_ASSUME_NONNULL_END
