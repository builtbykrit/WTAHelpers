//
//  NSFetchedResultsController+Helpers.m
//  Example
//
//  Created by Novall Khan on 2/16/14.
//  Copyright (c) 2014 Novall Khan. All rights reserved.
//

#import "NSFetchedResultsController+Helpers.h"
#import <CoreData/CoreData.h>

@implementation NSFetchedResultsController (Helpers)

- (NSInteger)numberOfObjects
{
    return [[self.sections valueForKeyPath:@"@sum.numberOfObjects"] integerValue];
}

- (id)firstObject
{
    id<NSFetchedResultsSectionInfo> obj = [self.sections firstObject];
    return [[obj objects] firstObject];
}

- (id)lastObject
{
    id<NSFetchedResultsSectionInfo> obj = [self.sections lastObject];
    return [[obj objects] lastObject];
}

@end