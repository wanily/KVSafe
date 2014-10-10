//
//  KVSArray.m
//  KVSafe
//
//  Created by 崔 明辉 on 14/10/10.
//  Copyright (c) 2014年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "KVSArray.h"
#import "KVSDictionary.h"
#import "KVSTypeTranfer.h"

@interface KVSArray (){
    NSArray *_array;
}

@property (nonatomic, strong) NSArray *plistScheme;

@end

@implementation KVSArray

- (instancetype)initWithArray:(NSArray *)array withPlist:(NSString *)argPlist {
    self = [super initWithArray:array];
    if (self) {
        [self plistSchemeInitailizer:argPlist];
    }
    return self;
}

- (instancetype)initWithArray:(NSArray *)array withScheme:(NSArray *)argScheme {
    self = [super initWithArray:array];
    if (self) {
        self.plistScheme = argScheme;
    }
    return self;
}

- (instancetype)initWithObjects:(const id [])objects count:(NSUInteger)cnt {
    _array = [[NSArray alloc] initWithObjects:objects count:cnt];
    return self;
}

- (void)plistSchemeInitailizer:(NSString *)argPlistFileName {
#ifdef TEST
    NSString *filePathString = [[NSBundle bundleForClass: [self class]] pathForResource:argPlistFileName ofType:@"plist"];
#else
    NSString *filePathString = [[NSBundle mainBundle] pathForResource:argPlistFileName ofType:@"plist"];
#endif
    NSAssert([[NSFileManager defaultManager] fileExistsAtPath:filePathString], @"Plist File Not Exist!");
    self.plistScheme = [NSArray arrayWithContentsOfFile:filePathString];
}

- (NSUInteger)count {
    return [_array count];
}

- (id)objectAtIndex:(NSUInteger)index {
    if ([KVSTypeTranfer isValidIndexInArray:self index:index]) {
        id object = [_array objectAtIndex:index];
        NSAssert([self.plistScheme count] > 0, @"Plist Array none of items");
        id plistObject = [self.plistScheme firstObject];
        if ([object isKindOfClass:[NSDictionary class]] &&
            [plistObject isKindOfClass:[NSDictionary class]]) {
            return [object formatWithScheme:plistObject];
        }
        else if ([object isKindOfClass:[NSArray class]] &&
                 [plistObject isKindOfClass:[NSArray class]]) {
            return [object formatWithScheme:plistObject];
        }
        else if (![object isKindOfClass:plistObject]) {
            if ([object isKindOfClass:[NSNumber class]] &&
                [plistObject isKindOfClass:[NSString class]]) {
                //Transfer NSNumber To NSString
                return [KVSTypeTranfer toString:object];
            }
            else if ([object isKindOfClass:[NSString class]] &&
                     [plistObject isKindOfClass:[NSNumber class]]) {
                //Transfer NSString To NSNumber
                return [KVSTypeTranfer toNumber:object];
            }
            return plistObject;
        }
        else {
            return object;
        }
    }
    else {
        return nil;
    }
}

@end

@implementation NSArray (KVSafe)

- (KVSArray *)formatWithPlist:(NSString *)argPlist {
    KVSArray *newArray = [[KVSArray alloc] initWithArray:self withPlist:argPlist];
    return newArray;
}

- (KVSArray *)formatWithScheme:(NSArray *)argScheme {
    KVSArray *newArray = [[KVSArray alloc] initWithArray:self withScheme:argScheme];
    return newArray;
}

@end

