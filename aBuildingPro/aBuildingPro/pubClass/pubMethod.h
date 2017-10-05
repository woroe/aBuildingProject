//
//  pubMethod.h
//  Created by hong Li on 2017/10/5.
//  Copyright © 2017年 hong LiaBuilding. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface pubMethod : NSObject

/** 是否为空字符串 */
+(BOOL)isEmptyString:(NSString*)temp;
/** 判断是否为整形：²º¹ */
+(BOOL)isBareInt:(NSString*)str;
/** 判断是否为浮点形 */
+(BOOL)isBareFloat:(NSString*)str;

/** 字符串变 浮点数字 */
+(float)getFloatWithString:(NSString *)str;
/** 字符串变 整形数字 */
+(int)getIntWithString:(NSString *)str;
/** 字符串变 长整形数字 */
+(long long)getLongWithString:(NSString *)str;
/** 字符串变 有值字符串 */
+(NSString *)getStringWithString:(NSString *)str;


@end
