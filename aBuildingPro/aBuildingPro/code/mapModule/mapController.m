//
//  mapController.m
//  Created by hong Li on 2017/10/5.
//  Copyright © 2017年 hong LiaBuilding. All rights reserved.
//
#import "mapController.h"
#import <MapKit/MapKit.h>
#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AMapSearchKit/AMapSearchKit.h>
#import "mapRedBag.h"
//#import "mapBubble.h"
//#import "mapBubbleView.h"

@interface mapController ()<MAMapViewDelegate,AMapSearchDelegate>
@end
@implementation mapController{
//    MKMapView                          *_map;
//    CLLocationManager              *_manager;
//    UISegmentedControl             *_segment;
    AMapSearchAPI			*search;
    MAMapView 				*_mapView;
    NSMutableArray			*redArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=BuildString(@"mapController");
    [AMapServices sharedServices].apiKey = @"06fac939c85d9cac72622c47005f6de9";
    //开启 HTTPS 功能,  地图需要v4.5.0及以上版本才必须要打开此选项（v4.5.0以下版本，需要手动配置info.plist）
    [[AMapServices sharedServices] setEnableHTTPS:YES];
    
    //初始化地图
    _mapView = [[MAMapView alloc] initWithFrame:contentView.bounds];
    _mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _mapView.delegate=self;
    //把地图添加至view
    [contentView addSubview:_mapView];
    
    
    //获取天气数据
    search = [[AMapSearchAPI alloc] init];
    search.delegate = self;
    //设置天气查询参数
    AMapWeatherSearchRequest *request = [[AMapWeatherSearchRequest alloc] init];
    request.city = @"110000";
    request.type = AMapWeatherTypeLive; //AMapWeatherTypeLive为实时天气；AMapWeatherTypeForecase为预报天气
    //发起天气查询
	[search AMapWeatherSearch:request];
    
    [self initAnnotations];
}
#pragma mark - Initialization
- (void)initAnnotations{
    redArr = [NSMutableArray array];
    
    CLLocationCoordinate2D coordinates[10] = {
        {39.992520, 116.336170},
        {39.992520, 116.336170},
        {39.998293, 116.352343},
        {40.004087, 116.348904},
        {40.001442, 116.353915},
        {39.989105, 116.353915},
        {39.989098, 116.360200},
        {39.998439, 116.360201},
        {39.979590, 116.324219},
        {39.978234, 116.352792}
    };
    
    for (int i = 0; i < 10; ++i){
        MAPointAnnotation *a1 = [[MAPointAnnotation alloc] init];
        a1.coordinate = coordinates[i];
        a1.title      = [NSString stringWithFormat:@"anno: %d", i];
        [redArr addObject:a1];
    }
}
#pragma mark - 设置大头针坐标
//- (void)initAnnotations{
//    NSMutableArray *coordinates = [NSMutableArray array];
//    for (mapRedBag *model in redArr){
//        MAPointAnnotation *a1 = [[MAPointAnnotation alloc] init];
//        a1.coordinate = CLLocationCoordinate2DMake(model.coordinateLat,model.coordinateLng);
//        [coordinates addObject:a1];
//    }
//    [_mapView addAnnotations:coordinates];
//}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [_mapView addAnnotations:redArr];
    [_mapView showAnnotations:redArr edgePadding:UIEdgeInsetsMake(20, 20, 20, 80) animated:YES];
}
- (MAAnnotationView*)mapView:(MAMapView *)mapView viewForAnnotation:(id <MAAnnotation>)annotation {
    if ([annotation isKindOfClass:[MAPointAnnotation class]]){
        static NSString *pointReuseIndetifier = @"pointReuseIndetifier";
        MAPinAnnotationView *annotationView = (MAPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndetifier];
        if (annotationView == nil)
        {
            annotationView = [[MAPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointReuseIndetifier];
        }
        
        annotationView.canShowCallout               = YES;
        annotationView.animatesDrop                 = YES;
        annotationView.draggable                    = YES;
        annotationView.rightCalloutAccessoryView    = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        annotationView.pinColor                     = [redArr indexOfObject:annotation] % 3;
        
        return annotationView;
    }
    return nil;
}
/*!
 @brief 当选中一个annotation views时调用此接口
 @param mapView 地图View
 @param views 选中的annotation views
 */
- (void)mapView:(MAMapView *)mapView didSelectAnnotationView:(MAAnnotationView *)view {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

//当查询成功时，会进到 onWeatherSearchDone 回调函数，通过回调函数，可获取查询城市实时的以及未来3天的天气情况
- (void)onWeatherSearchDone:(AMapWeatherSearchRequest *)request response:(AMapWeatherSearchResponse *)response{
    //通过 response.lives 获取城市对应实时天气数据信息，实时天气详细信息参考 AMapLocalWeatherLive 类。
    //通过 response.forecasts 获取城市对应预报天气数据信息，预报天气详细信息参考 AMapLocalWeatherForecast 类。
    //可查询未来3天的预报天气，通过 AMapLocalWeatherForecast.casts 获取预报天气列表
    //解析response获取天气信息
}
//当查询失败时，会进入 didFailWithError 回调函数，通过该回调函数获取产生的失败的原因。
- (void)AMapSearchRequest:(id)request didFailWithError:(NSError *)error{
    NSLog(@"Error: %@", error);
}
//#pragma mark - 添加地图的模式
//-(void)addMapViewModel{
//    NSArray *array = @[@"标准",@"卫星",@"混合",@"地图卫星立交桥",@"混合立交桥"];
//    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:array];
//    segment.frame = CGRectMake(10, 100, 300, 20);
//    segment.selectedSegmentIndex = 0;
//    [segment addTarget:self action:@selector(clickMapViewModel:) forControlEvents:UIControlEventValueChanged];
//    [self.view addSubview:segment];
//    _segment = segment;
//}
//#pragma mark - 添加地图
//-(void)addMapView{
//    MKMapView *map = [[MKMapView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64)];
//    [self.view addSubview:map];
//    _map = map;
//    
//    
//    // 在地图上显示定位
//    // 1、请求授权(在Info.plist中添加NSLocationWhenInUseUsageDescription）
//    _manager = [[CLLocationManager alloc] init];
//    [_manager requestWhenInUseAuthorization];
//    
//    // 2.设置地图的用户跟踪模式
//    map.userTrackingMode = MKUserTrackingModeFollow;
//    map.delegate = self;
//    
//    // 其他的新属性
//    // 显示指南针
//    _map.showsCompass = YES;
//    // 显示感兴趣的点，默认是显示的
//    _map.showsPointsOfInterest = YES;
//    // 显示标尺(单位：mi 英尺)
//    _map.showsScale = YES;
//    // 显示交通情况
//    _map.showsTraffic = YES;
//    // 显示定位大头针，默认是显示的
//    _map.showsUserLocation = YES;
//    // 显示建筑物的3D模型，设置3D/沙盘/航拍模式(高德地图不支持)
//    _map.showsBuildings = YES;
//    
//    
//}
//#pragma mark - MKMapViewDelegate
//-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
//    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
//    [geocoder reverseGeocodeLocation:userLocation.location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
//        if (placemarks.count == 0 || error) {
//            return ;
//        }
//        CLPlacemark *pm = placemarks.lastObject;
//        _map.userLocation.title = [NSString stringWithFormat:@"%@-%@-%@",pm.administrativeArea,pm.locality,pm.subLocality];
//        _map.userLocation.subtitle = pm.name;
//        
//    }];
//}
//#pragma mark - 添加大头针
//// 大头针视图是有系统来添加的，但是大头针的数据是需要由开发者通过大头针模型来设置的
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    mapBubble *annotation = [[mapBubble alloc] init];
//    UITouch *touch = touches.anyObject;
//    CGPoint point = [touch locationInView:_map];
//    CLLocationCoordinate2D coor = [_map convertPoint:point toCoordinateFromView:_map];
//    annotation.coordinate = coor;
//    annotation.title = @"xiao66guo";
//    annotation.subtitle = @"😋呵呵呵呵呵";
//    [_map addAnnotation:annotation];
//    [self.view endEditing:YES];
//}
//
//#pragma mark - 大头针的重用
//-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
//    // 排除已经定位的大头针
//    if ([annotation isKindOfClass:[MKUserLocation class]]) {
//        return nil;
//    }
//    mapBubbleView *anV = [mapBubbleView xg_annotationWithMapView:_map];
//    
//    return anV;
//}
//#pragma mark - 当已经添加大头针视图后调用(还没有显示在地图上)该方法可以用来设置自定义动画
//-(void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray<MKAnnotationView *> *)views{
//    for (MKAnnotationView *anv in views) {
//        // 排除定位的大头针
//        if ([anv.annotation isKindOfClass:[MKUserLocation class]]) {
//            return;
//        }
//        CGRect targetRect = anv.frame;
//        // 修改位置
//        anv.frame = CGRectMake(targetRect.origin.x, 0, targetRect.size.width, targetRect.size.height);
//        [UIView animateWithDuration:0.3 animations:^{
//            anv.frame = targetRect;
//        }];
//    }
//}


#pragma mark - 视图即将显示 - 消失、被覆盖或是隐藏 - 内存报警
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
- (void)didReceiveMemoryWarning {[super didReceiveMemoryWarning];}
@end