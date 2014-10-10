//
//  KVSDictionary.h
//  KVSafe
//
//  Created by 崔 明辉 on 14/10/10.
//  Copyright (c) 2014年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KVSDictionary;

@interface NSDictionary (KVSafe)

- (KVSDictionary *)formatWithPlist:(NSString *)argPlist;

- (KVSDictionary *)formatWithScheme:(NSDictionary *)argScheme;

@end

@interface KVSDictionary : NSDictionary

@end
