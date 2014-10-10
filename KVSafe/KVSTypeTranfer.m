//
//  KVSTypeTranfer.m
//  KVSafe
//
//  Created by 崔 明辉 on 14/10/10.
//  Copyright (c) 2014年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "KVSTypeTranfer.h"

@implementation KVSTypeTranfer

+ (NSString *)toString:(id)argObject {
    if ([argObject isKindOfClass:[NSString class]]) {
        return argObject;
    }
    else {
        if ([argObject isKindOfClass:[NSNumber class]]) {
            return [NSString stringWithFormat:@"%@", argObject];
        }
    }
    return @"";
}

+ (NSNumber *)toNumber:(id)argObject {
    if ([argObject isKindOfClass:[NSNumber class]]) {
        return argObject;
    }
    else {
        if ([argObject isKindOfClass:[NSString class]]) {
            NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
            NSNumber *theNumber = [numberFormatter numberFromString:argObject];
            return theNumber == NULL ? @0 : [numberFormatter numberFromString:argObject];
        }
    }
    return @0;
}

+ (NSInteger)toInteger:(id)argObject {
    return [[self toNumber:argObject] integerValue];
}

+ (CGFloat)toFloat:(id)argObject {
    return [[self toNumber:argObject] floatValue];
}

+ (NSDictionary *)toDictionary:(id)argObject {
    if ([argObject isKindOfClass:[NSDictionary class]]) {
        return argObject;
    }
    return @{};
}

+ (NSArray *)toArray:(id)argObject {
    if ([argObject isKindOfClass:[NSArray class]]) {
        return argObject;
    }
    return @[];
}

+ (BOOL)isValidIndexInArray:(NSArray *)argArray index:(NSInteger)argIndex {
    if ([argArray isKindOfClass:[NSArray class]] && argIndex >= 0) {
        if (argIndex < [argArray count]) {
            return YES;
        }
    }
    return NO;
}


@end
