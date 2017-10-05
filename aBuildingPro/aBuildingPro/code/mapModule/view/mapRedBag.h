//
//  mapRedBag.h
//  Created by hong Li on 2017/10/5.
//  Copyright © 2017年 hong LiaBuilding. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface mapRedBag : NSObject
//纬度
@property(nonatomic,assign) double coordinateLat;
//经度
@property(nonatomic,assign) double coordinateLng;
// 标题
@property (nonatomic, copy) NSString *title;
@end
