//
//  pubMethod.m
//  Created by hong Li on 2017/10/5.
//  Copyright © 2017年 hong LiaBuilding. All rights reserved.
//

#import "pubMethod.h"

@implementation pubMethod

#pragma mark - 是否为空字符串
+(BOOL)isEmptyString:(NSString*)temp{
    if (temp == nil || temp == NULL || (NSNull *)temp ==[NSNull null] || [temp isKindOfClass:[NSNull class]]) {
        return YES;
    }else if (![temp isKindOfClass:[NSString class]] || temp.length==0) {
        return YES;
    }else{
        NSRange rang = [temp rangeOfString:@"null"];
        if (rang.location!=NSNotFound) {return YES;}
    }
    return NO;
}
#pragma mark - 判断是否为整形：²º¹
+(BOOL)isBareInt:(NSString*)str{
    NSString *temp=[NSString stringWithFormat:@"%@",str];
    if ([self isEmptyString:temp]) {return NO;}
    NSScanner* scan = [NSScanner scannerWithString:temp];int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}
#pragma mark - 判断是否为浮点形： NSScanner类用于在字符串中从头到尾地扫描指定的字符,将字符串中的数字或指定字符串提取出来，默认忽略空白字符和换行符。
+(BOOL)isBareFloat:(NSString*)str{
    NSString *temp=[NSString stringWithFormat:@"%@",str];
    if ([self isEmptyString:temp]) {return NO;}
    NSScanner* scan = [NSScanner scannerWithString:temp];float val;
    return [scan scanFloat:&val] && [scan isAtEnd];
}
#pragma mark - 字符串变 浮点数字
+(float)getFloatWithString:(NSString *)str{
    NSString *temp=[NSString stringWithFormat:@"%@",str];
    if ([self isEmptyString:temp]) {return 0.0;}
    if([self isBareInt:temp] || [self isBareFloat:temp]){
        return [temp floatValue];
    }
    return 0.0;
}
#pragma mark - 字符串变 整形数字
+(int)getIntWithString:(NSString *)str{
    NSString *temp=[NSString stringWithFormat:@"%@",str];
    if ([self isEmptyString:temp]) {return 0;}
    if([self isBareInt:temp] || [self isBareFloat:temp]){
        return [temp intValue];
    }
    return 0;
}
#pragma mark - 字符串变 长整形数字
+(long long)getLongWithString:(NSString *)str{
    NSString *temp=[NSString stringWithFormat:@"%@",str];
    if ([self isEmptyString:temp]) {return 0;}
    NSScanner* scan = [NSScanner scannerWithString:temp];
    long long val;
    if ([scan scanLongLong:&val] && [scan isAtEnd]) {
        return [temp longLongValue];
    }
    return 0;
}
#pragma mark - 字符串变 有值字符串
+(NSString *)getStringWithString:(NSString *)str{
    NSString *kk=[NSString stringWithFormat:@"%@",str];
    if ([self isEmptyString:kk]) {return @"";}
    return kk;
}


@end
