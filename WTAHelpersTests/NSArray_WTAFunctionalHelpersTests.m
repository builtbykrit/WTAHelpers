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

@interface TestAddress : NSObject
@property (nonatomic) NSString* street;
@property (nonatomic) NSString* city;
@property (nonatomic) NSString* postalCode;
@end

@implementation TestAddress
@end

@interface TestClass : NSObject
@property (nonatomic) NSString* name;
@property (nonatomic) NSNumber* age;
@property (nonatomic) TestAddress* address;
@end

@implementation TestClass
@end


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

-(void)testEnumerateWithBlock
{
    {
        // empty array never calls the block
        [@[] wta_enumerateWithBlock:^(id x) {
            XCTAssert(NO);
        }];
    }
    
    {
        __block NSInteger count = 0;
        NSArray* array = @[@1, @2];
        [array wta_enumerateWithBlock:^(id x) {
            XCTAssert([x isEqualToNumber:@1] || [x isEqualToNumber:@2]);
            ++count;
        }];
        
        XCTAssert(count == array.count);
    }
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

-(void)testReduceRightWithBlock
{
    NSArray* array = @[ @1, @2, @3, @4, @5 ];
    NSString* result =
    [array wta_reduceRightWithBlock:^NSString*(NSString* memo, NSString* element) {
        return [memo stringByAppendingString:[element description]];
    } startValue:@""];
    
    XCTAssert([result isEqualToString:@"54321"]);
    
    [@[] wta_reduceRightWithBlock:^id(id memo, id element) {
        XCTAssert(NO);
        return nil;
    } startValue:nil];
}

-(void)testMakeUnique
{
    XCTAssert([[@[] wta_makeUnique] isEqualToArray:@[]]);
    XCTAssert([[@[@1] wta_makeUnique] isEqualToArray:@[@1]]);
    
    {
        NSArray* array = @[@1,@2];
        NSArray* result = @[@1,@2];
        XCTAssert([[array wta_makeUnique] isEqualToArray:result]);
    }
    
    {
        NSArray* array = @[@1,@1,@2,@1,@2];
        NSArray* result = @[@1,@2];
        XCTAssert([[array wta_makeUnique] isEqualToArray:result]);
    }
}

-(void)testPluckAtKeyPath
{
    TestClass* obj = [TestClass new];
    obj.name = @"test";
    obj.age = @42;
    obj.address = [TestAddress new];
    obj.address.city = @"charlottesville";
    obj.address.street = @"main street";
    
    NSArray* a = @[obj, obj, obj];
    NSArray* cities = [a valueForKeyPath:@"address.city"];
    
    NSArray* cities2 = [a wta_pluckAtKeyPath:@"address.city"];
    
    
    XCTAssert([cities isEqualToArray:cities2]);
}

-(void)testShuffle
{
    XCTAssert([[@[] wta_shuffle] isEqualToArray:@[]]);
    
    NSArray* startArray = @[@1,@2,@3,@4];
    
    NSArray* result = [startArray wta_shuffle];
    
    NSArray* sorted = [result sortedArrayUsingComparator:^NSComparisonResult(NSNumber*  __nonnull obj1, NSNumber*  __nonnull obj2) {
        return [obj1 compare:obj2];
    }];
    
    XCTAssert([startArray isEqualToArray:sorted]);
}

-(void)testRandomItem
{
    XCTAssert([@[] wta_randomItem] == nil);
    NSArray* array = @[@1,@2,@3,@4,@5,@6];
    NSSet* set = [NSSet setWithArray:array];
    
    for (NSInteger idx = 0; idx < 10; ++idx) {
        NSNumber* num = [array wta_randomItem];
        XCTAssert(num != nil);
        XCTAssert([set containsObject:num]);
    }
}

-(void)testFlatten
{
    XCTAssert([[@[] wta_flatten] isEqualToArray:@[]]);
    NSArray* array = @[ @1, @[], @[@2, @3], @[ @[ @[ @4 ] ]] ];
    NSArray* result = @[ @1, @2, @3, @4 ];
    XCTAssert([[array wta_flatten] isEqualToArray:result]);
}

-(void)testFindWithTest
{
    // returns nil when searching for elements in an empty array
    // block never gets called for an empty array
    XCTAssert(
    [@[] wta_findWithTest:^BOOL(id x) {
        XCTAssert(NO);
        return YES;
    }] == nil);
    
    
    BOOL (^test)(NSNumber* x) = ^BOOL(NSNumber* x) {
        return [x isEqualToNumber:@3];
    };
    
    NSArray* array = @[@1,@2,@3];
    XCTAssert([[array wta_findWithTest:test] isEqualToNumber:@3]);
    
    NSArray* array2 = @[@1,@2,@4];
    XCTAssert([array2 wta_findWithTest:test] == nil);
}


@end
