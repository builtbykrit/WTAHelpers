//
//  NSMutableDictionary_WTAFunctionalHelpersTests.m
//  WTAHelpers
//
//  Created by MattBaranowski on 7/9/15.
//  Copyright (c) 2015 WillowTree Apps, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NSMutableDictionary+WTAFunctionalHelpers.h"

@interface NSMutableDictionary_WTAFunctionalHelpersTests : XCTestCase

@end

@implementation NSMutableDictionary_WTAFunctionalHelpersTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    NSMutableDictionary* d = @{}.mutableCopy;
    
    [d wta_safeSetValue:@"one" forKeyPath:@"A.B.D"];
    [d wta_safeSetValue:@"two" forKeyPath:@"A.B.E"];

    NSDictionary* res = @{@"A": @{@"B":@{ @"D":@"one",@"E":@"two" }}};
    XCTAssert([d isEqualToDictionary:res]);
}


@end
