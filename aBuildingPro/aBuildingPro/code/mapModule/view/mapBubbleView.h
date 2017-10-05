//
//  mapBubbleView.h
//  Created by hong Li on 2017/10/5.
//  Copyright © 2017年 hong LiaBuilding. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface mapBubbleView : MKAnnotationView
+(instancetype)xg_annotationWithMapView:(MKMapView *)mapView;

@end
