//
//  NSArray+FunctionalHelpers.h
//
//  Copyright (c) 2015 WillowTree, Inc.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
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
