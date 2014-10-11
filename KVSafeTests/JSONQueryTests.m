//
//  JSONQueryTests.m
//  KVSafe
//
//  Created by 崔 明辉 on 14/10/10.
//  Copyright (c) 2014年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "KVSafe.h"

@interface JSONQueryTests : XCTestCase

@end

@implementation JSONQueryTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    NSDictionary *testObject = @{@"name": @"PonyCui"};
    testObject = [testObject formatWithPlist:@"Hello"];
    XCTAssert([testObject[@"name"] isEqualToString:@"PonyCui"], @"Pass");
}

- (void)testNull {
    NSDictionary *testObject = @{@"name": [NSNull null]};
    testObject = [testObject formatWithPlist:@"Hello"];
    XCTAssert([testObject[@"name"] isKindOfClass:[NSString class]], @"Pass");
    XCTAssert([testObject[@"name"] isEqualToString:@"DefaultValue"], @"Pass");
}

- (void)testErrorType {
    NSDictionary *testObject = @{@"name": @46709394};
    testObject = [testObject formatWithPlist:@"Hello"];
    XCTAssert([testObject[@"name"] isKindOfClass:[NSString class]], @"Pass");
    XCTAssert([testObject[@"name"] isEqualToString:@"46709394"], @"Pass");
}

- (void)testFloatString {
    NSDictionary *testObject = @{@"name": @666.66};
    testObject = [testObject formatWithPlist:@"Hello"];
    XCTAssert([testObject[@"name"] isKindOfClass:[NSString class]], @"Pass");
    XCTAssert([testObject[@"name"] isEqualToString:@"666.66"], @"Pass");
}

- (void)testAge {
    NSDictionary *testObject = @{@"age": @25};
    testObject = [testObject formatWithPlist:@"Hello"];
    XCTAssert([testObject[@"age"] isKindOfClass:[NSNumber class]], @"Pass");
    XCTAssert([testObject[@"age"] isEqualToNumber:@25], @"Pass");
}

- (void)testStringAge {
    NSDictionary *testObject = @{@"age": @"25"};
    testObject = [testObject formatWithPlist:@"Hello"];
    XCTAssert([testObject[@"age"] isKindOfClass:[NSNumber class]], @"Pass");
    XCTAssert([testObject[@"age"] isEqualToNumber:@25], @"Pass");
}

- (void)testDecimalAge {
    NSDictionary *testObject = @{@"age": @"25.5"};
    testObject = [testObject formatWithPlist:@"Hello"];
    XCTAssert([testObject[@"age"] isKindOfClass:[NSNumber class]], @"Pass");
    XCTAssert([testObject[@"age"] isEqualToNumber:@25.5], @"Pass");
}

#pragma mark - Child Dictionary

- (void)testSon {
    NSDictionary *testObject = @{@"name": @"Pony", @"age": @25, @"son": @{@"name": @"Bobby", @"age": @"1.5"}};
    testObject = [testObject formatWithPlist:@"Hello"];
    XCTAssert([testObject[@"son"][@"age"] isKindOfClass:[NSNumber class]], @"Pass");
    XCTAssert([testObject[@"son"][@"age"] isEqualToNumber:@1.5], @"Pass");
}

- (void)testJSONNotExistedKey {
    NSDictionary *testObject = @{@"name": @"Pony", @"son": @{@"name": @"Bobby", @"age": @"1.5"}};
    testObject = [testObject formatWithPlist:@"Hello"];
    XCTAssert([testObject[@"age"] isEqualToNumber:@0], @"Pass");
}

#pragma mark - Array

- (void)testArray {
    NSDictionary *testObject = @{@"name": @"Pony",
                                 @"age": @"25",
                                 @"children": @[
                                         @{@"name": @"Tom", @"age":@"8"},
                                         @{@"name": @1111, @"age":@5},
                                         @{@"name": [NSNull null], @"age": [NSNull null]}
                                         ]};
    testObject = [testObject formatWithPlist:@"Hello"];
    XCTAssert([testObject[@"children"][0][@"age"] isKindOfClass:[NSNumber class]], @"Pass");
    XCTAssert([testObject[@"children"][0][@"age"] isEqualToNumber:@8], @"Pass");
    XCTAssert([testObject[@"children"][1][@"name"] isKindOfClass:[NSString class]], @"Pass");
    XCTAssert([testObject[@"children"][1][@"name"] isEqualToString:@"1111"], @"Pass");
    XCTAssert([testObject[@"children"][2][@"name"] isKindOfClass:[NSString class]], @"Pass");
    XCTAssert([testObject[@"children"][2][@"age"] isKindOfClass:[NSNumber class]], @"Pass");
    XCTAssert(testObject[@"children"][3][@"name"] == nil, @"Pass");//never crash if array is out of bounds
}

- (void)testErrorTypeArray {
    NSDictionary *testObject = @{@"name": @"Pony",
                                 @"age": @"25",
                                 @"children": @[
                                         @{@"name": @"Tom", @"age":@"8"},
                                         @{@"name": @1111, @"age":@5},
                                         @{@"name": [NSNull null], @"age": [NSNull null]}
                                         ]};
    testObject = [testObject formatWithPlist:@"Hello"];
}

- (void)testForgot {
    NSDictionary *testObject = @{@"name": @"Pony",
                                 @"age": @"25",
                                 @"children": @{},
                                 @"forgot": @"this"};
    testObject = [testObject formatWithPlist:@"Hello"];
    XCTAssert([testObject[@"children"] isKindOfClass:[NSArray class]], @"Pass");
}

//- (void)testShouldNeverPass {
//    NSDictionary *testObject = @{@"notExistedKey": @""};
//    testObject = [testObject formatWithPlist:@"Hello"];
//    XCTAssert(testObject[@"notExistedKey"], @"Fail");
//}

@end
