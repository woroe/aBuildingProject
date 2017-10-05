//
//  mapBubbleView.m
//  Created by hong Li on 2017/10/5.
//  Copyright © 2017年 hong LiaBuilding. All rights reserved.
//
#import "mapBubbleView.h"

@implementation mapBubbleView
+(instancetype)xg_annotationWithMapView:(MKMapView *)mapView{
    // 实现重用
    static NSString *ID = @"annotation";
    mapBubbleView *anV = (mapBubbleView *)[mapView dequeueReusableAnnotationViewWithIdentifier:ID];
    if (nil == anV) {
        anV = [[mapBubbleView alloc] initWithAnnotation:nil reuseIdentifier:ID];
        anV.image = [UIImage imageNamed:@"pic"];
        // 设置标注
        anV.canShowCallout = YES;
        anV.leftCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeInfoLight];
        anV.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeInfoDark];
    }
    return anV;
}

-(void)setAnnotation:(id<MKAnnotation>)annotation{
    [super setAnnotation:annotation];
}
@end
