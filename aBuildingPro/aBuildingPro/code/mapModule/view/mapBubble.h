//
//  mapBubble.h
//  Created by hong Li on 2017/10/5.
//  Copyright © 2017年 hong LiaBuilding. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface mapBubble : NSObject<MKAnnotation>
// 自动声明&实现coordinate的get方法，并且生成_coordinate这个成员变量
// 经度
@property (nonatomic) CLLocationCoordinate2D coordinate;
// 标题
@property (nonatomic, copy, nullable) NSString *title;
// 子标题
@property (nonatomic, copy, nullable) NSString *subtitle;

- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate;

@end