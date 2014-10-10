//
//  KVSArray.h
//  KVSafe
//
//  Created by 崔 明辉 on 14/10/10.
//  Copyright (c) 2014年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KVSArray;

@interface NSArray (KVSafe)

- (KVSArray *)formatWithPlist:(NSString *)argPlist;

- (KVSArray *)formatWithScheme:(NSArray *)argScheme;

@end

@interface KVSArray : NSArray

@end
