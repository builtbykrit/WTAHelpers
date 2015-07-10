//
//  NSDictionary_WTAFunctionalHelpersTests.m
//  WTAHelpers
//
//  Created by MattBaranowski on 7/9/15.
//  Copyright (c) 2015 WillowTree Apps, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NSDictionary+WTAFunctionalHelpers.h"

@interface NSDictionary_WTAFunctionalHelpersTests : XCTestCase

@end

@implementation NSDictionary_WTAFunctionalHelpersTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testValuesForKeys
{
    //-(NSArray*)wta_valuesForKeys:(NSArray*)keys;
    {
    NSArray* emptyDictResult = [@{} wta_valuesForKeys:@[@"key1",@"key2"]];
        XCTAssert(emptyDictResult != nil);
    XCTAssert(emptyDictResult.count == 0);
    }
    
    NSDictionary* numbersDict = @{@"one":@1, @"two":@2};
    
    {
        NSArray* res = [numbersDict wta_valuesForKeys:nil];
        XCTAssert(res != nil);
        XCTAssert(res.count == 0);
    }
    
    {
        NSArray* res = [numbersDict wta_valuesForKeys:@[]];
        XCTAssert(res != nil);
        XCTAssert(res.count == 0);
    }
    
    
    {
        NSArray* res = [numbersDict wta_valuesForKeys:@[@"one",@"three"]];
        XCTAssert(res != nil);
        XCTAssert(res.count == 1);
        XCTAssert([res[0] isEqualToNumber:@1]);
    }
}

-(void)testDictionaryByMerging
{
    //+(NSDictionary*)wta_dictionaryByMerging:(NSDictionary*)a with:(NSDictionary*)b;
    {
        NSDictionary* res = [NSDictionary wta_dictionaryByMerging:@{} with:@{}];
        XCTAssert(res != nil);
        XCTAssert(res.count == 0);
    }

    {
        NSDictionary* res = [NSDictionary wta_dictionaryByMerging:@{} with:@{@"A":@1}];
        XCTAssert(res != nil);
        XCTAssert([res isEqualToDictionary:@{@"A":@1}]);
    }
    
    {
        NSDictionary* res = [NSDictionary wta_dictionaryByMerging:@{@"B":@2} with:@{@"A":@1}];
        XCTAssert(res != nil);
        NSDictionary* d = @{@"A":@1, @"B":@2};
        XCTAssert([res isEqualToDictionary:d ]);
    }
    
    {
        NSDictionary* res = [NSDictionary wta_dictionaryByMerging:@{@"A":@2} with:@{@"A":@1}];
        XCTAssert(res != nil);
        NSDictionary* d = @{@"A":@2};
        XCTAssert([res isEqualToDictionary:d ]);
    }
    
    {
        NSDictionary* d1 = @{@"A":@2, @"B":@{ @"C":@3 }};
        NSDictionary* d2 = @{@"A":@1, @"B":@{ @"D":@3 }};
        NSDictionary* res = [NSDictionary wta_dictionaryByMerging:d1
                                                             with:d2];
        XCTAssert(res != nil);
        NSDictionary* d = @{@"A":@2, @"B":@{ @"D":@3, @"C":@3 }};
        XCTAssert([res isEqualToDictionary:d ]);
    }
}


@end
