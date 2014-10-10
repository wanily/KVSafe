//
//  KVSafe.h
//  KVSafe
//
//  Created by 崔 明辉 on 14/10/10.
//  Copyright (c) 2014年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

/**
 *  KVSafe lets you use NSDictionary & NSArray never crash.
 *  Because of JSON is type mutable DataSet, and network services are unstable.
 *  We USE Plist and KVSafe to promise the data type always return we expected.
 */

#import <Foundation/Foundation.h>
#import "KVSDictionary.h"
#import "KVSArray.h"

@interface KVSafe : NSObject

@end
