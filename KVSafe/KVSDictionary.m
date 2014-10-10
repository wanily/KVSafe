//
//  KVSDictionary.m
//  KVSafe
//
//  Created by 崔 明辉 on 14/10/10.
//  Copyright (c) 2014年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "KVSDictionary.h"
#import "KVSArray.h"
#import "KVSTypeTranfer.h"

@interface KVSDictionary () {
    NSDictionary *_dictionary;
}

- (instancetype)initWithDictionary:(NSDictionary *)otherDictionary withPlist:(NSString *)argPlist;

@property (nonatomic, strong) NSDictionary *plistScheme;

@end

@implementation KVSDictionary

- (instancetype)initWithDictionary:(NSDictionary *)otherDictionary withPlist:(NSString *)argPlist {
    self = [super initWithDictionary:otherDictionary];
    if (self) {
        [self plistSchemeInitailizer:argPlist];
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)otherDictionary withScheme:(NSDictionary *)argScheme {
    self = [super initWithDictionary:otherDictionary];
    if (self) {
        self.plistScheme = argScheme;
    }
    return self;
}

- (void)plistSchemeInitailizer:(NSString *)argPlistFileName {    
#ifdef TEST
    NSString *filePathString = [[NSBundle bundleForClass: [self class]] pathForResource:argPlistFileName ofType:@"plist"];
#else
    NSString *filePathString = [[NSBundle mainBundle] pathForResource:argPlistFileName ofType:@"plist"];
#endif
    NSAssert([[NSFileManager defaultManager] fileExistsAtPath:filePathString], @"Plist File Not Exist!");
    self.plistScheme = [NSDictionary dictionaryWithContentsOfFile:filePathString];
}

- (instancetype)initWithObjects:(const id [])objects forKeys:(const id<NSCopying> [])keys count:(NSUInteger)cnt {
    _dictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys count:cnt];
    return self;
}

- (NSUInteger)count {
    return [_dictionary count];
}

- (id)objectForKey:(id)aKey {
    id object = [_dictionary objectForKey:aKey];
    NSAssert(self.plistScheme[aKey] != nil, @"Key has not defined in Plist file yet!");
    if (self.plistScheme[aKey] == nil) {
        return object;
    }
    if (object == nil && [self.plistScheme[aKey] isKindOfClass:[NSArray class]]) {
        return nil;
    }
    else if ([object isKindOfClass:[NSDictionary class]] &&
        [self.plistScheme[aKey] isKindOfClass:[NSDictionary class]]) {
        return [object formatWithScheme:self.plistScheme[aKey]];
    }
    else if ([object isKindOfClass:[NSArray class]] &&
             [self.plistScheme[aKey] isKindOfClass:[NSArray class]]){
        return [object formatWithScheme:self.plistScheme[aKey]];
    }
    else if (![self compareKindsOfObject:object objectB:self.plistScheme[aKey]]) {
        if ([object isKindOfClass:[NSNumber class]] &&
            [self.plistScheme[aKey] isKindOfClass:[NSString class]]) {
            //Transfer NSNumber To NSString
            return [KVSTypeTranfer toString:object];
        }
        else if ([object isKindOfClass:[NSString class]] &&
            [self.plistScheme[aKey] isKindOfClass:[NSNumber class]]) {
            //Transfer NSString To NSNumber
            return [KVSTypeTranfer toNumber:object];
        }
        return self.plistScheme[aKey];
    }
    else {
        return object;
    }
}

- (BOOL)compareKindsOfObject:(id)argA objectB:(id)argB {
    if ([argA isKindOfClass:[NSString class]]) {
        return [argB isKindOfClass:[NSString class]];
    }
    else if ([argA isKindOfClass:[NSNumber class]]) {
        return [argB isKindOfClass:[NSNumber class]];
    }
    else if ([argA isKindOfClass:[NSDate class]]) {
        return [argB isKindOfClass:[NSDate class]];
    }
    else if ([argA isKindOfClass:[NSData class]]) {
        return [argB isKindOfClass:[NSData class]];
    }
    else {
        return [argA isKindOfClass:argB];
    }
}

- (NSEnumerator *)keyEnumerator {
    return [_dictionary keyEnumerator];
}

@end

@implementation NSDictionary (KVSafe)

- (KVSDictionary *)formatWithPlist:(NSString *)argPlist {
    KVSDictionary *newDictionary = [[KVSDictionary alloc] initWithDictionary:self withPlist:argPlist];
    return newDictionary;
}

- (KVSDictionary *)formatWithScheme:(NSDictionary *)argScheme {
    KVSDictionary *newDictionary = [[KVSDictionary alloc] initWithDictionary:self withScheme:argScheme];
    return newDictionary;
}

@end
