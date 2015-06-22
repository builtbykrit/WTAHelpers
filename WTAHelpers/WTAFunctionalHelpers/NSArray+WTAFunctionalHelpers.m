//
//  NSArray+FunctionalHelpers.m
//  GrowmarkRecruiting-iOS
//
//  Created by Matthew Baranowski on 7/24/14.
//  Copyright (c) 2014 Willowtree Apps. All rights reserved.
//

#import "NSArray+FunctionalHelpers.h"

@implementation NSArray (FunctionalHelpers)

-(NSMutableArray*)wta_mapWithBlock:(id (^)(id))block
{
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:self.count];
    for (id obj in self) {
        id mapped = block(obj);
        
        if (mapped) {
            [result addObject:mapped];
        }
    }
    return result;
}

-(void)wta_enumerateWithBlock:(id (^)(id))block
{
    for (id obj in self) {
        block(obj);
    }
}

-(id)wta_reduceWithBlock:(id (^)(id memo, id element))block
                    startValue:(id)memo
{
    for (id obj in self) {
        memo = block(memo, obj);
    }
    
    return memo;
}

-(id)wta_reduceRightWithBlock:(id (^)(id memo, id element))block
                   startValue:(id)memo
{
    for (id obj in self.reverseObjectEnumerator) {
        memo = block(memo, obj);
    }
    
    return memo;
}

-(NSArray*)wta_makeUnique
{
    NSOrderedSet *set = [NSOrderedSet orderedSetWithArray:self];
    return [set array];
}

-(NSMutableArray*)wta_pluckAtKeyPath:(NSString*)keyPath
{
    return [self wta_mapWithBlock:^id(id obj) {
        return [obj valueForKeyPath:keyPath];
    }];
};

-(NSMutableArray*)wta_shuffle
{
    NSMutableArray *result = [self mutableCopy];
    
    for (NSInteger i = result.count - 1; i > 0; i--) {
        [result exchangeObjectAtIndex:arc4random() % (i + 1)
                    withObjectAtIndex:i];
    }
    
    return result;
}

-(NSArray*)wta_flatten
{
    __weak NSArray *array = self;
    __block NSArray *(^flatten)(NSArray *) = ^NSArray *(NSArray *input) {
        NSMutableArray *result = [NSMutableArray array];
        
        for (id obj in input) {
            if ([obj isKindOfClass:[NSArray class]]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-retain-cycles"
                [result addObjectsFromArray:flatten(obj)];
#pragma clang diagnostic pop
            } else {
                [result addObject:obj];
            }
        }
        
        // If the outmost call terminates, nil the reference to flatten to break
        // the retain cycle
        if (input == array) {
            flatten = nil;
        }
        
        return result;
    };
    
    return flatten(self);
}

-(id)wta_findWithTest:(BOOL (^)(id))test
{
    for (id obj in self) {
        if (test(obj)) {
            return obj;
        }
    }
    
    return nil;
}

-(id)wta_findWithMaximumValue:(NSInteger (^)(id))test
{
    NSInteger maxValue = NSIntegerMin;
    id maxObject = nil;
    for (id obj in self) {
        NSInteger value = test(obj);
        if (maxValue < value) {
            maxObject = obj;
            maxValue = value;
        }
    }
    return maxObject;
}
-(NSMutableArray*)wta_filterWithTest:(BOOL (^)(id))test
{
    return [self wta_mapWithBlock:^id(id obj) {
        return test(obj) ? obj : nil;
    }];
}

-(NSMutableArray*)wta_rejectWithTest:(BOOL (^)(id))test
{
    return [self wta_mapWithBlock:^id(id obj) {
        return test(obj) ? nil : obj;
    }];
}

-(BOOL)wta_allPassTest:(BOOL (^)(id))test
{
    if (self.count == 0) {
        return NO;
    }
    
    for (id obj in self) {
        if (!test(obj)) {
            return NO;
        }
    }
    
    return YES;
}

-(BOOL)wta_anyPassTest:(BOOL (^)(id))test
{
    if (self.count == 0) {
        return NO;
    }
    
    for (id obj in self) {
        if (test(obj)) {
            return YES;
        }
    }
    
    return NO;
}

-(NSDictionary*)wta_groupWithBlock:(void (^)(NSMutableDictionary*result, id value, id key))block
                    keyFromElement:(id (^)(id))keyFromElement
{
    NSMutableDictionary* result = [NSMutableDictionary dictionary];
    for (id element in self) {
        block(result, element, keyFromElement(element));
    }
    return result;
}

-(NSDictionary*)wta_groupByKeyFromElement:(id (^)(id))keyFromElement
{
    return [self wta_groupWithBlock:^(NSMutableDictionary *result, id value, id key) {
        if ([result objectForKey:key] == nil) {
            [result setValue:[NSMutableArray array] forKey:key];
        }
        [result[key] addObject:value];
    } keyFromElement:keyFromElement];
}

-(NSDictionary*)wta_indexByKeyFromElement:(id (^)(id))keyFromElement
{
    return [self wta_groupWithBlock:^(NSMutableDictionary *result, id value, id key) {
        result[key] = value;
    } keyFromElement:keyFromElement];
}

-(NSDictionary*)wta_countByKeyFromElement:(id (^)(id))keyFromElement
{
    return [self wta_groupWithBlock:^(NSMutableDictionary *result, id value, id key) {
        if ([result objectForKey:key] == nil) {
            [result setValue:@(0) forKey:key];
        }
        result[key] = @( [result[key] integerValue] + 1 );
    } keyFromElement:keyFromElement];
}

-(NSDictionary*)wta_groupByKeyPath:(NSString*)keyPath
{
    return [self wta_groupByKeyFromElement:^id(id obj) {
        return [obj valueForKeyPath:keyPath];
    }];
}

- (NSArray *)wta_arrayByInsertingObject:(id)object atIndex:(NSInteger)index
{
    NSMutableArray* newArray = [self mutableCopy];
    [newArray insertObject:object
                   atIndex:index];
    
    return [NSArray arrayWithArray:newArray];
}
@end
