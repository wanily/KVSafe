//
//  KVSTypeTranfer.h
//  KVSafe
//
//  Created by 崔 明辉 on 14/10/10.
//  Copyright (c) 2014年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface KVSTypeTranfer : NSObject

/**
 *  将对象格式化为NSString
 *
 *  @param argObject 待格式化对象
 *
 *  @return 必定为NSString
 */
+ (NSString *)toString:(id)argObject;

/**
 *  将对象格式化为NSNumber
 *
 *  @param argObject 待格式化对象
 *
 *  @return 必定为NSNumber
 */
+ (NSNumber *)toNumber:(id)argObject;

/**
 *  将对象格式化为NSInteger
 *
 *  @param argObject 待格式化对象
 *
 *  @return 必定为NSInteger
 */
+ (NSInteger)toInteger:(id)argObject;

/**
 *  将对象格式化为CGFloat
 *
 *  @param argObject 待格式化对象
 *
 *  @return 必定为CGFloat
 */
+ (CGFloat)toFloat:(id)argObject;

/**
 *  将对象格式化为NSDictionary
 *
 *  @param argObject 待格式化对象
 *
 *  @return 必定为NSDictionary
 */
+ (NSDictionary *)toDictionary:(id)argObject;

/**
 *  将对象格式化为NSArray
 *
 *  @param argObject 待格式化对象
 *
 *  @return 必定为NSArray
 */
+ (NSArray *)toArray:(id)argObject;

/**
 *  检查当前数组取值是否越界
 *
 *  @param argArray 待检查数组
 *  @param argIndex 取值下标
 *
 *  @return 未越界则返回真，越界则返回假
 */
+ (BOOL)isValidIndexInArray:(NSArray *)argArray index:(NSInteger)argIndex;

@end
