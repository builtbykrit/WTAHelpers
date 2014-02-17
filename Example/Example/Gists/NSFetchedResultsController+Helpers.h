//
//  NSFetchedResultsController+Helpers.h
//  Example
//
//  Created by Novall Khan on 2/16/14.
//  Copyright (c) 2014 Novall Khan. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSFetchedResultsController (Helpers)

- (NSInteger)numberOfObjects;

- (id)firstObject;

- (id)lastObject;

@end