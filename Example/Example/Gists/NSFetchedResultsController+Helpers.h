//
//  NSFetchedResultsController+Helpers.h
//  Example
//
//  Created by Novall Khan on 2/16/14.
//  Copyright (c) 2014 Novall Khan. All rights reserved.
//

#import <CoreData/CoreData.h>

// Returns number of objects, first object & last object from fetched results.

@interface NSFetchedResultsController (Helpers)

- (NSInteger)numberOfObjects;

- (id)firstObject;

- (id)lastObject;

@end