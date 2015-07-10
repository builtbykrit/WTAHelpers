//
//  WTAHelpersTests.m
//  WTAHelpersTests
//
//  Created by MattBaranowski on 7/9/15.
//  Copyright (c) 2015 WillowTree Apps, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NSArray+WTAFunctionalHelpers.h"

@interface NSArray_WTAFunctionalHelpersTests : XCTestCase

@end

@implementation NSArray_WTAFunctionalHelpersTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testMapWithBlock
{
    NSArray* array = @[ @1, @2, @3, @4, @0 ];
    NSArray* result = [array wta_mapWithBlock:^id(id x) {
        return [x stringValue];
    }];
    
    XCTAssert( [[result componentsJoinedByString:@""] isEqualToString:@"12340"] );
    
    [@[] wta_mapWithBlock:^id(id x) {
        XCTAssert(NO);
        return x;
    }];
}

- (void)testReduceWithBlock
{
    NSArray* array = @[ @1, @2, @3, @4, @5 ];
    
    NSNumber* sum = [array wta_reduceWithBlock:^id(id memo, id element) {
        return @( [memo integerValue] + [element integerValue]);
    } startValue:@0];
    XCTAssertEqualObjects(sum, @15);
    
    NSNumber* max = [array wta_reduceWithBlock:^id(id memo, id element) {
        return @( MAX( [memo integerValue], [element integerValue]) ) ;
    } startValue:@0];
    XCTAssertEqualObjects(max, @5);
    
    NSNumber* result =
    [@[] wta_reduceWithBlock:^id(id memo, id element) {
        XCTAssert(NO);
        return nil;
    } startValue:@0];
    XCTAssertEqualObjects(result, @0);
}


@end
